unit CopyFileThread;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ComCtrls, Masks, Main;

type
  TCopyFileThread = class(TThread)
  private
    FSizeFiles,              // общий размер найденных файлов
    FPosition: Int64;        // позиция для прогрессбара при копировании файлов
    FSrcDir,                 // исходная папка
    FDestDir,                // папка куда все копируется
    FMask,                   // маска файлов
    FName: string;           // имя файла которое сейчас копируется
    FReplace,                // заменять файлы при копировании или нет
    FCreateDir: boolean;
    function FindFiles(StartFolder, Mask: string; List: TStringList;
      ScanSubFolders: Boolean = False; SearchDir: boolean = False): Int64;
    procedure CopyFiles;
  protected
    procedure Execute; override;
    procedure ShowProgress;
  public
    FFileNames: TStringList; // список найденых файлов
    constructor Create(SrcDir, DestDir, Mask: string; Replace, CreateDir: boolean);
    destructor Destroy; override;
  end;

implementation

{ TCopyFileThread }

// Функция поиска файлов и папок по маске.
// Возвращает размер всех найденных файлов
// StartFolder - папка в которой будет производиться поиск
// Mask - Маска файлов. Можно указывать несколько через ";". Пример "*.exe;*.bat"
// List - список всех найденных файлов
// ScanSubFolders - сканировать подпапки?
// SearchDir - искать в названиях папок?
function TCopyFileThread.FindFiles(StartFolder, Mask: string; List: TStringList;
  ScanSubFolders: Boolean = False; SearchDir: boolean = False): Int64;
var
  SearchRec: TSearchRec;
  FindResult: Integer;
begin
  Result:=0;
  List.BeginUpdate;
  try
    StartFolder := StartFolder+'\';
    FindResult := FindFirst(StartFolder + '*.*', faAnyFile, SearchRec);
    try
      while FindResult = 0 do
        with SearchRec do begin
          if (Attr and faDirectory) <> 0 then begin
            if MatchesMaskList(Name, Mask) and SearchDir then
              List.Add(StartFolder + Name);

            if ScanSubFolders and (Name <> '.') and (Name <> '..') then
              Result:=Result+FindFiles(StartFolder + Name, Mask, List, ScanSubFolders);
          end
          else
            if MatchesMaskList(Name, Mask) then begin
              List.Add(StartFolder + Name);
              Result:=Result+SearchRec.Size;
            end;
          FindResult := FindNext(SearchRec);
        end;
    finally
      SysUtils.FindClose(SearchRec);
    end;
  finally
    List.EndUpdate;
  end;
end;

// Процедура копирования файлов
procedure TCopyFileThread.CopyFiles;
var
  InStream, OutStream: TFileStream;
  i, stemp: integer;
  OutFile, s: string;
begin
  FPosition := 0;
  if (FFileNames.Count=0) or (FDestDir='') then Exit;
  try
    for i:=0 to FFileNames.Count-1 do begin
      InStream := TFileStream.Create(FFileNames[i], fmOpenRead);

      if FCreateDir then begin
        s:=FDestDir+Copy(ExtractFilePath(FFileNames[i]),
          Length(FSrcDir)+1, Length(FFileNames[i]));
        ForceDirectories(s);
        OutFile:=s+ExtractFileName(FFileNames[i]);
      end
      else
        OutFile:=FDestDir+'\'+ExtractFileName(FFileNames[i]);

      if FileExists(OutFile) and FReplace then
        SysUtils.DeleteFile(OutFile);
      OutStream := TFileStream.Create(OutFile, fmCreate);
      FName:=ExtractFileName(FFileNames[i]);

      InStream.Position := OutStream.Size;
      OutStream.Position := OutStream.Size;
      FPosition := FPosition + InStream.Position;

      try
        while InStream.Size <> OutStream.Size do begin
          stemp:=65536;
          if (InStream.Size - OutStream.Position) < 65536 then begin
            stemp:=InStream.Size - OutStream.Position;
            OutStream.CopyFrom(InStream, stemp)
          end
          else
            OutStream.CopyFrom(InStream, stemp);
          FPosition:=FPosition+stemp;
          Synchronize(@ShowProgress);
        end;
      finally
        InStream.Free;
        OutStream.Free;
      end;
    end;
  except
    on e:Exception do MessageDlg(e.message, mtError, [mbOk], 0);
  end;
end;

// инициализируем поток
constructor TCopyFileThread.Create(SrcDir, DestDir, Mask: string; Replace, CreateDir: boolean);
begin
  inherited Create(True);
  FFileNames:=TStringList.Create;
  FSizeFiles:=0;
  FDestDir:=DestDir;
  FSrcDir:=SrcDir;
  FMask:=Mask;
  FReplace:=Replace;
  FCreateDir:=CreateDir;
end;

destructor TCopyFileThread.Destroy;
begin
  FFileNames.Free;
  inherited Destroy;
end;

// показ прогресса копирования
procedure TCopyFileThread.ShowProgress;
begin
  with MainForm do begin
    TotalCopyLabel.Caption:='Копируется '+FName;
    ProgressBar1.Max:=FSizeFiles;
    ProgressBar1.Position:=round((FPosition/1024)/1024); //пересчитываем в МБ
    // показываем прогресс копирования файлов на панели задач
    if CheckWin32Version(6,1) then
      iTaskBar.SetProgressValue(MainForm.Handle, UInt64(ProgressBar1.Position),
        UInt64(ProgressBar1.Max));
  end;
end;

// запуск поиска и копирования файлов в потоке
procedure TCopyFileThread.Execute;
begin
  // поиск файлов. размер найденных файлов персчитавется в МБ
  FSizeFiles:=round((FindFiles(FSrcDir, FMask, FFileNames, true)/1024)/1024);
  CopyFiles;
end;

end.

