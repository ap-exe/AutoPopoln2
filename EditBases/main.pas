unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, RichMemo, Forms, Controls, Graphics, Dialogs,
  ComCtrls, Menus, ValEdit, ExtCtrls, StdCtrls, Windows, zlibfunc, MyFileUtils;

type

  { TMainForm }

  TMainForm = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    MainMenu1: TMainMenu;
    FileMenuItem: TMenuItem;
    LoadError: TMenuItem;
    AddItemBasesPop: TMenuItem;
    DelItemBasesPop: TMenuItem;
    SaveError: TMenuItem;
    MenuItem12: TMenuItem;
    LoadKey: TMenuItem;
    SaveKey: TMenuItem;
    ExitItem: TMenuItem;
    MenuItem16: TMenuItem;
    AddItemBases: TMenuItem;
    DelItemBases: TMenuItem;
    OpenLST: TMenuItem;
    SaveLST: TMenuItem;
    EditMenuItem: TMenuItem;
    MenuItem6: TMenuItem;
    LoadBasesTXT: TMenuItem;
    SaveBasesTXT: TMenuItem;
    MenuItem9: TMenuItem;
    OpenDialog1: TOpenDialog;
    PageControl1: TPageControl;
    BasesPopupMenu: TPopupMenu;
    ErrEdit: TRichMemo;
    KeyEdit: TRichMemo;
    SaveDialog1: TSaveDialog;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    BasesListEditor: TValueListEditor;
    About: TTabSheet;
    procedure AddItemBasesClick(Sender: TObject);
    procedure BasesListEditorStringsChange(Sender: TObject);
    procedure DelItemBasesClick(Sender: TObject);
    procedure ErrEditKeyPress(Sender: TObject; var Key: char);
    procedure ExitItemClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
    procedure FormCreate(Sender: TObject);
    procedure KeyEditKeyPress(Sender: TObject; var Key: char);
    procedure LoadBasesTXTClick(Sender: TObject);
    procedure LoadErrorClick(Sender: TObject);
    procedure LoadKeyClick(Sender: TObject);
    procedure OpenLSTClick(Sender: TObject);
    procedure SaveBasesTXTClick(Sender: TObject);
    procedure SaveErrorClick(Sender: TObject);
    procedure SaveKeyClick(Sender: TObject);
    procedure SaveLSTClick(Sender: TObject);
  private
    tmp: string;
    Change: boolean;
    ListFiles: TStringList;
    function LoadRTF(FileName: string; rm: TRichMemo): boolean;
    function SaveRTF(FileName: string; rm: TRichMemo): boolean;
    procedure LoadLST(FileName: string);
    procedure SetChange(Changes: boolean);
    function GetLocalTmpPath: string;
  public

  end;

var
  MainForm: TMainForm;

implementation

{$R *.frm}

{ TMainForm }

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
procedure MyCompressFiles(Files: TStrings; const FileName: string);
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

// загрузка RTF файла
function TMainForm.LoadRTF(FileName: string; rm: TRichMemo): boolean;
var
  f: TFileStream;
begin
  Result:=False;
  if FileExists(FileName) then begin
    f:=TFileStream.Create(FileName, fmOpenRead);
    try
      Result:=rm.LoadRichText(f);
    finally
      f.Free;
    end;
  end;
end;

// сохранение RTF Файла
function TMainForm.SaveRTF(FileName: string; rm: TRichMemo): boolean;
var
  f: TFileStream;
begin
  Result:=False;
  if FileName<>'' then begin
    f:=TFileStream.Create(FileName, fmCreate);
    try
      Result:=rm.SaveRichText(f);
    finally
      f.Free;
    end;
  end;
end;

// путь к папке temp
function TMainForm.GetLocalTmpPath: string;
var
  buffer: array [0..255] of Char;
  s: string;
begin
  Result:=ExtractFilePath(Application.ExeName)+'temp\';
  GetTempPath(256, buffer);
  s:=StrPas(buffer);
  if s<>'' then Result:=s;
end;

// открытие LST файла
procedure TMainForm.OpenLSTClick(Sender: TObject);
begin
  OpenDialog1.FileName:='bases.lst';
  OpenDialog1.Filter:='*.lst|*.lst';
  if OpenDialog1.Execute then begin
    BasesListEditor.Strings.Clear;
    ErrEdit.Lines.Clear;
    KeyEdit.Lines.Clear;
    LoadLST(OpenDialog1.FileName);
  end;
  SetChange(False);
end;

// сохранение описания баз в текстовый файл
procedure TMainForm.SaveBasesTXTClick(Sender: TObject);
begin
  SaveDialog1.FileName:='bases.txt';
  SaveDialog1.Filter:='*.txt|*.txt';
  if SaveDialog1.Execute then
    if ExtractFileExt(SaveDialog1.FileName)='.txt' then
      BasesListEditor.Strings.SaveToFile(SaveDialog1.FileName)
    else
      BasesListEditor.Strings.SaveToFile(ChangeFileExt(SaveDialog1.FileName, '.txt'));
end;

// сохранение описания ошибок в rtf
procedure TMainForm.SaveErrorClick(Sender: TObject);
begin
  SaveDialog1.FileName:='errors.rtf';
  SaveDialog1.Filter:='*.rtf|*.rtf';
  if SaveDialog1.Execute then
    if ExtractFileExt(SaveDialog1.FileName)='.rtf' then
      SaveRTF(SaveDialog1.FileName, ErrEdit)
    else
      SaveRTF(ChangeFileExt(SaveDialog1.FileName, '.rtf'), ErrEdit);
end;

// сохранение описание ключей коммандной в rtf
procedure TMainForm.SaveKeyClick(Sender: TObject);
begin
  SaveDialog1.FileName:='keys.rtf';
  SaveDialog1.Filter:='*.rtf|*.rtf';
  if SaveDialog1.Execute then
    if ExtractFileExt(SaveDialog1.FileName)='.rtf' then
     SaveRTF(SaveDialog1.FileName, KeyEdit)
    else
      SaveRTF(ChangeFileExt(SaveDialog1.FileName, '.rtf'), KeyEdit);
end;

// сохранение LST файла
procedure TMainForm.SaveLSTClick(Sender: TObject);
begin
  SaveDialog1.FileName:='bases.lst';
  SaveDialog1.Filter:='*.lst|*.lst';
  if SaveDialog1.Execute then begin
    if ExtractFileExt(SaveDialog1.FileName)='.lst' then
      MyCompressFiles(ListFiles, SaveDialog1.FileName)
    else
      MyCompressFiles(ListFiles, ChangeFileExt(SaveDialog1.FileName, '.lst'));
    SetChange(False);
  end;
end;

// загрузка LST файла
procedure TMainForm.LoadLST(FileName: string);
begin
  if FileExists(FileName) then begin
    DecompressFile(FileName, tmp, True, False);
    BasesListEditor.Strings.LoadFromFile(tmp+'bases.txt', TEncoding.Default);
    LoadRTF(tmp+'errors.rtf', ErrEdit);
    LoadRTF(tmp+'keys.rtf', KeyEdit);
    ListFiles.Clear;
    ListFiles.Add(tmp+'bases.txt');
    ListFiles.Add(tmp+'errors.rtf');
    ListFiles.Add(tmp+'keys.rtf');
  end
  else
    MessageDlg('Ошибка', 'Не найден файл bases.lst!', mtError, [mbOk], 0);
end;

// процедура изменения статуса программы
procedure TMainForm.SetChange(Changes: boolean);
begin
  if Changes then
    MainForm.Caption:='Редактирование bases.lst *'
  else
    MainForm.Caption:='Редактирование bases.lst';
  Change:=Changes;
end;

// вставка строки в описании баз
procedure TMainForm.AddItemBasesClick(Sender: TObject);
begin
  SetChange(True);
  BasesListEditor.InsertRow('', '', True);
  SendMessage(BasesListEditor.Handle, WM_VSCROLL, SB_BOTTOM, 0);
end;

procedure TMainForm.BasesListEditorStringsChange(Sender: TObject);
begin
  SetChange(True);
end;

// удаление строки в описании баз
procedure TMainForm.DelItemBasesClick(Sender: TObject);
begin
  if BasesListEditor.Row>=0 then begin
    BasesListEditor.DeleteRow(BasesListEditor.Row);
    SetChange(True);
  end;
end;

procedure TMainForm.ErrEditKeyPress(Sender: TObject; var Key: char);
begin
  SetChange(True);
end;

procedure TMainForm.ExitItemClick(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.FormClose(Sender: TObject; var CloseAction: TCloseAction);
var
  i: integer;
begin
  for i := 0 to ListFiles.Count-1 do
    if ExtractFilePath(ListFiles[i])=GetLocalTmpPath then
      SysUtils.DeleteFile(ListFiles[i]);
  ListFiles.Free;
end;

// если произошли изменения в программе, выводится запрос на сохранение
procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: boolean);
begin
  if Change then
    if MessageDlg('Сохранить изменения?', mtConfirmation, [mbYes, mbNo],
      0, mbYes)=mrYes then MainForm.SaveLSTClick(nil);
end;

// инициализация программы
procedure TMainForm.FormCreate(Sender: TObject);
var
  hIcon: THandle;
  nIconId: DWORD;
begin
  BasesListEditor.Strings.Sorted:=True;
  tmp:=GetLocalTmpPath;
  ListFiles:=TStringList.Create;
  ListFiles.Sorted:=True;
  LoadLST('bases.lst');
  SetChange(False);

  //загрузка иконки из эзешника
  if PrivateExtractIcons(pchar(Application.ExeName), 0, 64, 64, @hIcon, @nIconId,
    1, LR_LOADFROMFILE) <> 0 then
  try
    Image1.Picture.Icon.Handle:=hIcon;
  finally
    DestroyIcon (hIcon);
  end;
  Label1.Caption:='EditBases'+#10#13+FileVersion(Application.ExeName)+
    #10#13+'Freeware (C) 2012-2017';

  PageControl1.ActivePageIndex:=0;
  SaveDialog1.InitialDir:=ParamStr(0);
  OpenDialog1.InitialDir:=ParamStr(0);
end;

procedure TMainForm.KeyEditKeyPress(Sender: TObject; var Key: char);
begin
  SetChange(True);
end;


// загрузка текстового файла с описанием баз
procedure TMainForm.LoadBasesTXTClick(Sender: TObject);
var
  s: string;
  i: integer;
begin
  OpenDialog1.Filter:='*.txt|*.txt';
  if OpenDialog1.Execute then
    with BasesListEditor do begin
      BeginUpdate;
      Strings.Clear;
      Strings.LoadFromFile(OpenDialog1.FileName, TEncoding.Default);
      EndUpdate();
      s:=tmp+'bases.txt';
      Strings.SaveToFile(s);
      if not ListFiles.Find(s, i) then
        ListFiles.Add(s);
    end;
end;

// загрузка описания ошибок
procedure TMainForm.LoadErrorClick(Sender: TObject);
var
  s: string;
  i: integer;
begin
  OpenDialog1.Filter:='*.rtf|*.rtf';
  if OpenDialog1.Execute then begin
    ErrEdit.Lines.Clear;
    if LoadRTF(OpenDialog1.FileName, ErrEdit) then begin
      s:=tmp+'errors.rtf';
      SaveRTF(s, ErrEdit);
      if not ListFiles.Find(s, i) then
        ListFiles.Add(s);
    end;
  end;
end;

// загрузка описания ключей коммандной строки
procedure TMainForm.LoadKeyClick(Sender: TObject);
var
  s: string;
  i: integer;
begin
  OpenDialog1.Filter:='*.rtf|*.rtf';
  if OpenDialog1.Execute then begin
    KeyEdit.Lines.Clear;
    if LoadRTF(OpenDialog1.FileName, KeyEdit) then begin
      s:=tmp+'keys.rtf';
      SaveRTF(s, KeyEdit);
      if not ListFiles.Find(s, i) then
        ListFiles.Add(s);
    end;
  end;
end;

end.

