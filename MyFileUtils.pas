unit MyFileUtils;

interface

uses
  Windows, SysUtils, Classes, ComObj, Masks, ShellApi, Graphics, Forms, Dialogs, StdCtrls,
  Controls, ShlObj, ActiveX, RichMemo, ComCtrls, ValEdit, zlibfunc, main;

{$IFDEF UNICODE}
    function PrivateExtractIcons(lpszFile: PChar; nIconIndex, cxIcon, cyIcon: integer; phicon: PHANDLE; piconid: PDWORD; nicon, flags: DWORD): DWORD; stdcall ; external 'user32.dll' name 'PrivateExtractIconsW';
{$ELSE}
    function PrivateExtractIcons(lpszFile: PChar; nIconIndex, cxIcon, cyIcon: integer; phicon: PHANDLE; piconid: PDWORD; nicon, flags: DWORD): DWORD; stdcall ; external 'user32.dll' name 'PrivateExtractIconsA';
{$ENDIF}

Type
  TCallBack=procedure (Position, FileSize: Int64); {Для индикации процесса копирования}

  procedure FindFiles(StartFolder, Mask: string; List: TStrings;
    ScanSubFolders: Boolean = True);
  function CopyFileEx(const InFile, OutFile: string; Replace: boolean;
    CallBack: TCallBack): boolean;
  function FileVersion(const FileName: TFileName): String;
  procedure RunAsAdministrator(const source: string; const params: string = '');
  function GetFileNameFromLink(LinkFileName: string): string;
  function GetDesktopDir: string;
  function FindCons: string;
  function LoadLST(FileName, tmp: string; PC: TPageControl; LE: TValueListEditor; LF: TStringList): boolean;
  procedure SaveLST(FileName, tmp: string; PC: TPageControl; LE: TValueListEditor; LF: TStringList);
  function LoadRTF(FileName: string; rm: TRichMemo): boolean;
  function SaveRTF(FileName: string; rm: TRichMemo): boolean;
  function GetLocalTmpPath: string;
  procedure DelFiles(Path, Mask: string);

implementation

////////////////////////////////////////////////////////////////////////
// измененные функции из файла zlibfunc
// удалил из функции запись в сжатый файл путей к файлам
function MyCompressFiles(Files: TStrings): TStream;
var
  I: Integer;
  S: string;
begin
  Result := TMemoryStream.Create;
  if Files.Count = 0 then
    Exit;

  for I := 0 to Files.Count - 1 do
  begin
    S := ExtractFileName(Files[I]);
    AddFile(S, '', Files[I], Result);
  end;

  Result.Position := 0;
end;
procedure MyCompressFiles2(Files: TStrings; const FileName: string);
var
  TmpStream: TStream;
begin
  TmpStream := MyCompressFiles(Files);
  try
    TMemoryStream(TmpStream).SaveToFile(FileName);
  finally
    TmpStream.Free;
  end;
end;
/////////////////////////////////////////////////////////////////////

// процедура поиска файлов
procedure FindFiles(StartFolder, Mask: string; List: TStrings;
  ScanSubFolders: Boolean = True);
var
  SearchRec: TSearchRec;
  FindResult: Integer;
begin
  List.BeginUpdate;
  try
    StartFolder := IncludeTrailingBackslash(StartFolder);
    FindResult := FindFirst(StartFolder + '*.*', faAnyFile, SearchRec);
    try
      while FindResult = 0 do
        with SearchRec do
        begin
          if (Attr and faDirectory) <> 0 then
          begin
            if MatchesMaskList(Name, Mask) then
              List.Add(StartFolder + Name);

            if ScanSubFolders and (Name <> '.') and (Name <> '..') then
              FindFiles(StartFolder + Name, Mask, List, ScanSubFolders);

            Application.ProcessMessages;
          end
          else
          begin
            if MatchesMaskList(Name, Mask) then
              List.Add(StartFolder + Name);
          end;
          FindResult := FindNext(SearchRec);
        end;
    finally
      FindClose(SearchRec);
    end;
  finally
    List.EndUpdate;
  end;
end;


// Функция копирования файлов
function CopyFileEx(const InFile, OutFile: string; Replace: boolean;
  CallBack: TCallBack): boolean;
var
  InStream, OutStream: TFileStream;
  Temp: array[0..$FFFF] of Byte;
  Access: Integer;
begin
  Result:=False;
  if (InFile='') or (OutFile='') then Exit;

  Access := fmOpenReadWrite;
  ZeroMemory(@Temp, sizeof(Temp));
  InStream := TFileStream.Create(InFile, fmOpenRead);
  if not FileExists(OutFile) then
    Access := fmCreate;
  OutStream := TFileStream.Create(OutFile, Access);
  try
    if not Replace then begin
      InStream.Position := OutStream.Size;
      OutStream.Position := OutStream.Size;
    end
    else begin
      InStream.Position := 0;
      OutStream.Position := 0;
    end;

    if Assigned(CallBack) then CallBack( InStream.Position, InStream.Size );
    while InStream.Size <> OutStream.Size do
    begin
      if (InStream.Size - OutStream.Position) < sizeof(Temp) then
      begin
        OutStream.CopyFrom(InStream, InStream.Size - OutStream.Position);
      end
      else
        OutStream.CopyFrom(InStream, sizeof(Temp));

      if Assigned(CallBack) then CallBack(InStream.Position, InStream.Size);
    end;
  finally
    InStream.Free;
    OutStream.Free;
  end;
  Result:=True;
end;

// функция возвращает версию exe-файла
function FileVersion(const FileName: TFileName): String;
var
  VerInfoSize: Cardinal;
  VerValueSize: Cardinal;
  Dummy: Cardinal;
  PVerInfo: Pointer;
  PVerValue: PVSFixedFileInfo;
begin
  Result := '';
  VerInfoSize := GetFileVersionInfoSize(PChar(FileName), Dummy);
  GetMem(PVerInfo, VerInfoSize);
  try
    if GetFileVersionInfo(PChar(FileName), 0, VerInfoSize, PVerInfo) then
      if VerQueryValue(PVerInfo, '\', Pointer(PVerValue), VerValueSize) then
        with PVerValue^ do
          Result := Format('Версия %d.%d.%d.%d', [
            HiWord(dwFileVersionMS), //Major
            LoWord(dwFileVersionMS), //Minor
            HiWord(dwFileVersionLS), //Release
            LoWord(dwFileVersionLS)]); //Build
  finally
    FreeMem(PVerInfo, VerInfoSize);
  end;
end;

// процедура запуска программ от имени админа
procedure RunAsAdministrator(const source: string; const params: string = '');
var
  shExecInfo: LPSHELLEXECUTEINFO;
begin
  New(shExecInfo);
  shExecInfo^.cbSize := sizeof(SHELLEXECUTEINFO);
  shExecInfo^.fMask := 0;
  shExecInfo^.Wnd := 0;
  shExecInfo^.lpVerb := 'runas';
  shExecInfo^.lpFile := PChar(ExtractFileName(source));
  shExecInfo^.lpParameters := PChar(params);
  shExecInfo^.lpDirectory := PChar(ExtractFilePath(source));
  shExecInfo^.nShow := SW_SHOWNORMAL;
  shExecInfo^.hInstApp := 0;
  ShellExeCuteExA(shExecInfo);
  Dispose(shExecInfo);
  shExecInfo := nil;
end;

// функция получение имени файла из его ярлыка
function GetFileNameFromLink(LinkFileName: string): string;
var
  MyObj: IUnknown;
  SL: IShellLink;
  PF: IPersistFile;
  FindData: TWin32FINDDATA;
  FullPathToLnk: array[0..MAX_PATH] of WideChar;
  Buff: array[0..MAX_PATH] of Char;
begin
  Result:='';
  if not FileExists(LinkFileName) then Exit;

  MyObj:=CreateComObject(CLSID_ShellLink);
  PF:=MyObj as IPersistFile;
  SL:=MyObj as IShellLink;
  StringToWideChar(LinkFileName, FullPathToLnk, SizeOf(FullPathToLnk));
  PF.Load(FullPathToLnk, STGM_READ);
  SL.GetPath(Buff, MAX_PATH, FindData, SLGP_UNCPRIORITY);
  Result:=Buff;
end;

// функция определения папки рабочего стола
function GetDesktopDir: string;
var
  idl: PITEMIDLIST;
  tmp: LPSTR;
begin
  Result:='';
  SHGetSpecialFolderLocation(0, CSIDL_DESKTOPDIRECTORY, idl);
  try
    tmp:=StrAlloc(MAX_PATH);
    if SHGetPathFromIDList(idl, tmp) then
      Result:=tmp;
  finally
    CoTaskMemFree(idl);
  end;
end;

// функция пытается найти где установлен Консультант
function FindCons: string;
var
  l: TStringList;
  i: integer;
  s, s2: string;
begin
  Result:='';
  // пытаемся найти в папке c:\consultant
  if FileExists('c:\consultant\cons.exe') then begin
    Result:='c:\consultant';
    Exit;
  end;
  // если не нашли, пытемся найти ярлык на рабочем столе с Консультантом
  // и по нему определить папку где он установлен
  l:=TStringList.Create;
  try
    FindFiles(GetDesktopDir, '*.lnk', l, False);
    for i:=0 to l.Count-1 do begin
      s:=GetFileNameFromLink(l[i]);
      if ExtractFileName(s)='cons.exe' then begin
        s2:=ExtractFilePath(s);
        Result:=Copy(s2, 0, Length(s2)-1);
        Exit;
      end;
    end;
  finally
    l.Free;
  end;
end;

// загрузка LST файла
function LoadLST(FileName, tmp: string; PC: TPageControl; LE: TValueListEditor; LF: TStringList): boolean;
var
  ini: TStringList;
  TabSheet: TTabSheet;
  RM: TRichMemo;
  i: integer;
  s: string;
begin
  Result := False;
  if FileExists(FileName) then begin
    DelFiles(tmp, '*');
    DecompressFile(FileName, tmp, True, False);
    LF.Clear;
    // загрузка описания баз
    if LE <> nil then begin
      LE.Strings.Clear;
      LE.Strings.LoadFromFile(tmp + 'bases.txt', TEncoding.Default);
      LF.Add(tmp + 'bases.txt');
    end;
    for i := PC.PageCount - 1 downto 1 do
      PC.Page[i].Free;

    if FileExists(tmp + 'listtabs.ini') then begin
      ini := TStringList.Create;
      try
        // загрузка описания вкладок из ini файла
        ini.LoadFromFile(tmp + 'listtabs.ini', TEncoding.Default);
        LF.Add(tmp + 'listtabs.ini');
        // добавление вкладок и загрузка в них RTF файлов
        for i := 0 to ini.Count - 1 do begin
          TabSheet := TTabSheet.Create(nil);
          TabSheet.Caption := Copy(ini[i], 0, Pos('=', ini[i]) - 1);
          TabSheet.PageControl := PC;
          RM := TRichMemo.Create(nil);
          RM.Parent := TabSheet;
          RM.Align := alClient;
          RM.ScrollBars := ssBoth;
          RM.BorderStyle := bsNone;
          // пришлось использовать этот костыль, чтоб проги компилировались
          // по непонятной причине в AP компилится без @, а в EditBases с @
          {$IFDEF ap}
            RM.OnMouseWheel := MainForm.RichMemo1MouseWheel;
            RM.ReadOnly := True;
          {$ELSE}
            RM.OnMouseWheel := @MainForm.RichMemo1MouseWheel;
          {$ENDIF}
          s := tmp + Copy(ini[i], Pos('=', ini[i]) + 1, Length(ini[i]) - 1);
          Result := LoadRTF(s, RM);
          LF.Add(s);
        end;
      finally
        ini.Free;
      end;
    end;
    if FileExists(tmp + 'bases.txt') then
      Result := True;
  end;
end;

// сохранение LST файла
procedure SaveLST(FileName, tmp: string; PC: TPageControl; LE: TValueListEditor; LF: TStringList);
begin
  LE.Strings.SaveToFile(tmp + 'bases.txt');
  if FileExists(tmp + 'listtabs.ini') then
    LF.Add(tmp + 'listtabs.ini');
  MyCompressFiles2(LF, FileName);
end;

// загрузка RTF файла
function LoadRTF(FileName: string; rm: TRichMemo): boolean;
var
  f: TFileStream;
begin
  Result:=False;
  if FileExists(FileName) then begin
    f := TFileStream.Create(FileName, fmOpenRead);
    try
      Result := rm.LoadRichText(f);
    finally
      f.Free;
    end;
  end;
end;

// сохранение RTF Файла
function SaveRTF(FileName: string; rm: TRichMemo): boolean;
var
  f: TFileStream;
begin
  Result := False;
  if FileName <> '' then begin
    f := TFileStream.Create(FileName, fmCreate);
    try
      Result := rm.SaveRichText(f);
    finally
      f.Free;
    end;
  end;
end;

// путь к папке temp
function GetLocalTmpPath: string;
var
  buffer: array [0..255] of Char;
  s: string;
begin
  Result := ExtractFilePath(Application.ExeName) + 'temp\';
  GetTempPath(256, buffer);
  s := StrPas(buffer);
  if s <> '' then Result := s;
end;

// удаление всех файлов в папке
procedure DelFiles(Path, Mask: string);
var
  list: TStringList;
  i: integer;
begin
  list := TStringList.Create;
  try
    FindFiles(Path, Mask, list, False);
    for i := 0 to list.Count - 1 do
      DeleteFile(list[i]);
  finally
    list.Free;
  end;
end;

end.
