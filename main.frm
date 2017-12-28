object MainForm: TMainForm
  Left = 268
  Height = 500
  Top = 184
  Width = 624
  Caption = 'АвтоПополнение'
  ClientHeight = 500
  ClientWidth = 624
  Constraints.MinHeight = 500
  Constraints.MinWidth = 624
  DefaultMonitor = dmPrimary
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  Position = poWorkAreaCenter
  ShowHint = True
  LCLVersion = '6.2'
  object TreeView1: TTreeView
    Cursor = crHandPoint
    Left = 0
    Height = 408
    Top = 42
    Width = 120
    Align = alLeft
    BorderStyle = bsNone
    Images = ImageList1
    ReadOnly = True
    RowSelect = True
    ScrollBars = ssNone
    ShowLines = False
    ShowRoot = False
    TabOrder = 0
    ToolTips = False
    OnClick = TreeView1Click
    OnKeyUp = TreeView1KeyUp
    Options = [tvoAutoItemHeight, tvoHideSelection, tvoKeepCollapsedNodes, tvoReadOnly, tvoRowSelect, tvoShowButtons, tvoThemedDraw]
    Items.Data = {
      F9FFFFFF020006000000FFFFFFFF00000000FFFFFFFFFFFFFFFF000000000000
      00000014000000D09FD0BED0BFD0BED0BBD0BDD0B5D0BDD0B8D0B5FFFFFFFF00
      000000FFFFFFFFFFFFFFFF00000000000000000008000000D091D0B0D0B7D18B
      FFFFFFFF00000000FFFFFFFFFFFFFFFF00000000000000000012000000D09DD0
      B0D181D182D180D0BED0B9D0BAD0B8FFFFFFFF00000000FFFFFFFFFFFFFFFF00
      00000000000000000A000000D09ED182D187D191D182FFFFFFFF00000000FFFF
      FFFFFFFFFFFF00000000000000000018000000D094D0BED0BAD183D0BCD0B5D0
      BDD182D0B0D186D0B8D18FFFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000
      0000000015000000D09E20D0BFD180D0BED0B3D180D0B0D0BCD0BCD0B5
    }
  end
  object PageControl: TPageControl
    Left = 120
    Height = 408
    Top = 42
    Width = 504
    TabStop = False
    ActivePage = DocPage
    Align = alClient
    ShowTabs = False
    TabIndex = 4
    TabOrder = 1
    object PopolnPage: TTabSheet
      Caption = 'PopolnPage'
      ClientHeight = 400
      ClientWidth = 496
      OnShow = PopolnPageShow
      object Shape1: TShape
        AnchorSideRight.Control = PopolnPage
        AnchorSideRight.Side = asrBottom
        Left = 8
        Height = 96
        Top = 8
        Width = 479
        Anchors = [akTop, akLeft, akRight]
        BorderSpacing.Right = 9
        Brush.Style = bsClear
        Pen.Color = clBtnShadow
      end
      object Shape2: TShape
        AnchorSideRight.Control = PopolnPage
        AnchorSideRight.Side = asrBottom
        Left = 8
        Height = 96
        Top = 120
        Width = 479
        Anchors = [akTop, akLeft, akRight]
        BorderSpacing.Right = 9
        Brush.Style = bsClear
        Pen.Color = clBtnShadow
      end
      object TotalCopyLabel: TLabel
        AnchorSideRight.Control = ProgressBar1
        AnchorSideRight.Side = asrBottom
        Left = 18
        Height = 15
        Top = 16
        Width = 459
        Alignment = taCenter
        Anchors = [akTop, akLeft, akRight]
        AutoSize = False
        Caption = 'TotalCopyLabel'
        ParentColor = False
      end
      object ProgressBar1: TProgressBar
        AnchorSideRight.Control = Shape1
        AnchorSideRight.Side = asrBottom
        Left = 18
        Height = 18
        Top = 32
        Width = 459
        Anchors = [akTop, akLeft, akRight]
        BorderSpacing.Right = 10
        TabOrder = 0
      end
      object CopyButton: TButton
        AnchorSideLeft.Control = ProgressBar1
        AnchorSideRight.Control = RunPopolnButton
        Left = 37
        Height = 25
        Hint = 'Копировать обновления, USR и STT файлы'
        Top = 61
        Width = 100
        Anchors = [akTop, akRight]
        BorderSpacing.Left = 10
        Caption = 'Копировать'
        OnClick = CopyButtonClick
        TabOrder = 1
      end
      object OpenDirConsButton: TButton
        AnchorSideRight.Control = ProgressBar1
        AnchorSideRight.Side = asrBottom
        Left = 357
        Height = 25
        Hint = 'Открыть папку с Консультатнтом'
        Top = 61
        Width = 100
        Anchors = [akTop, akRight]
        BorderSpacing.Right = 20
        Caption = 'Папка К+'
        OnClick = OpenDirConsButtonClick
        TabOrder = 3
      end
      object RunPopolnButton: TButton
        AnchorSideLeft.Control = CopyButton
        AnchorSideLeft.Side = asrBottom
        AnchorSideRight.Control = OpenDirConsButton
        Left = 197
        Height = 25
        Hint = 'Запуск Консультанта для пополнения'
        Top = 61
        Width = 100
        Anchors = [akTop, akRight]
        BorderSpacing.Left = 60
        BorderSpacing.Right = 60
        Caption = 'Пополнить'
        OnClick = RunPopolnButtonClick
        TabOrder = 2
      end
      object ConsText: TLabel
        Left = 16
        Height = 15
        Top = 136
        Width = 48
        Caption = 'ConsText'
        ParentColor = False
      end
      object ResText: TLabel
        Left = 16
        Height = 15
        Top = 160
        Width = 39
        Caption = 'ResText'
        ParentColor = False
      end
      object FreeSizeText: TLabel
        Left = 16
        Height = 15
        Top = 186
        Width = 63
        Caption = 'FreeSizeText'
        ParentColor = False
      end
      object Shape3: TShape
        AnchorSideRight.Control = PopolnPage
        AnchorSideRight.Side = asrBottom
        Left = 8
        Height = 56
        Top = 232
        Width = 479
        Anchors = [akTop, akLeft, akRight]
        BorderSpacing.Right = 9
        Brush.Style = bsClear
        Pen.Color = clBtnShadow
      end
      object SetDTButton: TButton
        AnchorSideRight.Control = Shape3
        AnchorSideRight.Side = asrBottom
        Left = 355
        Height = 25
        Hint = 'Изменить системную дату и время'
        Top = 246
        Width = 102
        Anchors = [akTop, akRight]
        BorderSpacing.Right = 30
        Caption = 'Изменить'
        OnClick = SetDTButtonClick
        TabOrder = 6
      end
      object DateTimePicker1: TDateTimePicker
        AnchorSideLeft.Side = asrBottom
        AnchorSideRight.Control = SetDTButton
        Left = 149
        Height = 23
        Hint = 'Колесиком мышки можно менять дату и время'
        Top = 248
        Width = 185
        CenturyFrom = 1941
        MaxDate = 2958465
        MinDate = -53780
        AutoSize = False
        TabOrder = 5
        BorderSpacing.Left = 21
        BorderSpacing.Right = 21
        TrailingSeparator = False
        TextForNullDate = 'NULL'
        LeadingZeros = True
        Anchors = [akTop, akLeft, akRight]
        Kind = dtkDateTime
        TimeFormat = tf24
        TimeDisplay = tdHMS
        DateMode = dmComboBox
        Date = 43006
        Time = 0.745481307872979
        UseDefaultSeparators = True
        HideDateTimeParts = [dtpSecond]
        MonthNames = 'Long'
        ShowMonthNames = True
        Options = [dtpoAutoCheck, dtpoFlatButton]
      end
      object ReloadDTButton: TButton
        AnchorSideLeft.Control = Shape3
        Left = 38
        Height = 25
        Top = 246
        Width = 91
        BorderSpacing.Left = 30
        Caption = 'Обновить'
        OnClick = ReloadDTButtonClick
        TabOrder = 4
      end
    end
    object BasesPage: TTabSheet
      Caption = 'BasesPage'
      ClientHeight = 400
      ClientWidth = 496
      object ListBases: TListView
        Left = 0
        Height = 400
        Top = 0
        Width = 496
        Align = alClient
        AutoSort = False
        AutoWidthLastColumn = True
        BorderStyle = bsNone
        Checkboxes = True
        Columns = <        
          item
            Caption = '[v]'
            MaxWidth = 26
            MinWidth = 26
            Width = 26
          end        
          item
            Alignment = taCenter
            Caption = '№'
            MaxWidth = 27
            MinWidth = 27
            Width = 27
          end        
          item
            Alignment = taCenter
            Caption = 'Короткое название'
            MaxWidth = 70
            MinWidth = 70
            Width = 70
          end        
          item
            Caption = 'Полное название'
            Width = 373
          end>
        GridLines = True
        PopupMenu = BasesMenu
        ReadOnly = True
        RowSelect = True
        ScrollBars = ssAutoVertical
        TabOrder = 0
        ViewStyle = vsReport
        OnColumnClick = ListBasesColumnClick
        OnCustomDrawItem = ListBasesCustomDrawItem
        OnEnter = ListBasesEnter
      end
    end
    object CfgPage: TTabSheet
      Caption = 'CfgPage'
      ClientHeight = 400
      ClientWidth = 496
      OnHide = CfgPageHide
      object ScrollBox1: TScrollBox
        Left = 0
        Height = 400
        Top = 0
        Width = 496
        HorzScrollBar.Increment = 36
        HorzScrollBar.Page = 365
        HorzScrollBar.Smooth = True
        HorzScrollBar.Tracking = True
        VertScrollBar.Increment = 40
        VertScrollBar.Page = 400
        VertScrollBar.Smooth = True
        VertScrollBar.Tracking = True
        Align = alClient
        BorderStyle = bsNone
        ClientHeight = 400
        ClientWidth = 479
        TabOrder = 0
        object GroupBox1: TGroupBox
          AnchorSideRight.Side = asrBottom
          Left = 8
          Height = 83
          Top = 8
          Width = 465
          Anchors = [akTop, akLeft, akRight]
          BorderSpacing.Right = 10
          Caption = 'Название организации'
          ClientHeight = 63
          ClientWidth = 461
          TabOrder = 0
          object NameOrgEdit: TEdit
            AnchorSideRight.Control = GroupBox1
            AnchorSideRight.Side = asrBottom
            Left = 8
            Height = 23
            Top = 3
            Width = 445
            Anchors = [akTop, akLeft, akRight]
            BorderSpacing.Right = 8
            MaxLength = 100
            OnChange = NameOrgEditChange
            OnKeyUp = NameOrgEditKeyUp
            OnUTF8KeyPress = NameOrgEditUTF8KeyPress
            TabOrder = 0
          end
          object Label4: TLabel
            AnchorSideRight.Control = NameOrgEdit
            AnchorSideRight.Side = asrBottom
            Left = 8
            Height = 33
            Top = 30
            Width = 445
            Anchors = [akTop, akLeft, akRight]
            AutoSize = False
            Caption = 'В названии организации можно использовать только буквы, цифры, пробелы и символы - знак подчеркивания и тире. Длина не более 100 символов.'
            Font.Pitch = fpVariable
            Font.Quality = fqDraft
            ParentColor = False
            ParentFont = False
            WordWrap = True
          end
        end
        object DirConsEdit: TLabeledEdit
          AnchorSideRight.Control = DirConsButton
          Left = 18
          Height = 23
          Top = 112
          Width = 421
          Anchors = [akTop, akLeft, akRight]
          AutoSize = False
          EditLabel.AnchorSideLeft.Control = DirConsEdit
          EditLabel.AnchorSideTop.Side = asrCenter
          EditLabel.AnchorSideRight.Control = DirConsEdit
          EditLabel.AnchorSideRight.Side = asrBottom
          EditLabel.AnchorSideBottom.Control = DirConsEdit
          EditLabel.Left = 18
          EditLabel.Height = 15
          EditLabel.Top = 94
          EditLabel.Width = 421
          EditLabel.Caption = 'Папка с Консультантом'
          EditLabel.ParentColor = False
          TabOrder = 1
          OnChange = DirConsEditChange
        end
        object DirConsButton: TSpeedButton
          AnchorSideRight.Side = asrBottom
          Left = 439
          Height = 23
          Hint = 'Открыть окно для выбора папки'
          Top = 112
          Width = 23
          Anchors = [akTop, akRight]
          BorderSpacing.Right = 21
          Caption = '...'
          OnClick = DirConsButtonClick
        end
        object GroupBox2: TGroupBox
          AnchorSideRight.Side = asrBottom
          Left = 8
          Height = 72
          Top = 144
          Width = 465
          Anchors = [akTop, akLeft, akRight]
          BorderSpacing.Right = 10
          ClientHeight = 52
          ClientWidth = 461
          TabOrder = 2
          object PopolnCheckBox: TCheckBox
            Left = 8
            Height = 19
            Top = -18
            Width = 156
            Caption = 'Копировать пополнение'
            OnClick = PopolnCheckBoxClick
            TabOrder = 0
          end
          object PopolnEdit: TLabeledEdit
            AnchorSideRight.Control = PopolnButton
            Left = 8
            Height = 23
            Top = 21
            Width = 420
            Anchors = [akTop, akLeft, akRight]
            EditLabel.AnchorSideLeft.Control = PopolnEdit
            EditLabel.AnchorSideRight.Control = PopolnEdit
            EditLabel.AnchorSideRight.Side = asrBottom
            EditLabel.AnchorSideBottom.Control = PopolnEdit
            EditLabel.Left = 8
            EditLabel.Height = 15
            EditLabel.Top = 3
            EditLabel.Width = 420
            EditLabel.Caption = 'Папка с пополнением'
            EditLabel.ParentColor = False
            TabOrder = 1
            OnChange = PopolnEditChange
          end
          object PopolnButton: TSpeedButton
            AnchorSideRight.Control = GroupBox2
            AnchorSideRight.Side = asrBottom
            Left = 428
            Height = 23
            Hint = 'Открыть окно для выбора папки'
            Top = 21
            Width = 23
            Anchors = [akTop, akRight]
            BorderSpacing.Right = 10
            Caption = '...'
            OnClick = PopolnButtonClick
          end
        end
        object GroupBox3: TGroupBox
          AnchorSideRight.Side = asrBottom
          Left = 8
          Height = 72
          Top = 224
          Width = 465
          Anchors = [akTop, akLeft, akRight]
          BorderSpacing.Right = 10
          ClientHeight = 52
          ClientWidth = 461
          TabOrder = 3
          object STTCheckBox: TCheckBox
            Left = 8
            Height = 19
            Top = -18
            Width = 149
            Caption = 'Копировать STT файлы'
            OnClick = STTCheckBoxClick
            TabOrder = 0
          end
          object STTEdit: TLabeledEdit
            AnchorSideRight.Control = STTDirButton
            Left = 8
            Height = 23
            Top = 21
            Width = 420
            Anchors = [akTop, akLeft, akRight]
            EditLabel.AnchorSideLeft.Control = STTEdit
            EditLabel.AnchorSideRight.Control = STTEdit
            EditLabel.AnchorSideRight.Side = asrBottom
            EditLabel.AnchorSideBottom.Control = STTEdit
            EditLabel.Left = 8
            EditLabel.Height = 15
            EditLabel.Top = 3
            EditLabel.Width = 420
            EditLabel.Caption = 'Папка с STT файлами'
            EditLabel.ParentColor = False
            TabOrder = 1
            OnChange = STTEditChange
          end
          object STTDirButton: TSpeedButton
            AnchorSideRight.Side = asrBottom
            Left = 428
            Height = 23
            Hint = 'Открыть окно для выбора папки'
            Top = 21
            Width = 23
            Anchors = [akTop, akRight]
            BorderSpacing.Right = 10
            Caption = '...'
            OnClick = STTDirButtonClick
          end
        end
        object GroupBox4: TGroupBox
          AnchorSideRight.Side = asrBottom
          Left = 8
          Height = 91
          Top = 304
          Width = 465
          Anchors = [akTop, akLeft, akRight]
          BorderSpacing.Right = 10
          ClientHeight = 71
          ClientWidth = 461
          TabOrder = 4
          object USRCheckBox: TCheckBox
            Left = 8
            Height = 19
            Top = -18
            Width = 150
            Caption = 'Копировать USR файлы'
            OnClick = USRCheckBoxClick
            OnKeyUp = USRCheckBoxKeyUp
            TabOrder = 0
          end
          object USRDirEdit: TLabeledEdit
            AnchorSideRight.Control = USRDirButton
            Left = 8
            Height = 23
            Top = 21
            Width = 420
            Anchors = [akTop, akLeft, akRight]
            EditLabel.AnchorSideLeft.Control = USRDirEdit
            EditLabel.AnchorSideRight.Control = USRDirEdit
            EditLabel.AnchorSideRight.Side = asrBottom
            EditLabel.AnchorSideBottom.Control = USRDirEdit
            EditLabel.Left = 8
            EditLabel.Height = 15
            EditLabel.Top = 3
            EditLabel.Width = 420
            EditLabel.Caption = 'Папка с USR файлами'
            EditLabel.ParentColor = False
            TabOrder = 1
            OnChange = USRDirEditChange
          end
          object USRDirButton: TSpeedButton
            AnchorSideRight.Side = asrBottom
            Left = 428
            Height = 23
            Hint = 'Открыть окно для выбора папки'
            Top = 21
            Width = 23
            Anchors = [akTop, akRight]
            BorderSpacing.Right = 10
            Caption = '...'
            OnClick = USRDirButtonClick
          end
          object cbCreateSubDir: TCheckBox
            Left = 15
            Height = 19
            Top = 48
            Width = 276
            Caption = 'Создавать подпапки с названием организации'
            Checked = True
            OnClick = cbCreateSubDirClick
            State = cbChecked
            TabOrder = 2
          end
        end
        object GroupBox5: TGroupBox
          AnchorSideRight.Side = asrBottom
          Left = 8
          Height = 48
          Top = 400
          Width = 465
          Anchors = [akTop, akLeft, akRight]
          BorderSpacing.Right = 10
          Caption = 'После запуска программы'
          ClientHeight = 28
          ClientWidth = 461
          TabOrder = 5
          object cbCloseProg: TCheckBox
            Left = 8
            Height = 19
            Top = 0
            Width = 343
            Caption = 'Закрывать программу (работает только с ключом /AUTO)'
            TabOrder = 0
          end
        end
        object KeyCmdEdit: TLabeledEdit
          AnchorSideRight.Control = KeyCmdButton
          Left = 8
          Height = 23
          Top = 472
          Width = 438
          Anchors = [akTop, akLeft, akRight]
          EditLabel.AnchorSideLeft.Control = KeyCmdEdit
          EditLabel.AnchorSideRight.Control = KeyCmdEdit
          EditLabel.AnchorSideRight.Side = asrBottom
          EditLabel.AnchorSideBottom.Control = KeyCmdEdit
          EditLabel.Left = 8
          EditLabel.Height = 15
          EditLabel.Top = 454
          EditLabel.Width = 438
          EditLabel.Caption = 'Ключи командной строки Консультанта'
          EditLabel.ParentColor = False
          TabOrder = 6
          Text = '/adm /receive /base* /yes'
        end
        object ResetCFGButton: TButton
          AnchorSideRight.Control = ScrollBox1
          AnchorSideRight.Side = asrBottom
          Left = 361
          Height = 25
          Top = 512
          Width = 108
          Anchors = [akTop, akRight]
          BorderSpacing.Right = 10
          Caption = 'Сброс настроек'
          OnClick = ResetCFGButtonClick
          TabOrder = 7
        end
        object KeyCmdButton: TSpeedButton
          AnchorSideLeft.Side = asrBottom
          AnchorSideRight.Control = ScrollBox1
          AnchorSideRight.Side = asrBottom
          Left = 446
          Height = 23
          Top = 472
          Width = 23
          Anchors = [akTop, akRight]
          BorderSpacing.Right = 10
          Caption = '\/'
          OnClick = KeyCmdButtonClick
        end
      end
    end
    object LogPage: TTabSheet
      Caption = 'LogPage'
      ClientHeight = 400
      ClientWidth = 496
      OnShow = LogPageShow
      object Report: TMemo
        Left = 0
        Height = 400
        Hint = 'Обновить окно можно кнопкой F5'
        Top = 0
        Width = 496
        Align = alClient
        BorderStyle = bsNone
        OnKeyDown = ReportKeyDown
        ReadOnly = True
        ScrollBars = ssAutoBoth
        TabOrder = 0
      end
    end
    object DocPage: TTabSheet
      Caption = 'DocPage'
      ClientHeight = 400
      ClientWidth = 496
      object PageControl1: TPageControl
        Left = 0
        Height = 357
        Top = 0
        Width = 496
        Align = alClient
        TabOrder = 0
      end
      object Panel2: TPanel
        Left = 0
        Height = 43
        Top = 357
        Width = 496
        Align = alBottom
        Anchors = []
        BevelOuter = bvNone
        Caption = 'Panel2'
        ClientHeight = 43
        ClientWidth = 496
        TabOrder = 1
        OnClick = Panel2Click
        object Label1: TLabel
          Left = 16
          Height = 15
          Top = 14
          Width = 35
          Caption = 'Поиск'
          ParentColor = False
        end
        object FindEdit: TEdit
          AnchorSideRight.Control = Panel2
          AnchorSideRight.Side = asrBottom
          Left = 64
          Height = 23
          Top = 11
          Width = 412
          Anchors = [akTop, akLeft, akRight]
          BorderSpacing.Right = 20
          OnChange = FindEditChange
          OnMouseEnter = FindEditMouseEnter
          TabOrder = 0
        end
      end
    end
    object AboutPage: TTabSheet
      Caption = 'AboutPage'
      ClientHeight = 400
      ClientWidth = 496
      object Image1: TImage
        Left = 16
        Height = 64
        Top = 16
        Width = 64
        AutoSize = True
        Picture.Data = {
          1754506F727461626C654E6574776F726B477261706869637301000089504E47
          0D0A1A0A0000000D4948445200000040000000400806000000AA6971DE000000
          097048597300000B1300000B1301009A9C18000001254944415478DAED9BB111
          C2300C4565C36230021C051D0BB002052B64013A0A0E4680C9386803C791102C
          D98E9ECA2417FBBFC88AA4B3459C5B101159AC0E93CB69739FCD770F0FA26FD7
          7D78012022E245FC3B84E0517C1B42F41E030000000000000000706C53EB01CF
          EBE6EBFDE5713B5E0FE812DFF719960000000000000000000000000000000000
          00000000000000000000000CB4646DF194DDDC3EEF4AD53E4FE60196FDFC9463
          C552276635462C7D82DAEF8EB54C540B6CACE16B697A552C7DBD6AC715F53CE0
          1F011641D524111A22C4EAB76A9609FE22C832A7304D85FB081BF506892E81D6
          E2B315439F84E6109FB51A6C0BCE253E6935587A01453F00000A4BC07A4B9BC6
          52C2036A0F62C400000000000000C070E3E86CFBA2C7C3D3EEED09CBDB4D9169
          6F8C770000000049454E44AE426082
        }
        Transparent = True
      end
      object Label2: TLabel
        Left = 104
        Height = 45
        Top = 24
        Width = 122
        Caption = 'АвтоПополнение'#13#10'Версия 2.0'#13#10'Freeware (C) 2009-2017'
        ParentColor = False
        WordWrap = True
      end
      object Label3: TLabel
        AnchorSideLeft.Control = AboutPage
        AnchorSideRight.Control = AboutPage
        AnchorSideRight.Side = asrBottom
        AnchorSideBottom.Control = AboutPage
        AnchorSideBottom.Side = asrBottom
        Left = 10
        Height = 291
        Top = 99
        Width = 476
        Anchors = [akTop, akLeft, akRight, akBottom]
        AutoSize = False
        BorderSpacing.Left = 10
        BorderSpacing.Right = 10
        BorderSpacing.Bottom = 10
        Caption = 'Программа распростроняется под лицензией GNU General Public License version 3'#13#10'Это проект с открытыми исходными кодами, они доступны на GitHub (https://github.com/ap-exe/AutoPopoln2).'#13#10'Абсолютна бесплатна для коммерческого использования.'#13#10'Программа написана на FreePascal(https://www.freepascal.org/) с использованием и CodeTyphon(http://www.pilotlogic.com/).'#13#10#13#10'Лицензионное соглашение.'#13#10#13#10'ПРОГРАММА РАСПРОСТРАНЯЕТСЯ ПО ПРИНЦИПУ "КАК ЕСТЬ". ПРИ ЭТОМ НЕ ПРЕДУСМАТРИВАЕТСЯ НИКАКИХ ГАРАНТИЙ, ЯВНЫХ ИЛИ ПОДРАЗУМЕВАЕМЫХ. ВЫ ИСПОЛЬЗУЕТЕ ЕЕ НА СВОЙ СОБСТВЕННЫЙ РИСК. АВТОР НЕ НЕСЕТ ОТВЕТСТВЕННОСТИ ЗА ПОТЕРИ ДАННЫХ, ПОВРЕЖДЕНИЯ, ПОТЕРИ ПРИБЫЛИ ИЛИ ЛЮБЫЕ ДРУГИЕ ВИДЫ ПОТЕРЬ, СВЯЗАННЫЕ С ИСПОЛЬЗОВАНИЕМ (ПРАВИЛЬНЫМ ИЛИ НЕПРАВИЛЬНЫМ) ЭТОЙ ПРОГРАММЫ.'#13#10#13#10'Если вы не согласны с условиями данной лицензии, то должны удалить программу со своих устройств хранения информации и отказаться от дальнейшего использования этого программного продукта.'
        ParentColor = False
        WordWrap = True
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Height = 50
    Top = 450
    Width = 624
    Align = alBottom
    BevelOuter = bvNone
    ClientHeight = 50
    ClientWidth = 624
    TabOrder = 2
    object ExitButton: TButton
      AnchorSideRight.Control = Panel1
      AnchorSideRight.Side = asrBottom
      Left = 519
      Height = 25
      Top = 12
      Width = 85
      Anchors = [akRight]
      BorderSpacing.Right = 20
      Caption = 'Выход'
      OnClick = ExitButtonClick
      TabOrder = 0
    end
  end
  object InfoPanel: TPanel
    Left = 0
    Height = 42
    Top = 0
    Width = 624
    Align = alTop
    Alignment = taLeftJustify
    BevelOuter = bvNone
    ClientHeight = 42
    ClientWidth = 624
    Color = clGrayText
    ParentColor = False
    TabOrder = 3
    object ClientLabel: TLabel
      Left = 9
      Height = 15
      Top = 5
      Width = 42
      Caption = 'Клиент:'
      Font.Color = clWhite
      ParentColor = False
      ParentFont = False
    end
    object InfoLabel: TLabel
      Left = 8
      Height = 15
      Top = 24
      Width = 166
      Caption = 'Текущий раздел: Пополнение'
      Font.Color = clWhite
      ParentColor = False
      ParentFont = False
    end
  end
  object ImageList1: TImageList
    Height = 32
    Width = 3
    Left = 16
    Top = 256
  end
  object KeyCmdMenu: TPopupMenu
    Left = 17
    Top = 315
    object adm1: TMenuItem
      Caption = '/adm'
      OnClick = adm1Click
    end
    object receive1: TMenuItem
      Caption = '/receive'
      OnClick = receive1Click
    end
    object base1: TMenuItem
      Caption = '/base*'
      OnClick = base1Click
    end
    object norunner1: TMenuItem
      Caption = '/norunner'
      OnClick = norunner1Click
    end
    object process21: TMenuItem
      Caption = '/process=2'
      OnClick = process21Click
    end
    object yes1: TMenuItem
      Caption = '/yes'
      OnClick = yes1Click
    end
  end
  object BasesMenu: TPopupMenu
    Left = 77
    Top = 315
    object N3: TMenuItem
      Caption = 'Выделить все'
      OnClick = N3Click
    end
    object N4: TMenuItem
      Caption = 'Отменить все'
      OnClick = N4Click
    end
  end
  object SelectDirDialog: TSelectDirectoryDialog
    Options = [ofOldStyleDialog, ofEnableSizing, ofViewDetail]
    Left = 17
    Top = 368
  end
end
