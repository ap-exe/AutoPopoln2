unit CopyFileThread;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ComCtrls, Masks, Windows, Main;


type
  TCopyFileThread = class(TThread)
  private
    FSizeFiles,              // общий размер найденных файлов
    FPosition: Int64;        // позиция для прогрессбара при копировании файлов
    FSrcDir,                 // исходная папка
    FDestDir,                // папка куда все копируется
    FMask,                   // маска файлов
    FName: string;           // имя файла которое сейчас копируется
    FReplace: boolean;       // заменять файлы при копировании или нет
    function FindFiles(StartFolder, Mask: string; List: TStringList;
      ScanSubFolders: Boolean = False; SearchDir: boolean = False): Int64;
    procedure CopyFiles(FileNames: TStringList; SizeFiles: Int64; DestDir: string;
      Replace: boolean = False; CreateDir: boolean = False);
  protected
    procedure Execute; override;
    procedure ShowProgress;
  public
    FFileNames: TStringList; // список найденых файлов
    constructor Create(SrcDir, DestDir, Mask: string; Replace: boolean);
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
// FileNames - список файлов
// SizeFiles - размер всех файлов полученый из функции FindFiles
// DestDir - папка куда все копируется
// Replace - Заменять файлы или нет?
// CreateDir - создавать папки или все в DestDir свалить?
procedure TCopyFileThread.CopyFiles(FileNames: TStringList; SizeFiles: Int64; DestDir: string;
  Replace: boolean = False; CreateDir: boolean = False);
var
  InStream, OutStream: TFileStream;
  Temp: array[0..$FFFF] of Byte;
  i, stemp: integer;
  OutFile, s: string;
begin
  FPosition:=0;
  if (FileNames.Count=0) or (DestDir='') then Exit;
  ForceDirectories(DestDir);
  try
    for i:=0 to FileNames.Count-1 do begin
      ZeroMemory(@Temp, sizeof(Temp));
      InStream := TFileStream.Create(FileNames[i], fmOpenRead);

      if CreateDir then begin
        s:=DestDir+Copy(ExtractFilePath(FileNames[i]),
          Length(FSrcDir)+1, Length(FileNames[i]));
        ForceDirectories(s);
        OutFile:=s+ExtractFileName(FileNames[i]);
      end
      else
        OutFile:=DestDir+'\'+ExtractFileName(FileNames[i]);
      OutStream := TFileStream.Create(OutFile, fmCreate);
      try
        if FileExists(OutFile) and Replace then
          SysUtils.DeleteFile(OutFile);
        FName:=ExtractFileName(FileNames[i]);
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
constructor TCopyFileThread.Create(SrcDir, DestDir, Mask: string; Replace: boolean);
begin
  inherited Create(True);
  FFileNames:=TStringList.Create;
  FSizeFiles:=0;
  FDestDir:=DestDir;
  FSrcDir:=SrcDir;
  FMask:=Mask;
  FReplace:=Replace;
  //FreeOnTerminate:=True;
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
    ProgressBar1.Max:=round((FSizeFiles/1024)/1024);
    ProgressBar1.Position:=round((FPosition/1024)/1024);
    // показываем прогресс копирования фалйов на панели задач
    if CheckWin32Version(6,1) then
      iTaskBar.SetProgressValue(MainForm.Handle, UInt64(ProgressBar1.Position),
        UInt64(ProgressBar1.Max));
  end;
end;

// запуск поиска и копирования файлов в потоке
procedure TCopyFileThread.Execute;
begin
  FSizeFiles:=FindFiles(FSrcDir, FMask, FFileNames, true);
  CopyFiles(FFileNames, FSizeFiles, FDestDir, True);
end;

end.

