unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DateTimePicker, Forms, Controls, Graphics,
  ActiveX, Dialogs, ComCtrls, ExtCtrls, StdCtrls, Menus, Buttons, EditBtn,
  ShlObj, Windows, RegExpr, zlibfunc, LCLType,lconvencoding, RichMemo,
  LazUTF8, DateUtils;

type

  { TMainForm }

  TMainForm = class(TForm)
    BasesMenu: TPopupMenu;
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
    Memo1: TMemo;
    NameOrgEdit: TEdit;
    PageControl1: TPageControl;
    PopolnButton: TSpeedButton;
    PopolnCheckBox: TCheckBox;
    PopolnEdit: TLabeledEdit;
    ReloadDTButton: TSpeedButton;
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
    procedure cbCreateSubDirClick(Sender: TObject);
    procedure CopyButtonClick(Sender: TObject);
    procedure DirConsButtonClick(Sender: TObject);
    procedure DirConsEditChange(Sender: TObject);
    procedure ErrDocREMouseEnter(Sender: TObject);
    procedure ExitButtonClick(Sender: TObject);
    procedure adm1Click(Sender: TObject);
    procedure FindEditChange(Sender: TObject);
    procedure FindEditMouseEnter(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure KeyCmdButtonClick(Sender: TObject);
    procedure ListBasesColumnClick(Sender: TObject; Column: TListColumn);
    procedure ListBasesCustomDrawItem(Sender: TCustomListView; Item: TListItem;
      State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure LogPageShow(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure NameOrgEditChange(Sender: TObject);
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
    procedure RunPopolnButtonClick(Sender: TObject);
    procedure SetDTButtonClick(Sender: TObject);
    procedure STTCheckBoxClick(Sender: TObject);
    procedure STTDirButtonClick(Sender: TObject);
    procedure STTEditClick(Sender: TObject);
    procedure TreeView1Click(Sender: TObject);
    procedure CopyConsFiles(FromPath, ToPath, Mask: string);
    function GetPathX(const path: string): string;
    procedure CopyUSR;
    procedure CopySTT;
    procedure CopyPopoln;
    procedure USRCheckBoxClick(Sender: TObject);
    procedure USRDirButtonClick(Sender: TObject);
    procedure USRDirEditChange(Sender: TObject);
    procedure USRDirEditClick(Sender: TObject);
    procedure yes1Click(Sender: TObject);
    procedure WriteReport;
  private
    BasesLST: TStringList;
    TempPath, USRPath, PopolnPath, AppPath: string;
    AddDate, DirConsChange: boolean;
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

procedure TMainForm.TreeView1Click(Sender: TObject);
begin
  PageControl.ActivePageIndex:=TreeView1.Selected.Index;
  InfoLabel.Caption:='Текущий раздел: '+TreeView1.Selected.Text;
end;

procedure TMainForm.ExitButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.CopyButtonClick(Sender: TObject);
begin
  if USRCheckBox.Checked then CopyUSR;
  if STTCheckBox.Checked then CopySTT;
  if PopolnCheckBox.Checked then CopyPopoln;
end;

procedure TMainForm.base1Click(Sender: TObject);
begin
  KeyCmdEdit.Text:=KeyCmdEdit.Text+' /base*';
end;

procedure TMainForm.cbCreateSubDirClick(Sender: TObject);
begin
  if cbCreateSubDir.Checked then
    USRPath:=USRPath+'\'+NameOrgEdit.Text+'\'
  else
    USRPath:=USRPath+'\';
end;

procedure TMainForm.DirConsButtonClick(Sender: TObject);
begin
  SelectDirDialog.Title:='Выберите папку с Консультантом';
  if SelectDirDialog.Execute then begin
    DirConsEdit.Text:=SelectDirDialog.FileName;
    DirConsChange:=True;
  end;
end;

procedure TMainForm.DirConsEditChange(Sender: TObject);
begin
  DirConsChange:=True;
  DirConsEdit.Color:=clWindow;
end;

procedure TMainForm.ErrDocREMouseEnter(Sender: TObject);
begin
  ErrDocRE.SetFocus;
end;

procedure TMainForm.CopyConsFiles(FromPath, ToPath, Mask: string);
var
  SR: TSearchRec;
  s: string;
begin
  if ToPath<>'' then begin
    s:=Copy(Mask, Length(Mask)-2, 3);
    TotalCopyLabel.Caption:='Копирую '+s+' файлы...';
    if not ForceDirectories(ToPath) then begin
      MessageDlg('Ошибка', 'Не могу создать папку '+ToPath, mtError, [mbOK], 0);
      Exit;
    end;

       if FindFirst(FromPath+Mask, faAnyFile, SR)=0 then begin
        repeat
          if not CopyFileEx(FromPath+SR.Name, ToPath+'\'+SR.Name, true, nil) then
            if MessageDlg('Произошла ошибка копирования файла '+SR.Name+'!'+#10#13+
              'Продолжить копирование?', mtError, [mbYes, mbNo], 0, mbNo)=mrNo then begin
                TotalCopyLabel.Caption:=Mask+'-файлы не скопированы';
                Exit;
              end;
          Application.ProcessMessages;
        until FindNext(SR) <> 0;
      end;
    end;

    TotalCopyLabel.Caption:=s+'-файлы скопированы';
    SysUtils.FindClose(SR);
end;

procedure TMainForm.CopyUSR;
begin
  CopyConsFiles(DirConsEdit.Text+'\Receive\', USRPath, 'CONS#*.USR');
end;

procedure TMainForm.CopySTT;
begin
  CopyConsFiles(STTEdit.Text+'\', USRPath, '*.STT');
end;

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
    TotalCopyLabel.Caption:=IntToStr(CopyThread.FFileNames.Count)+' файлов скопированы';

    //добавление в лог последней даты пополнения
    //формат папки с пополнением 3112pop
    RegExp := TRegExpr.Create;
    RegExp.ModifierI:=true;
    RegExp.Expression := '(\d\d\d\d)POP';
    for j:=0 to CopyThread.FFileNames.Count-1 do
      if RegExp.Exec(CopyThread.FFileNames[j]) then begin
        d:=inttostr(YearOf(Now))+'.'+Copy(RegExp.Match[1], 0, 2)+'.'+
          Copy(RegExp.Match[1], 3, 2);
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


procedure TMainForm.USRCheckBoxClick(Sender: TObject);
begin
  USRDirEdit.Color:=clWindow;
  USRDirEdit.Enabled:=USRCheckBox.Checked;
  USRDirButton.Enabled:=USRCheckBox.Checked;
  cbCreateSubDir.Enabled:=USRCheckBox.Checked;
end;

procedure TMainForm.USRDirButtonClick(Sender: TObject);
begin
  SelectDirDialog.Title:='Выберите папку куда нужно будет скопировать USR-файлы';
  if SelectDirDialog.Execute then
    USRDirEdit.Text:='[x]'+Copy(SelectDirDialog.FileName, 3, Length(SelectDirDialog.FileName));
end;

procedure TMainForm.USRDirEditChange(Sender: TObject);
begin
  USRDirEdit.Color:=clWindow;
  if Copy(USRDirEdit.Text, 0, 3)='[x]' then
    USRPath:=GetPathX(USRDirEdit.Text)
  else
    USRPath:=USRDirEdit.Text;
end;

procedure TMainForm.USRDirEditClick(Sender: TObject);
begin

end;

procedure TMainForm.yes1Click(Sender: TObject);
begin
  KeyCmdEdit.Text:=KeyCmdEdit.Text+' /yes';
end;

procedure TMainForm.adm1Click(Sender: TObject);
begin
  KeyCmdEdit.Text:=KeyCmdEdit.Text+'/adm';
end;

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

procedure TMainForm.FormClose(Sender: TObject; var CloseAction: TCloseAction);
var
  i: integer;
begin
  if not SaveCfg then
    MessageDlg('Ошибка', 'Не могу сохранить параметры программы',
      mtError, [mbOK], 0);
  DatePopoln.Free;
  BasesLST.Free;
  for I := 0 to ListFiles.Count-1 do DeleteFile(PChar(ListFiles[i]));
  ListFiles.Free;
end;

procedure TMainForm.FormCreate(Sender: TObject);
var
  buffer: array [0..255] of Char;
  s, s3: string;
  s2: RawByteString;
  f: text;
  hIcon: THandle;
  nIconId: DWORD;
  Icon2: TIcon;
begin
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
      ErrDocRE.LoadRichText(TFileStream.Create(TempPath+'\errors.rtf', fmOpenRead));
      KeyCmdMemo.LoadRichText(TFileStream.Create(TempPath+'\keys.rtf', fmOpenRead));
      ListFiles.Clear;
      ListFiles.Add(TempPath+'\bases.txt');
      ListFiles.Add(TempPath+'\errors.rtf');
      ListFiles.Add(TempPath+'\keys.rtf');
    end
    else begin
      MessageDlg('Ошибка', 'Невозможно загрузить файл bases.lst',
        mtError, [mbOK], 0);
      Application.Terminate;
    end;

  ErrDocRE.SelStart:=0;
  TotalCopyLabel.Caption:='';
  ClientLabel.Caption:='Организация: '+NameOrgEdit.Text;

  LoadedCfg:=LoadCfg;
  DirConsChange:=False;

  Label2.Caption:='АвтоПополнение'+#10#13+FileVersion(Application.ExeName)+
    #10#13+'Freeware (C) 2009-2017';

  PageControl.Page[0].Show;
  TreeView1.Selected:=TreeView1.Items.GetFirstNode;
  //загрузка иконки из эзешника
  if PrivateExtractIcons(pchar(Application.ExeName), 0, 64, 64, @hIcon, @nIconId,
    1, LR_LOADFROMFILE) <> 0 then
  try
    Icon2:=TIcon.Create;
    try
      Icon2.Handle:=hIcon;
      Image1.Picture.Icon.Assign(Icon2);
    finally
      Icon2.Free;
    end;
  finally
    DestroyIcon (hIcon);
  end;
  // инициализация прогрессбара на таскбаре в Windows 7
  if CheckWin32Version(6,1) then begin
    CoCreateInstance(CLSID_TaskbarList, nil, CLSCTX_INPROC, ITaskbarList3, iTaskBar);
    iTaskBar.HrInit;
    if (iTaskBar <> nil) then
      iTaskBar.SetProgressState(MainForm.Handle, TBPF_INDETERMINATE);
  end;
end;

procedure TMainForm.KeyCmdButtonClick(Sender: TObject);
begin
  KeyCmdMenu.PopUp;
end;

procedure TMainForm.ListBasesColumnClick(Sender: TObject; Column: TListColumn);
begin
  if Column.Index=0 then begin
    if Column.Caption='[  ]' then
      N4Click(nil)
    else
      N3Click(nil);
  end;
end;

procedure TMainForm.ListBasesCustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  if not Item.Checked then
    ListBases.Canvas.Font.Color:=clGray;
end;


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

procedure TMainForm.N3Click(Sender: TObject);
var
  i: integer;
begin
  ListBases.Items.BeginUpdate;
  for i := 0 to ListBases.Items.Count - 1 do ListBases.Items[i].Checked:=True;
  ListBases.Items.EndUpdate;
  ListBases.Columns[0].Caption:='[  ]';
end;

procedure TMainForm.N4Click(Sender: TObject);
var
  i: integer;
begin
  ListBases.Items.BeginUpdate;
  for i := 0 to ListBases.Items.Count - 1 do ListBases.Items[i].Checked:=False;
  ListBases.Items.EndUpdate;
  ListBases.Columns[0].Caption:='[v]';
end;

procedure TMainForm.NameOrgEditChange(Sender: TObject);
begin
   NameOrgEdit.Color:=clWindow;
   ClientLabel.Caption:='Организация: '+NameOrgEdit.Text;
end;

procedure TMainForm.NameOrgEditUTF8KeyPress(Sender: TObject;
  var UTF8Key: TUTF8Char);
begin
  if not ExecRegExpr('[\d\s\-_a-zа-яёЁ]', UTF8ToAnsi(UTF8Key)) then begin
   UTF8Key:=#0;
   MessageBeep(0);
  end;
end;

procedure TMainForm.norunner1Click(Sender: TObject);
begin
  KeyCmdEdit.Text:=KeyCmdEdit.Text+' /norunner';
end;

procedure TMainForm.OpenDirConsButtonClick(Sender: TObject);
begin
  if DirectoryExists(DirConsEdit.Text) then
    ShellExecute(MainForm.Handle, nil, PChar(DirConsEdit.Text), nil, nil,
      SW_SHOWNORMAL)
  else
    MessageDlg('Ошибка', 'Папка '+DirConsEdit.Text+' не найдена',
      mtError, [mbOk], 0);

end;

procedure TMainForm.PopolnButtonClick(Sender: TObject);
begin
  SelectDirDialog.Title:='Выберите папку с пополнением';
  if SelectDirDialog.Execute then
    PopolnEdit.Text:='[x]'+Copy(SelectDirDialog.FileName, 3, Length(SelectDirDialog.FileName));
end;

procedure TMainForm.PopolnCheckBoxClick(Sender: TObject);
begin
  PopolnEdit.Enabled:=PopolnCheckBox.Checked;
  PopolnButton.Enabled:=PopolnCheckBox.Checked;
  PopolnEdit.Color:=clWindow;
end;

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

procedure TMainForm.PopolnPageShow(Sender: TObject);
var
  FreeSize: integer;
  s, dir: string;
  ResFiles: TStringList;
begin
  if FileExists(DirConsEdit.Text+'\cons.exe') then
    ConsText.Caption:='cons.exe: '+GetFileVersionEx(DirConsEdit.Text+'\cons.exe')
  else
    ConsText.Caption:='Файл cons.exe не найден';

  if DirConsEdit.Text<>'' then begin
    ResFiles:=TStringList.Create;
    FindFiles(DirConsEdit.Text, 'vr*.res;ht*.res;sh*.res', ResFiles, false);
    if ResFiles.Count>0 then begin
      s:=ResFiles[ResFiles.Count-1];
      RESText.Caption:=Copy(s, s.LastDelimiter('\')+2, Length(s)-1)+': '+GetFileVersionEx(s);
    end
    else
      RESText.Caption:='RES файл не найден';
    ResFiles.Free;
  end;
  if DirConsEdit.Text<>'' then
    dir:=DirConsEdit.Text
  else
    dir:='C:\';
  SetCurrentDir(dir);
  FreeSize:=Round((DiskFree(0)/1024)/1024);
  if FreeSize<1000 then FreeSizeText.Font.Color:=clRed;
  FreeSizeText.Caption:='Свободное место на диске '+Copy(dir, 0, 1)+
    ': '+IntToStr(FreeSize)+' МБ';
  DateTimePicker1.DateTime:=Now;
end;

procedure TMainForm.process21Click(Sender: TObject);
begin
  KeyCmdEdit.Text:=KeyCmdEdit.Text+' /process=2';
end;

procedure TMainForm.receive1Click(Sender: TObject);
begin
  KeyCmdEdit.Text:=KeyCmdEdit.Text+' /receive';
end;

procedure TMainForm.ReloadDTButtonClick(Sender: TObject);
begin
  DateTimePicker1.DateTime:=Now;
end;

procedure TMainForm.ReportKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=VK_F5 then WriteReport;
end;

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

procedure TMainForm.STTEditClick(Sender: TObject);
begin
  STTEdit.Color:=clWindow;
end;

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

procedure TMainForm.FillTableBase;
var
  i, p, index: integer;
  bases: TStringList;
  s: string;
  NewItem: TListItem;
begin
  ListBases.Items.Clear;
  if FileExists(DirConsEdit.Text+'\base\baselist.cfg') then begin
    bases:=TStringList.Create;
    try
      bases.LoadFromFile(DirConsEdit.Text+'\base\baselist.cfg');
      bases.Sort;
      for i := 0 to bases.Count - 1 do begin
        s:=UpperCase(bases[i]);
        if s='' then continue;

        NewItem:=ListBases.Items.Add;
        NewItem.SubItems.Add(IntToStr(i+1));
        NewItem.SubItems.Add(s);

        p:=0;
        for index := 0 to BasesLST.Count - 1 do begin
          p:=Pos('=', BasesLST[index]);
          if s=Copy(BasesLST[index], 0, p-1) then begin
            NewItem.SubItems.Add(Copy(BasesLST[index], p+1, Length(BasesLst[index])));
            Break;
          end
          else begin
            //ListBases.Items[i].Checked:=False;
          end;
        end;
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

