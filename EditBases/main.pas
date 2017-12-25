unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, ExtendedTabControls, RichMemo, Forms, Controls,
  Graphics, Dialogs, ComCtrls, Menus, ValEdit, ExtCtrls, StdCtrls, Buttons,
  Windows, FileUtil;

type

  { TMainForm }

  TMainForm = class(TForm)
     BasesListEditor: TValueListEditor;
    ExtendedTabControl1: TExtendedTabControl;
    ExtendedTabToolbar1: TExtendedTabToolbar;
    AddTabButton: TExtendedTabToolButton;
    MainMenu1: TMainMenu;
    FileMenuItem: TMenuItem;
    AddItemBasesPop: TMenuItem;
    DelItemBasesPop: TMenuItem;
    AboutItem: TMenuItem;
    AddTabItem: TMenuItem;
    DelTabItem: TMenuItem;
    RenameMenuItem: TMenuItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabsPopupMenu: TPopupMenu;
    MenuItem12: TMenuItem;
    ExitItem: TMenuItem;
    AddItemBases: TMenuItem;
    DelItemBases: TMenuItem;
    OpenLST: TMenuItem;
    SaveLST: TMenuItem;
    EditMenuItem: TMenuItem;
    MenuItem6: TMenuItem;
    LoadBasesTXT: TMenuItem;
    SaveBasesTXT: TMenuItem;
    OpenDialog1: TOpenDialog;
    BasesPopupMenu: TPopupMenu;
    SaveDialog1: TSaveDialog;
    procedure AboutItemClick(Sender: TObject);
    procedure AddItemBasesClick(Sender: TObject);
    procedure AddTabItemClick(Sender: TObject);
    procedure BasesListEditorStringsChange(Sender: TObject);
    procedure DelItemBasesClick(Sender: TObject);
    procedure AddTabButtonClick(Sender: TObject);
    procedure DelTabItemClick(Sender: TObject);
    procedure ExitItemClick(Sender: TObject);
    procedure ExtendedTabControl1Changing(Sender: TObject;
      var AllowChange: Boolean);
    procedure ExtendedTabControl1MouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
    procedure FormCreate(Sender: TObject);
    procedure LoadBasesTXTClick(Sender: TObject);
    procedure OpenLSTClick(Sender: TObject);
    procedure RenameMenuItemClick(Sender: TObject);
    procedure SaveBasesTXTClick(Sender: TObject);
    procedure SaveLSTClick(Sender: TObject);
    procedure TabsPopupMenuPopup(Sender: TObject);
   private
    tmp: string;
    Change: boolean;
    ListFiles: TStringList;
    TabIndex: integer;
    function LoadRTF(FileName: string; rm: TRichMemo): boolean;
    function SaveRTF(FileName: string; rm: TRichMemo): boolean;
    procedure LoadLST(FileName: string; TC: TExtendedTabControl;
      PC: TPageControl; LE: TValueListEditor; LF: TStringList);
    procedure SetChange(Changes: boolean);
    function GetLocalTmpPath: string;
  public

  end;

var
  MainForm: TMainForm;

implementation

uses
  zlibfunc, about, addtabform;

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

// загрузка RTF файла
function TMainForm.LoadRTF(FileName: string; rm: TRichMemo): boolean;
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
function TMainForm.SaveRTF(FileName: string; rm: TRichMemo): boolean;
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
function TMainForm.GetLocalTmpPath: string;
var
  buffer: array [0..255] of Char;
  s: string;
begin
  Result := ExtractFilePath(Application.ExeName) + 'temp\';
  GetTempPath(256, buffer);
  s := StrPas(buffer);
  if s <> '' then Result := s;
end;

// открытие LST файла
procedure TMainForm.OpenLSTClick(Sender: TObject);
begin
  OpenDialog1.FileName := 'bases.lst';
  OpenDialog1.Filter := '*.lst|*.lst';
  if OpenDialog1.Execute then begin
    Screen.Cursor := crHourGlass;
    LoadLST(OpenDialog1.FileName, ExtendedTabControl1, PageControl1, BasesListEditor, ListFiles);
    ExtendedTabControl1.TabIndex := 0;
    PageControl1.PageIndex := 0;
    Screen.Cursor := crDefault;
  end;
  SetChange(False);
end;

// изменение вкладки
procedure TMainForm.RenameMenuItemClick(Sender: TObject);
var
  AddTabForm1: TAddTabForm1;
  LTFile: TStringList;
  s: string;
begin
  if TabIndex = 0 then Exit; // запрет на изменение 1 вкладки
  AddTabForm1 := TAddTabForm1.Create(self);
  try
    AddTabForm1.NameTabEdit.Text := ExtendedTabControl1.Tabs[TabIndex];
    AddTabForm1.FileTabEdit.Text := ListFiles[TabIndex];
    AddTabForm1.Caption := 'Изменить вкладку';

    if AddTabForm1.ShowModal = mrOk then begin
      ExtendedTabControl1.Tabs[TabIndex] := AddTabForm1.NameTabEdit.Text;
      if AddTabForm1.FileTabEdit.Text <> '' then begin
        s := tmp + ExtractFileName(AddTabForm1.FileTabEdit.Text);
        if AddTabForm1.FileTabEdit.Text <> s then
          CopyFile(AddTabForm1.FileTabEdit.Text, s)
        else
          s := AddTabForm1.FileTabEdit.Text;

        LTFile := TStringList.Create;
        try
          LTFile.LoadFromFile(tmp + 'listtabs.ini', TEncoding.Default);
          LTFile[TabIndex - 1] := AddTabForm1.NameTabEdit.Text + '=' +
            ExtractFileName(s);
          LTFile.SaveToFile(tmp + 'listtabs.ini');
        finally
          LTFile.Free;
        end;
        LoadRTF(s, TRichMemo(PageControl1.Pages[TabIndex].Controls[0]));
        ListFiles[TabIndex] := s;
      end;
      SetChange(True);
    end;
  finally
    AddTabForm1.Free;
  end;
end;

// добавление вкладки
procedure TMainForm.AddTabItemClick(Sender: TObject);
var
  TabSheet: TTabSheet;
  RM: TRichMemo;
  AddTabForm1: TAddTabForm1;
  LTFile: TStringList;
  s: string;
begin
  AddTabForm1 := TAddTabForm1.Create(self);
  try
    if AddTabForm1.ShowModal = mrOk then begin
      ExtendedTabControl1.Tabs.Add(AddTabForm1.NameTabEdit.Text);
      TabSheet := TTabSheet.Create(Self);
      RM := TRichMemo.Create(self);
      RM.Align := alClient;
      RM.ScrollBars := ssAutoVertical;
      TabSheet.InsertControl(RM);
      TabSheet.PageControl := PageControl1;
      if AddTabForm1.FileTabEdit.Text <> '' then begin
        s := tmp + ExtractFileName(AddTabForm1.FileTabEdit.Text);
        CopyFile(AddTabForm1.FileTabEdit.Text, s);
        LoadRTF(AddTabForm1.FileTabEdit.Text, rm);
        ListFiles.Add(s);
        LTFile := TStringList.Create;
        try
          LTFile.LoadFromFile(tmp + 'listtabs.ini', TEncoding.Default);
          LTFile.Add(AddTabForm1.NameTabEdit.Text + '=' + ExtractFileName(s));
          LtFile.SaveToFile(tmp + 'listtabs.ini');
        finally
          LTFile.Free;
        end;
      end;
      SetChange(True);
    end;
  finally
    AddTabForm1.Free;
  end;
end;

// удаление выделенной вкладки
procedure TMainForm.DelTabItemClick(Sender: TObject);
var
  LTFile: TStringList;
begin
  if TabIndex = 0 then Exit; // запрет на удаление 1 вкладки
  ExtendedTabControl1.Tabs.Delete(TabIndex);
  PageControl1.ActivePage.Destroy;
  ListFiles.Delete(TabIndex);
  LTFile := TStringList.Create;
  try
    LTFile.LoadFromFile(tmp + 'listtabs.ini', TEncoding.Default);
    LTFile.Delete(TabIndex - 1);
    LtFile.SaveToFile(tmp + 'listtabs.ini');
  finally
    LTFile.Free;
  end;
  SetChange(True);
end;

// сохранение описания баз в текстовый файл
procedure TMainForm.SaveBasesTXTClick(Sender: TObject);
begin
  BasesListEditor.Strings.Sort;
  SaveDialog1.FileName := 'bases.txt';
  SaveDialog1.Filter := '*.txt|*.txt';
  if SaveDialog1.Execute then
    if ExtractFileExt(SaveDialog1.FileName) = '.txt' then
      BasesListEditor.Strings.SaveToFile(SaveDialog1.FileName)
    else
      BasesListEditor.Strings.SaveToFile(ChangeFileExt(SaveDialog1.FileName, '.txt'));
end;

// сохранение LST файла
procedure TMainForm.SaveLSTClick(Sender: TObject);
begin
  BasesListEditor.Strings.Sort;
  BasesListEditor.Strings.SaveToFile(tmp + 'bases.txt');
  SaveDialog1.FileName := 'bases.lst';
  SaveDialog1.Filter := '*.lst|*.lst';
  if SaveDialog1.Execute then begin
    if FileExists(SaveDialog1.FileName) then
      if MessageDlg('Такой файл уже существует! Заменить?', mtWarning,
        [mbYes, mbNo], 0, mbYes) = mrYes then begin
        if ExtractFileExt(SaveDialog1.FileName) = '.lst' then
          MyCompressFiles2(ListFiles, SaveDialog1.FileName)
        else
          MyCompressFiles2(ListFiles, ChangeFileExt(SaveDialog1.FileName, '.lst'));
        SetChange(False);
      end;
  end;
end;

// запрет на изменение 1 вкладки
procedure TMainForm.TabsPopupMenuPopup(Sender: TObject);
begin
  if TabIndex = 0 then begin
    DelTabItem.Enabled := False;
    RenameMenuItem.Enabled := False;
  end
  else begin
    DelTabItem.Enabled := True;
    RenameMenuItem.Enabled := True;
  end;
end;

// загрузка LST файла
procedure TMainForm.LoadLST(FileName: string; TC: TExtendedTabControl;
  PC: TPageControl; LE: TValueListEditor; LF: TStringList);
var
  LTFile: TStringList;
  TabSheet: TTabSheet;
  RM: TRichMemo;
  i: integer;
  s: string;
begin
  if FileExists(FileName) then begin
    DecompressFile(FileName, tmp, True, False);
    if FileExists(tmp + 'listtabs.ini') then begin
      // чистка
      LF.Clear;
      LE.Strings.Clear;
      for i := TC.Tabs.Count - 1 downto 1 do begin;
         TC.Tabs.Delete(i);
        PC.Page[i].Free;
      end;
      LTFile := TStringList.Create;
      try
        // загрузка описания вкладок из ini файла
        LTFile.LoadFromFile(tmp + 'listtabs.ini', TEncoding.Default);
        LF.Add(tmp + 'listtabs.ini');
        // загрузка описания баз в первую вкладку
        LE.Strings.LoadFromFile(tmp + 'bases.txt', TEncoding.Default);
        LF.Add(tmp + 'bases.txt');
        // добавление вкладок и загрузка в них RTF файлов
        for i := 0 to LTFile.Count - 1 do begin
          TC.Tabs.Add(Copy(LTFile[i], 0, Pos('=', LTFile[i]) - 1));
          TabSheet := TTabSheet.Create(Self);
          TabSheet.PageControl := PC;
          RM := TRichMemo.Create(self);
          RM.Align := alClient;
          RM.ScrollBars := ssAutoVertical;
          TabSheet.InsertControl(RM);
          s := tmp + Copy(LTFile[i], Pos('=', LTFile[i]) + 1, Length(LTFile[i]) - 1);
          // если это не RTF, то пытаемся открыть как текстовый файл
          if not LoadRTF(s, RM) then
            RM.Lines.LoadFromFile(s, TEncoding.Default);
          LF.Add(s);
        end;
      finally
        LTFile.Free;
      end;
    end;
  end;
end;

// процедура изменения статуса программы
procedure TMainForm.SetChange(Changes: boolean);
begin
  if Changes then
    MainForm.Caption := 'Редактирование bases.lst *'
  else
    MainForm.Caption := 'Редактирование bases.lst';
  Change := Changes;
end;

// вставка строки в описании баз
procedure TMainForm.AddItemBasesClick(Sender: TObject);
begin
  BasesListEditor.InsertRow('', '', True);
  SendMessage(BasesListEditor.Handle, WM_VSCROLL, SB_BOTTOM, 0);
  SetChange(True);
end;

// показ окна "О программе"
procedure TMainForm.AboutItemClick(Sender: TObject);
var
  AboutForm: TAboutForm;
begin
  AboutForm := TAboutForm.Create(self);
  try
    AboutForm.ShowModal;
  finally
    AboutForm.Free;
  end;
end;

procedure TMainForm.BasesListEditorStringsChange(Sender: TObject);
begin
  SetChange(True);
end;

// удаление строки в описании баз
procedure TMainForm.DelItemBasesClick(Sender: TObject);
begin
  if BasesListEditor.Row >= 0 then begin
    BasesListEditor.DeleteRow(BasesListEditor.Row);
    SetChange(True);
  end;
end;

// добавление вкладки
procedure TMainForm.AddTabButtonClick(Sender: TObject);
begin
  AddTabItemClick(nil);
end;

procedure TMainForm.ExitItemClick(Sender: TObject);
begin
  Close;
end;

// переключение табов
procedure TMainForm.ExtendedTabControl1Changing(Sender: TObject;
  var AllowChange: Boolean);
begin
  PageControl1.PageIndex := TabIndex;
end;

// определение выделеноого таба по координатам курсора
procedure TMainForm.ExtendedTabControl1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  TabIndex := ExtendedTabControl1.IndexOfTabAt(X, Y);
end;

// закрытие программы
procedure TMainForm.FormClose(Sender: TObject; var CloseAction: TCloseAction);
var
  i: integer;
begin
  for i := 0 to ListFiles.Count - 1 do
    if ExtractFilePath(ListFiles[i]) = tmp then
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
begin
  tmp := GetLocalTmpPath + 'ap\';
  ForceDirectories(tmp);

  ListFiles := TStringList.Create;
  LoadLST('bases.lst', ExtendedTabControl1, PageControl1, BasesListEditor, ListFiles);
  SetChange(False);

  PageControl1.ActivePageIndex := 0;
  SaveDialog1.InitialDir := ParamStr(0);
  OpenDialog1.InitialDir := ParamStr(0);
end;

// загрузка текстового файла с описанием баз
procedure TMainForm.LoadBasesTXTClick(Sender: TObject);
var
  s: string;
  i: integer;
begin
  OpenDialog1.Filter := '*.txt|*.txt';
  if OpenDialog1.Execute then
    with BasesListEditor do begin
      BeginUpdate;
      Strings.Clear;
      Strings.LoadFromFile(OpenDialog1.FileName, TEncoding.Default);
      EndUpdate();
      s := tmp + 'bases.txt';
      Strings.SaveToFile(s);
      if not ListFiles.Find(s, i) then
        ListFiles.Add(s);
    end;
end;

end.

