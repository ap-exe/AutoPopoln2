unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DateTimePicker, Forms, Controls, Graphics,
  ActiveX, Dialogs, ComCtrls, ExtCtrls, StdCtrls, Menus, Buttons, EditBtn,
  ShlObj, Windows, RegExpr, zlibfunc, LCLType, lconvencoding, RichMemo,
  LazUTF8, DateUtils, Registry, Types;

type

  { TMainForm }

  TMainForm = class(TForm)
    BasesMenu: TPopupMenu;
    Label3: TLabel;
    ReloadDTButton: TButton;
    cbCloseProg: TCheckBox;
    cbCreateSubDir: TCheckBox;
    ConsText: TLabel;
    DateTimePicker1: TDateTimePicker;
    DirConsButton: TSpeedButton;
    DirConsEdit: TLabeledEdit;
    FindEdit: TEdit;
    FreeSizeText: TLabel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    Image1: TImage;
    KeyCmdEdit: TLabeledEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    ListBases: TListView;
    NameOrgEdit: TEdit;
    PageControl1: TPageControl;
    PopolnButton: TSpeedButton;
    PopolnCheckBox: TCheckBox;
    PopolnEdit: TLabeledEdit;
    Report: TMemo;
    ResetCFGButton: TButton;
    ResText: TLabel;
    ErrDocRE: TRichMemo;
    KeyCmdMemo: TRichMemo;
    RunPopolnButton: TButton;
    CopyButton: TButton;
    ExitButton: TButton;
    ImageList1: TImageList;
    ClientLabel: TLabel;
    InfoLabel: TLabel;
    KeyCmdMenu: TPopupMenu;
    adm1: TMenuItem;
    base1: TMenuItem;
    MenuItem1: TMenuItem;
    N4: TMenuItem;
    N3: TMenuItem;
    N1: TMenuItem;
    OpenDirConsButton: TButton;
    ProgressBar1: TProgressBar;
    ScrollBox1: TScrollBox;
    SelectDirDialog: TSelectDirectoryDialog;
    SetDTButton: TButton;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    KeyCmdButton: TSpeedButton;
    STTCheckBox: TCheckBox;
    STTDirButton: TSpeedButton;
    STTEdit: TLabeledEdit;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TotalCopyLabel: TLabel;
    USRCheckBox: TCheckBox;
    USRDirButton: TSpeedButton;
    USRDirEdit: TLabeledEdit;
    yes1: TMenuItem;
    process21: TMenuItem;
    norunner1: TMenuItem;
    receive1: TMenuItem;
    PageControl: TPageControl;
    Panel1: TPanel;
    InfoPanel: TPanel;
    PopolnPage: TTabSheet;
    BasesPage: TTabSheet;
    CfgPage: TTabSheet;
    LogPage: TTabSheet;
    DocPage: TTabSheet;
    AboutPage: TTabSheet;
    TreeView1: TTreeView;
    procedure base1Click(Sender: TObject);
    procedure BasesPageShow(Sender: TObject);
    procedure cbCreateSubDirClick(Sender: TObject);
    procedure CfgPageHide(Sender: TObject);
    procedure CopyButtonClick(Sender: TObject);
    procedure DirConsButtonClick(Sender: TObject);
    procedure DirConsEditChange(Sender: TObject);
    procedure DirConsEditEditingDone(Sender: TObject);
    procedure ErrDocREMouseEnter(Sender: TObject);
    procedure ErrDocREMouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure ExitButtonClick(Sender: TObject);
    procedure adm1Click(Sender: TObject);
    procedure FindEditChange(Sender: TObject);
    procedure FindEditMouseEnter(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure KeyCmdButtonClick(Sender: TObject);
    procedure KeyCmdMemoMouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure ListBasesColumnClick(Sender: TObject; Column: TListColumn);
    procedure ListBasesCustomDrawItem(Sender: TCustomListView; Item: TListItem;
      State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure LogPageShow(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure NameOrgEditChange(Sender: TObject);
    procedure NameOrgEditKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure NameOrgEditUTF8KeyPress(Sender: TObject; var UTF8Key: TUTF8Char);
    procedure norunner1Click(Sender: TObject);
    procedure OpenDirConsButtonClick(Sender: TObject);
    procedure PopolnButtonClick(Sender: TObject);
    procedure PopolnCheckBoxClick(Sender: TObject);
    procedure PopolnEditChange(Sender: TObject);
    procedure PopolnPageShow(Sender: TObject);
    procedure process21Click(Sender: TObject);
    procedure receive1Click(Sender: TObject);
    procedure ReloadDTButtonClick(Sender: TObject);
    procedure ReportKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ResetCFGButtonClick(Sender: TObject);
    procedure RunPopolnButtonClick(Sender: TObject);
    procedure SetDTButtonClick(Sender: TObject);
    procedure STTCheckBoxClick(Sender: TObject);
    procedure STTDirButtonClick(Sender: TObject);
    procedure STTEditChange(Sender: TObject);
    procedure TreeView1Click(Sender: TObject);
    procedure TreeView1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure USRCheckBoxClick(Sender: TObject);
    procedure USRCheckBoxKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure USRDirButtonClick(Sender: TObject);
    procedure USRDirEditChange(Sender: TObject);
    procedure yes1Click(Sender: TObject);
  private
    BasesLST: TStringList;
    TempPath, USRPath, PopolnPath, AppPath: string;
    AddDate, DirConsChange: boolean;
    procedure CopyConsFiles(FromPath, ToPath, Mask: string);
    function GetPathX(const path: string): string;
    procedure CopyUSR;
    procedure CopySTT;
    procedure CopyPopoln;
    procedure WriteReport;
    procedure OpenCfgPage;
    function LoadRTF(FileName: string; rm: TRichMemo): boolean;
  public
    LoadedCfg: boolean;
    DatePopoln, ListFiles: TStringList;
    iTaskBar: ITaskbarList3;
    procedure FillTableBase;
  end;

var
  MainForm: TMainForm;

implementation

uses
  MyFileUtils, MainCfg, CopyFileThread;

{$R *.frm}

{ TMainForm }

// при щелчке по названию раздела показывает его
procedure TMainForm.TreeView1Click(Sender: TObject);
begin
  PageControl.Pages[TreeView1.Selected.Index].Show;
  InfoLabel.Caption:='Текущий раздел: '+TreeView1.Selected.Text;
end;

procedure TMainForm.ExitButtonClick(Sender: TObject);
begin
  Close;
end;

// копирование файлов
procedure TMainForm.CopyButtonClick(Sender: TObject);
begin
  if USRCheckBox.Checked then CopyUSR;
  if STTCheckBox.Checked then CopySTT;
  if PopolnCheckBox.Checked then CopyPopoln;
end;

// добавляет в настройках командной строки параметр /base*
procedure TMainForm.base1Click(Sender: TObject);
begin
  KeyCmdEdit.Text:=KeyCmdEdit.Text+' /base*';
end;

procedure TMainForm.BasesPageShow(Sender: TObject);
begin

end;

// создавать или нет подпапки с названием организации
procedure TMainForm.cbCreateSubDirClick(Sender: TObject);
begin
  if cbCreateSubDir.Checked then
    USRPath:=USRPath+'\'+NameOrgEdit.Text+'\'
  else
    USRPath:=USRPath+'\';
end;

// проверка на правильность настроек
procedure TMainForm.CfgPageHide(Sender: TObject);
begin
  if NameOrgEdit.Text='' then begin
    NameOrgEdit.Color:=clRed;
    OpenCfgPage;
  end;

  if not DirectoryExists(PopolnEdit.Text) and PopolnCheckBox.Checked and
    not (Copy(PopolnEdit.Text, 0, 3)='[x]') then begin
      PopolnEdit.Color:=clRed;
      OpenCfgPage;
  end;

  if not DirectoryExists(STTEdit.Text) and STTCheckBox.Checked then begin
    STTEdit.Color:=clRed;
    OpenCfgPage;
  end;

  if not DirectoryExists(USRDirEdit.Text) and USRCheckBox.Checked and
    not (Copy(USRDirEdit.Text, 0, 3)='[x]') then begin
      USRDirEdit.Color:=clRed;
      OpenCfgPage;
  end;

  if not FileExists(DirConsEdit.Text+'\base\baselist.cfg') then begin
    DirConsEdit.Color:=clRed;
    OpenCfgPage;
  end
  else
    if DirConsChange then begin
      FillTableBase;
      N3Click(self);
      DirConsChange:=False;
    end;
end;

// выбор папки с Консультантом
procedure TMainForm.DirConsButtonClick(Sender: TObject);
begin
  SelectDirDialog.Title:='Выберите папку с Консультантом';
  if SelectDirDialog.Execute then begin
    DirConsEdit.Text:=SelectDirDialog.FileName;
    //DirConsChange:=True;
  end;
end;

procedure TMainForm.DirConsEditChange(Sender: TObject);
begin
  DirConsEdit.Color:=clWindow;
end;

procedure TMainForm.DirConsEditEditingDone(Sender: TObject);
var
  s: string;
begin
  if DirConsEdit.Text<>'' then begin
    DirConsChange:=True;
    s:=DirConsEdit.Text+'\ADM\STS';
    if DirectoryExists(s) then
      STTEdit.Text:=s
    else
      STTEdit.Text:='';
  end;
end;

procedure TMainForm.ErrDocREMouseEnter(Sender: TObject);
begin
  ErrDocRE.SetFocus;
end;

procedure TMainForm.ErrDocREMouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
begin
  ErrDocRE.ScrollBy(0, WheelDelta+10);
  // измененяется размер шрифта при зажатом CTRL и вращение колёсика мышки
  if Shift=[ssCtrl] then
    ErrDocRE.ZoomFactor:=ErrDocRE.ZoomFactor + WheelDelta * 0.001;
end;

// процедура используется для копирования SST и USR файлов
procedure TMainForm.CopyConsFiles(FromPath, ToPath, Mask: string);
var
  CopyThread: TCopyFileThread;
begin
  CopyThread:=TCopyFileThread.Create(FromPath, ToPath, Mask, True);
  CopyThread.Start;
  while not CopyThread.Finished do Application.ProcessMessages;
  CopyThread.Terminate;
  TotalCopyLabel.Caption:='';
  ProgressBar1.Position:=0;
end;

// копирование USR файлов
procedure TMainForm.CopyUSR;
begin
  CopyConsFiles(DirConsEdit.Text+'\Receive\', USRPath, 'CONS#*.USR');
end;

// копирование STT файлов в папку USR
procedure TMainForm.CopySTT;
begin
  CopyConsFiles(STTEdit.Text+'\', USRPath, '*.STT');
end;

// копирвание пополнений
procedure TMainForm.CopyPopoln;
var
  i, j: integer;
  d, masks: string;
  RegExp: TRegExpr;
  CopyThread: TCopyFileThread;
begin
  if PopolnPath='' then begin
    MessageDlg('Ошибка', 'Не указана папка с пополнением!', mtError, [mbOK], 0);
    Exit;
  end;
  if DirConsEdit.Text='' then begin
    MessageDlg('Ошибка', 'Не указана папка с Консультантом!', mtError, [mbOK], 0);
    Exit;
  end;

  CopyButton.Enabled:=False;
  RunPopolnButton.Enabled:=False;
  try
    masks:='';
    for i := 0 to ListBases.Items.Count - 1 do
      if ListBases.Items[i].Checked then
        masks:=masks+';'+ListBases.Items[i].SubItems[1]+'*.ans';
    // поиск и копирование файлов в потоке)
    CopyThread:=TCopyFileThread.Create(PopolnPath, DirConsEdit.Text+'\Receive',
      masks, True);
    CopyThread.Start;
    // ждем поток
    while not CopyThread.Finished do Application.ProcessMessages;
    TotalCopyLabel.Caption:=IntToStr(CopyThread.FFileNames.Count)+
      ' файлов пополнения скопированы';

    //добавление в лог последней даты пополнения
    //формат папки с пополнением 3112pop
    RegExp := TRegExpr.Create;
    RegExp.ModifierI:=true;
    RegExp.Expression := '(\d\d\d\d)POP';
    for j:=0 to CopyThread.FFileNames.Count-1 do
      if RegExp.Exec(CopyThread.FFileNames[j]) then begin
        d:=Copy(RegExp.Match[1], 0, 2)+'.'+Copy(RegExp.Match[1], 3, 2)+'.'+
          inttostr(YearOf(Now));
        if not DatePopoln.Find(d, i) then begin
          if DatePopoln.Count=10 then DatePopoln.Delete(0);
          DatePopoln.Add(d);
        end;
      end;
    RegExp.Free;
  finally
    CopyThread.Terminate;
    ProgressBar1.Position:=0;
    if CheckWin32Version(6,1) then
      iTaskBar.SetProgressState(MainForm.Handle, TBPF_NOPROGRESS);
    CopyButton.Enabled:=True;
    RunPopolnButton.Enabled:=True;
  end;
end;

// переключение разделов с помощью кнопок вверх и вниз
procedure TMainForm.TreeView1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key=VK_DOWN) or (Key=VK_UP) then begin
    PageControl.ActivePageIndex:=TreeView1.Selected.Index;
    InfoLabel.Caption:='Текущий раздел: '+TreeView1.Selected.Text;
  end;
end;

procedure TMainForm.USRCheckBoxClick(Sender: TObject);
begin
  USRDirEdit.Color:=clWindow;
  USRDirEdit.Enabled:=USRCheckBox.Checked;
  USRDirButton.Enabled:=USRCheckBox.Checked;
  cbCreateSubDir.Enabled:=USRCheckBox.Checked;
end;

// перемещение скроллбокса в конец
procedure TMainForm.USRCheckBoxKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=VK_TAB then ScrollBox1.ScrollInView(ResetCFGButton);
end;

// выбор папки куда будут складываться USR файлы
// сразу после выбора буква диска меняется на [x]
// [x] - это буква диска с которого запущена программа, обычно это флешка
procedure TMainForm.USRDirButtonClick(Sender: TObject);
begin
  SelectDirDialog.Title:='Выберите папку куда нужно будет скопировать USR-файлы';
  if SelectDirDialog.Execute then
    USRDirEdit.Text:='[x]'+Copy(SelectDirDialog.FileName, 3, Length(SelectDirDialog.FileName));
end;

// выбор папки с пополнением в настройках
procedure TMainForm.PopolnButtonClick(Sender: TObject);
begin
  SelectDirDialog.Title:='Выберите папку с пополнением';
  if SelectDirDialog.Execute then
    PopolnEdit.Text:='[x]'+Copy(SelectDirDialog.FileName, 3, Length(SelectDirDialog.FileName));
end;

procedure TMainForm.USRDirEditChange(Sender: TObject);
begin
  USRDirEdit.Color:=clWindow;
  if Copy(USRDirEdit.Text, 0, 3)='[x]' then
    USRPath:=GetPathX(USRDirEdit.Text)
  else
    USRPath:=USRDirEdit.Text;
end;


// добавляет в настройках командной строки параметр /yes
procedure TMainForm.yes1Click(Sender: TObject);
begin
  KeyCmdEdit.Text:=KeyCmdEdit.Text+' /yes';
end;

// добавляет в настройках командной строки параметр /adm
procedure TMainForm.adm1Click(Sender: TObject);
begin
  KeyCmdEdit.Text:=KeyCmdEdit.Text+' /adm';
end;

// поиск в описаниях ошибок
procedure TMainForm.FindEditChange(Sender: TObject);
var
  opt: TSearchOptions;
  s, l, st: LongInt;
begin
  opt:=[];
  st:=ErrDocRE.SelStart;
  l:=ErrDocRE.SelLength;
  s:=ErrDocRE.Search(FindEdit.Text, ErrDocRE.SelStart, length(ErrDocRE.Text), opt);
  if (s>=0) then begin
    if (st=s) and (l=UTF8Length(FindEdit.Text)) then
      s:=ErrDocRE.Search(FindEdit.Text, ErrDocRE.SelStart+1, length(ErrDocRE.Text), opt);
  end;

  if (s>=0) then begin
    ErrDocRE.SelStart:=s;
    ErrDocRE.SetSelLengthFor(FindEdit.text);
  end else begin
    ErrDocRE.SelStart:=0;
    ErrDocRE.SelLength:=0;
  end;
end;


procedure TMainForm.FindEditMouseEnter(Sender: TObject);
begin
  FindEdit.SetFocus;
end;

// закрытие программы
procedure TMainForm.FormClose(Sender: TObject; var CloseAction: TCloseAction);
var
  i: integer;
begin
  if not SaveCfg then
    MessageDlg('Ошибка', 'Не могу сохранить параметры программы',
      mtError, [mbOK], 0);
  DatePopoln.Free;
  BasesLST.Free;
  for I := 0 to ListFiles.Count-1 do
    SysUtils.DeleteFile(ListFiles[i]);
  ListFiles.Free;
end;

// загрузка RTF файла в TRichMemo
function TMainForm.LoadRTF(FileName: string; rm: TRichMemo): boolean;
var
  f: TFileStream;
begin
  Result:=False;
  f:=TFileStream.Create(FileName, fmOpenRead);
  try
    Result:=rm.LoadRichText(f);
  finally
    f.Free;
  end;
end;

// инициализация программы
procedure TMainForm.FormCreate(Sender: TObject);
var
  buffer: array [0..255] of Char;
  s, s3: string;
  s2: RawByteString;
  f: text;
begin
  TotalCopyLabel.Caption:='';

  GetTempPath(256, buffer);
  s:=StrPas(buffer);
  TempPath:=Copy(s, 0, Length(s)-1);

  DatePopoln:=TStringList.Create;
  DatePopoln.Duplicates:=dupIgnore;
  DatePopoln.Sorted:=True;
  AddDate:=False;

  BasesLST:=TStringList.Create;
  ListFiles:=TStringList.Create;

  AppPath:=ExtractFilePath(ParamStr(0));
  s:=AppPath+'bases.lst';
    if FileExists(s) then begin
      DecompressFile(s, TempPath, True, True);

      AssignFile(f, TempPath+'\bases.txt');
      reset(f);
      while not Eof(f) do begin
        Readln(f, s2);
        s3:=CP1251ToUTF8(s2);
        BasesLST.Add(s3);
      end;
      CloseFile(f);
      LoadRTF(TempPath+'\errors.rtf', ErrDocRE);
      LoadRTF(TempPath+'\keys.rtf', KeyCmdMemo);
      ListFiles.Clear;
      ListFiles.Add(TempPath+'\bases.txt');
      ListFiles.Add(TempPath+'\errors.rtf');
      ListFiles.Add(TempPath+'\keys.rtf');
    end
    else begin
      MessageDlg('Ошибка!', 'Невозможно загрузить файл bases.lst!'+#13#10+
        'Файл bases.lst должен находиться в одной папке с программой.'+#13#10+
        'Если у Вас нет этого файла, сформируйте его с помощью программы EditBases.',
        mtError, [mbOK], 0);
      Application.Terminate;
    end;

  ErrDocRE.SelStart:=0;
  TotalCopyLabel.Caption:='';
  ClientLabel.Caption:='Организация: '+NameOrgEdit.Text;

  LoadedCfg:=LoadCfg;
  DirConsChange:=False;

  Label2.Caption:='АвтоПополнение'+#13#10+FileVersion(Application.ExeName)+
    #13#10+'Freeware (C) 2009-2017';

  PageControl.Page[0].Show;
  TreeView1.Selected:=TreeView1.Items.GetFirstNode;

  // инициализация прогрессбара на панели задач в Windows 7+
  if CheckWin32Version(6,1) then begin
    CoCreateInstance(CLSID_TaskbarList, nil, CLSCTX_INPROC, ITaskbarList3, iTaskBar);
    iTaskBar.HrInit;
    if (iTaskBar <> nil) then
      iTaskBar.SetProgressState(MainForm.Handle, TBPF_INDETERMINATE);
  end;
end;

// если не загрузились параметры при запуске программы, открыть раздел с настройками
procedure TMainForm.FormShow(Sender: TObject);
begin
  if not LoadedCfg then begin
    DirConsEdit.Text:=FindCons;
    OpenCfgPage;
  end;
end;

// показ меню с ключами коммандной строки
procedure TMainForm.KeyCmdButtonClick(Sender: TObject);
begin
  KeyCmdMenu.PopUp;
end;

procedure TMainForm.KeyCmdMemoMouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
begin
  KeyCmdMemo.ScrollBy(0, WheelDelta+5);
  // измененяется размер шрифта при зажатом CTRL и вращение колёсика мышки
  if Shift=[ssCtrl] then
    KeyCmdMemo.ZoomFactor:=KeyCmdMemo.ZoomFactor + WheelDelta * 0.001;
end;

// выбор или отмена всех элементов в списке баз
procedure TMainForm.ListBasesColumnClick(Sender: TObject; Column: TListColumn);
begin
  if Column.Index=0 then begin
    if Column.Caption='[  ]' then
      N4Click(nil)
    else
      N3Click(nil);
  end;
end;

// закрашивает серым цветом невыделенные элементы в списке баз
procedure TMainForm.ListBasesCustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  if not Item.Checked then
    ListBases.Canvas.Font.Color:=clGray;
end;

// при выборе раздела Лог вывод его
procedure TMainForm.LogPageShow(Sender: TObject);
begin
  WriteReport;
end;

procedure TMainForm.N1Click(Sender: TObject);
begin
  TreeView1.Items[4].Selected:=True;
  PageControl.Pages[4].Show;
  PageControl1.Pages[1].Show;
  KeyCmdMemo.SetFocus;
end;

// снятие выбора со всех элементов в списке баз
procedure TMainForm.N3Click(Sender: TObject);
var
  i: integer;
begin
  ListBases.Items.BeginUpdate;
  for i := 0 to ListBases.Items.Count - 1 do
    ListBases.Items[i].Checked:=True;
  ListBases.Items.EndUpdate;
  ListBases.Columns[0].Caption:='[  ]';
end;

// выбор всех элементов в списке баз
procedure TMainForm.N4Click(Sender: TObject);
var
  i: integer;
begin
  ListBases.Items.BeginUpdate;
  for i := 0 to ListBases.Items.Count - 1 do
    ListBases.Items[i].Checked:=False;
  ListBases.Items.EndUpdate;
  ListBases.Columns[0].Caption:='[v]';
end;

// вывод в заголовке названия организации
procedure TMainForm.NameOrgEditChange(Sender: TObject);
begin
   NameOrgEdit.Color:=clWindow;
   ClientLabel.Caption:='Организация: '+NameOrgEdit.Text;
end;

// перемещение скроллбокса на начало
procedure TMainForm.NameOrgEditKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=VK_TAB then ScrollBox1.ScrollInView(NameOrgEdit);
end;

// проверка на ввод правильных символов при вводе названия организации
procedure TMainForm.NameOrgEditUTF8KeyPress(Sender: TObject;
  var UTF8Key: TUTF8Char);
begin
  if not ExecRegExpr('[\x08\d\s\-_a-zа-яёЁ]', UTF8Key) then begin
   UTF8Key:=#0;
   MessageBeep(0);
  end;
end;

// добавляет в настройках командной строки параметр /norunner
procedure TMainForm.norunner1Click(Sender: TObject);
begin
  KeyCmdEdit.Text:=KeyCmdEdit.Text+' /norunner';
end;

// открытие в проводнике папки с Консультантом
procedure TMainForm.OpenDirConsButtonClick(Sender: TObject);
begin
  if DirectoryExists(DirConsEdit.Text) then
    ShellExecute(MainForm.Handle, nil, PChar(DirConsEdit.Text), nil, nil,
      SW_SHOWNORMAL)
  else
    MessageDlg('Ошибка', 'Папка '+DirConsEdit.Text+' не найдена',
      mtError, [mbOk], 0);

end;

procedure TMainForm.PopolnCheckBoxClick(Sender: TObject);
begin
  PopolnEdit.Enabled:=PopolnCheckBox.Checked;
  PopolnButton.Enabled:=PopolnCheckBox.Checked;
  PopolnEdit.Color:=clWindow;
end;

// функция замены [x] на букву диска с которого запушена программа
function TMainForm.GetPathX(const path: string): string;
begin
  if Copy(path, 0, 3)='[x]' then
    Result:=ExtractFileDrive(AppPath)+Copy(path, 4, Length(path))
  else
    Result:=path;
end;

procedure TMainForm.PopolnEditChange(Sender: TObject);
begin
  PopolnEdit.Color:=clWindow;

  if Copy(PopolnEdit.Text, 0, 3)='[x]' then
    PopolnPath:=GetPathX(PopolnEdit.Text)
  else
    PopolnPath:=PopolnEdit.Text;
end;

// вывод главной вкладки
procedure TMainForm.PopolnPageShow(Sender: TObject);
var
  FreeSize: integer;
  s, dir: string;
  ResFiles: TStringList;
begin
  // вывод версии cons.exe
  if FileExists(DirConsEdit.Text+'\cons.exe') then
    ConsText.Caption:='cons.exe: '+FileVersion(DirConsEdit.Text+'\cons.exe')
  else
    ConsText.Caption:='Файл cons.exe не найден';
  // поиск и вывод версии файла *.res
  if DirConsEdit.Text<>'' then begin
    ResFiles:=TStringList.Create;
    FindFiles(DirConsEdit.Text, 'vr*.res;ht*.res;sh*.res', ResFiles, false);
    if ResFiles.Count>0 then begin
      s:=ResFiles[ResFiles.Count-1];
      RESText.Caption:=Copy(s, s.LastDelimiter('\')+2, Length(s)-1)+': '+FileVersion(s);
    end
    else
      RESText.Caption:='RES файл не найден';
    ResFiles.Free;
  end;
  // выводится свободное место на диске с Консультантом
  // если папка с Консультантом не указана, выводится свободное место на диске C:
  if DirConsEdit.Text<>'' then
    dir:=DirConsEdit.Text
  else
    dir:='C:\';
  SetCurrentDir(dir);
  FreeSize:=Round((DiskFree(0)/1024)/1024);
  if FreeSize<1000 then FreeSizeText.Font.Color:=clRed;
  FreeSizeText.Caption:='Свободное место на диске '+Copy(dir, 0, 1)+
    ': '+IntToStr(FreeSize)+' МБ';
  // текущее время и дата
  DateTimePicker1.DateTime:=Now;
end;

// добавляет в настройках командной строки параметр /process=2
procedure TMainForm.process21Click(Sender: TObject);
begin
  KeyCmdEdit.Text:=KeyCmdEdit.Text+' /process=2';
end;

// добавляет в настройках командной строки параметр /receive
procedure TMainForm.receive1Click(Sender: TObject);
begin
  KeyCmdEdit.Text:=KeyCmdEdit.Text+' /receive';
end;

// обновление текущей даты и времени
procedure TMainForm.ReloadDTButtonClick(Sender: TObject);
begin
  DateTimePicker1.DateTime:=Now;
end;

// обновление лога по кнопке F5
procedure TMainForm.ReportKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=VK_F5 then WriteReport;
end;

// открытие раздела настройки
procedure TMainForm.OpenCfgPage;
begin
  TreeView1.Items[2].Selected:=True;
  PageControl.Pages[2].Show;
  //PageControl.Pages[2].SetFocus;
end;

// сброс настроек
procedure TMainForm.ResetCFGButtonClick(Sender: TObject);
var
  r: TRegistry;
begin
  // чистка реестра
  r:=TRegistry.Create;
  try
    r.RootKey:=HKEY_CURRENT_USER;
    r.OpenKey('Software', False);
    r.DeleteKey('AutoPopoln');
  finally
    r.Free;
  end;

  NameOrgEdit.Text:='';
  PopolnEdit.Text:='';
  DirConsEdit.Text:='';
  USRDirEdit.Text:='';
  STTEdit.Text:='';
  cbCreateSubDir.Checked:=true;
  PopolnCheckBox.Checked:=false;
  PopolnCheckBoxClick(nil);
  STTCheckBox.Checked:=false;
  STTCheckBoxClick(nil);
  USRCheckBox.Checked:=false;
  USRCheckBoxClick(nil);
  KeyCmdEdit.Text:='/adm /receive /base* /yes';
  cbCloseProg.Checked:=False;
  ListBases.Items.Clear;
  OpenCfgPage;
end;

// запуск Консультанта с ключами указанными в настройках
procedure TMainForm.RunPopolnButtonClick(Sender: TObject);
var
  StartupInfo: TStartupInfo;
  ProcessInfo: TProcessInformation;
begin
  if FileExists(DirConsEdit.Text+'\cons.exe') then begin
    SaveCfg;

    GetStartupInfo(StartupInfo);
    Win32Check(CreateProcess(nil, PChar(DirConsEdit.Text+'\cons.exe '+
      KeyCmdEdit.Text), nil, nil, False, 0, nil, nil, StartupInfo, ProcessInfo));
  end
  else
    MessageDlg('Ошибка', 'Не найден файл cons.exe', mtError, [mbOK], 0);
end;

// изменение даты и времени на компе
procedure TMainForm.SetDTButtonClick(Sender: TObject);
var
  st: TSystemTime;
  ZoneTime: TTimeZoneInformation;
  DateTime: TDateTime;
begin
  GetTimeZoneInformation(ZoneTime);
  DateTime:=DateTimePicker1.Time+ZoneTime.Bias/1440;
  with st do begin
    DecodeDate(DateTimePicker1.Date, wYear, wMonth, wDay);
    DecodeTime(DateTime, wHour, wMinute, wSecond, wMilliseconds);
  end;
  if not SetSystemTime(st) then
    RunAsAdministrator('rundll32.exe', 'shell32,Control_RunDLL timedate.cpl');
  MainForm.ReloadDTButtonClick(self);
end;

procedure TMainForm.STTCheckBoxClick(Sender: TObject);
begin
  STTEdit.Enabled:=STTCheckBox.Checked;
  STTDirButton.Enabled:=STTCheckBox.Checked;
  STTEdit.Color:=clWindow;
end;

procedure TMainForm.STTDirButtonClick(Sender: TObject);
begin
  SelectDirDialog.Title:='Выберите папку где находятся STT-файлы';
  if SelectDirDialog.Execute then
    STTEdit.Text:=SelectDirDialog.FileName;
end;

procedure TMainForm.STTEditChange(Sender: TObject);
begin
  STTEdit.Color:=clWindow;
end;

// вывод отчёта
procedure TMainForm.WriteReport;
var
  lastrec: TStringList;
begin
  Report.Clear;
  Report.Lines.Add('Даты последних пополнений:');
  Report.Lines.AddStrings(DatePopoln);
  Report.Lines.Add('');
  Report.Lines.Add('last_rec.txt:');
  lastrec:=TStringList.Create;
  try
    if FileExists(DirConsEdit.Text+'\Receive\last_rec.txt') then begin
      lastrec.LoadFromFile(DirConsEdit.Text+'\Receive\last_rec.txt', TEncoding.ANSI);
      Report.Lines.AddStrings(lastrec);
    end
    else Report.Lines.Add('Не найден файл last_rec.txt');
  finally
    lastrec.Free
  end;

end;

// заполнение таблицы с базами
procedure TMainForm.FillTableBase;
var
  i, p, index: integer;
  bases: TStringList;
  ShortName, FullName, s: string;
  NewItem: TListItem;
begin
  ShortName:='';
  FullName:='';
  s:='';
  ListBases.Items.Clear;
  if FileExists(DirConsEdit.Text+'\base\baselist.cfg') then begin
    bases:=TStringList.Create;
    try
      bases.LoadFromFile(DirConsEdit.Text+'\base\baselist.cfg', TEncoding.Default);
      bases.Sort;
      for i:=0 to bases.Count-1 do begin
        if bases[i]='' then continue;

        p:=Pos('COMMENT', bases[i]);
        if p>0 then begin
          s:=Copy(bases[i], 0, p-2);
          FullName:=Copy(bases[i], p+9, Length(bases[i])-(p+9));
        end
        else begin
          s:=bases[i];
          for index:=0 to BasesLST.Count-1 do begin
            p:=Pos('=', BasesLST[index]);
            if ShortName=Copy(BasesLST[index], 0, p-1) then begin
              FullName:=Copy(BasesLST[index], p+1, Length(BasesLst[index]));
              Break;
            end;
          end;
        end;
        ShortName:=UpperCase(s);

        NewItem:=ListBases.Items.Add;
        NewItem.SubItems.Add(IntToStr(i+1));
        NewItem.SubItems.Add(ShortName);
        NewItem.SubItems.Add(FullName);
      end;
    finally
      bases.Free;
    end;
  end
  else
    MessageDlg('Ошибка', 'Не найден файл baselist.cfg',
      mtError, [mbOK], 0);
end;

end.

