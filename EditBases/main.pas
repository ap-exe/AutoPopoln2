unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, RichMemo, Forms, Controls, Windows, FileUtil,
  Graphics, Dialogs, ComCtrls, Menus, ValEdit, ExtCtrls, StdCtrls, Buttons, Types;

type

  { TMainForm }

  TMainForm = class(TForm)
     BasesListEditor: TValueListEditor;
     BasesTab: TTabSheet;
    MainMenu1: TMainMenu;
    FileMenuItem: TMenuItem;
    AddItemBasesPop: TMenuItem;
    DelItemBasesPop: TMenuItem;
    AboutItem: TMenuItem;
    AddTabItem: TMenuItem;
    DelTabItem: TMenuItem;
    MenuItem1: TMenuItem;
    AddTabItemMain: TMenuItem;
    PageControl1: TPageControl;
    RenameMenuItem: TMenuItem;
    TabsPopupMenu: TPopupMenu;
    MenuItem12: TMenuItem;
    ExitItem: TMenuItem;
    AddItemBases: TMenuItem;
    DelItemBases: TMenuItem;
    OpenLST: TMenuItem;
    SaveLST1: TMenuItem;
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
    procedure AddTabItemMainClick(Sender: TObject);
    procedure BasesListEditorStringsChange(Sender: TObject);
    procedure BasesTabExit(Sender: TObject);
    procedure DelItemBasesClick(Sender: TObject);
    procedure AddTabButtonClick(Sender: TObject);
    procedure DelTabItemClick(Sender: TObject);
    procedure ExitItemClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
    procedure FormCreate(Sender: TObject);
    procedure LoadBasesTXTClick(Sender: TObject);
    procedure OpenLSTClick(Sender: TObject);
    procedure PageControl1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure RenameMenuItemClick(Sender: TObject);
    procedure SaveBasesTXTClick(Sender: TObject);
    procedure SaveLST1Click(Sender: TObject);
    procedure TabsPopupMenuPopup(Sender: TObject);
   private
    tmp: string;
    Change: boolean;
    ListFiles: TStringList;
    TabIndex: integer;
    procedure SetChange(Changes: boolean);
  public
    procedure RichMemo1MouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
  end;

var
  MainForm: TMainForm;

implementation

uses
  about, addtabform, MyFileUtils;

{$R *.frm}

{ TMainForm }

procedure TMainForm.RichMemo1MouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
begin
  (sender as trichmemo).ScrollBy(0, WheelDelta);
end;

// открытие LST файла
procedure TMainForm.OpenLSTClick(Sender: TObject);
begin
  OpenDialog1.FileName := 'bases.lst';
  OpenDialog1.Filter := '*.lst|*.lst';
  if OpenDialog1.Execute then begin
    Screen.Cursor := crHourGlass;
    LoadLST(OpenDialog1.FileName, tmp, PageControl1, BasesListEditor, ListFiles);
    PageControl1.PageIndex := 0;
    Screen.Cursor := crDefault;
  end;
  SetChange(False);
end;

procedure TMainForm.PageControl1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  TabIndex := PageControl1.IndexOfPageAt(X, Y);
end;

// изменение вкладки
procedure TMainForm.RenameMenuItemClick(Sender: TObject);
var
  AddTabForm1: TAddTabForm1;
  LTFile: TStringList;
  s: string;
begin
  AddTabForm1 := TAddTabForm1.Create(self);
  try
    AddTabForm1.NameTabEdit.Text := PageControl1.Pages[TabIndex].Caption;
    AddTabForm1.FileTabEdit.Text := ListFiles[TabIndex + 1];
    AddTabForm1.Caption := 'Изменить вкладку';

    if AddTabForm1.ShowModal = mrOk then begin
      PageControl1.Pages[TabIndex].Caption := AddTabForm1.NameTabEdit.Text;
      if AddTabForm1.FileTabEdit.Text <> '' then begin
        s := tmp + ExtractFileName(AddTabForm1.FileTabEdit.Text);
        if AddTabForm1.FileTabEdit.Text <> s then
          CopyFile(AddTabForm1.FileTabEdit.Text, s)
        else
          s := AddTabForm1.FileTabEdit.Text;

        LTFile := TStringList.Create;
        try
          LTFile.LoadFromFile(tmp + 'listtabs.ini', TEncoding.Default);
          LTFile[TabIndex - 1] := AddTabForm1.NameTabEdit.Text + '=' + ExtractFileName(s);
          LTFile.SaveToFile(tmp + 'listtabs.ini');
        finally
          LTFile.Free;
        end;
        LoadRTF(s, TRichMemo(PageControl1.Pages[TabIndex].Controls[0]));
        ListFiles[TabIndex + 1] := s;
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
      TabSheet := TTabSheet.Create(Self);
      TabSheet.Caption := AddTabForm1.NameTabEdit.Text;
      RM := TRichMemo.Create(self);
      RM.Parent := TabSheet;
      RM.Align := alClient;
      RM.ScrollBars := ssAutoVertical;
      RM.OnMouseWheel := @RichMemo1MouseWheel;
      TabSheet.PageControl := PageControl1;
      if AddTabForm1.FileTabEdit.Text <> '' then begin
        s := tmp + ExtractFileName(AddTabForm1.FileTabEdit.Text);
        CopyFile(AddTabForm1.FileTabEdit.Text, s);
        LoadRTF(AddTabForm1.FileTabEdit.Text, rm);
        ListFiles.Add(s);
        LTFile := TStringList.Create;
        try
          if FileExists(tmp + 'listtabs.ini') then
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

procedure TMainForm.AddTabItemMainClick(Sender: TObject);
begin
  AddTabItemClick(nil);
end;

// удаление выделенной вкладки
procedure TMainForm.DelTabItemClick(Sender: TObject);
var
  LTFile: TStringList;
begin
  PageControl1.Pages[TabIndex].Free;
  ListFiles.Delete(TabIndex + 1);
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
procedure TMainForm.SaveLST1Click(Sender: TObject);
begin
  BasesListEditor.Strings.Sort;
  SaveDialog1.FileName := 'bases.lst';
  SaveDialog1.Filter := '*.lst|*.lst';
  if SaveDialog1.Execute then begin
    if FileExists(SaveDialog1.FileName) then begin
      if MessageDlg('Такой файл уже существует! Заменить?', mtWarning,
        [mbYes, mbNo], 0, mbYes) = mrYes then begin
        if ExtractFileExt(SaveDialog1.FileName) = '.lst' then
          //MyCompressFiles2(ListFiles, SaveDialog1.FileName)
          SaveLST(SaveDialog1.FileName, tmp, PageControl1, BasesListEditor, ListFiles)
        else
          //MyCompressFiles2(ListFiles, ChangeFileExt(SaveDialog1.FileName, '.lst'));
          SaveLST(ChangeFileExt(SaveDialog1.FileName, '.lst'), tmp, PageControl1,
            BasesListEditor, ListFiles);
      end;
    end
    else
      if ExtractFileExt(SaveDialog1.FileName) = '.lst' then
        SaveLST(SaveDialog1.FileName, tmp, PageControl1, BasesListEditor, ListFiles)
      else
        SaveLST(ChangeFileExt(SaveDialog1.FileName, '.lst'), tmp, PageControl1,
          BasesListEditor, ListFiles);
  end;
  SetChange(False);
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
  if PageControl1.ActivePageIndex = 0 then begin
    BasesListEditor.InsertRow('', '', True);
    SendMessage(BasesListEditor.Handle, WM_VSCROLL, SB_BOTTOM, 0);
    SetChange(True);
  end;
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

procedure TMainForm.BasesTabExit(Sender: TObject);
begin
  BasesListEditor.Strings.SaveToFile(tmp + 'bases.txt');
end;

// удаление строки в описании баз
procedure TMainForm.DelItemBasesClick(Sender: TObject);
begin
  if PageControl1.ActivePageIndex = 0 then
    if BasesListEditor.Row >= 0 then begin
      BasesTab.SetFocus;
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

// закрытие программы
procedure TMainForm.FormClose(Sender: TObject; var CloseAction: TCloseAction);
var
  i: integer;
begin
  for i := 0 to ListFiles.Count - 1 do
    if ExtractFilePath(ListFiles[i]) = tmp then
      SysUtils.DeleteFile(ListFiles[i]);
  for i := PageControl1.PageCount - 1 downto 1 do
    PageControl1.Pages[i].Free;
  ListFiles.Free;
end;

// если произошли изменения в программе, выводится запрос на сохранение
procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: boolean);
begin
  if Change then
    if MessageDlg('Сохранить изменения?', mtConfirmation, [mbYes, mbNo],
      0, mbYes)=mrYes then MainForm.SaveLST1Click(nil);
end;

// инициализация программы
procedure TMainForm.FormCreate(Sender: TObject);
begin
  tmp := GetLocalTmpPath + 'ap\';
  ForceDirectories(tmp);

  ListFiles := TStringList.Create;
  if not LoadLST('bases.lst', tmp, PageControl1, BasesListEditor, ListFiles) then
    ListFiles.Add(tmp + 'bases.txt');
  SetChange(False);

  PageControl1.ActivePageIndex := 0;
  SaveDialog1.InitialDir := ParamStr(0);
  OpenDialog1.InitialDir := ParamStr(0);
end;

// загрузка текстового файла с описанием баз
procedure TMainForm.LoadBasesTXTClick(Sender: TObject);
var
  s: string;
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
    end;
end;

end.

