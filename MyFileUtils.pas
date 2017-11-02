unit MyFileUtils;

interface

uses
  Windows, SysUtils, Classes, ComObj, Masks, ShellApi, Graphics, Forms, Dialogs,
  Controls;

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

var
  drive: array [0..25] of Char=('A','B','C','D','E','F','G','H','I','J','K','L',
                        'M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z');

implementation

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


// Функция копирования файлов с поддержкой докачки
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

end.
