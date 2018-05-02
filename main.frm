object MainForm: TMainForm
  Left = 272
  Height = 500
  Top = 182
  Width = 640
  HorzScrollBar.Page = 1
  HorzScrollBar.Visible = False
  VertScrollBar.Page = 1
  VertScrollBar.Visible = False
  Caption = 'АвтоПополнение'
  ClientHeight = 500
  ClientWidth = 640
  Constraints.MinHeight = 500
  Constraints.MinWidth = 640
  DefaultMonitor = dmPrimary
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  OnWindowStateChange = FormWindowStateChange
  Position = poWorkAreaCenter
  ShowHint = True
  LCLVersion = '6.3'
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
    ScrollBars = ssAutoVertical
    ShowLines = False
    ShowRoot = False
    TabOrder = 0
    ToolTips = False
    OnClick = TreeView1Click
    OnKeyDown = TreeView1KeyDown
    OnKeyUp = TreeView1KeyUp
    OnMouseMove = TreeView1MouseMove
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
    Width = 520
    TabStop = False
    ActivePage = PopolnPage
    Align = alClient
    ShowTabs = False
    TabIndex = 0
    TabOrder = 1
    object PopolnPage: TTabSheet
      Caption = 'PopolnPage'
      ClientHeight = 400
      ClientWidth = 512
      OnMouseMove = TreeView1MouseMove
      OnShow = PopolnPageShow
      object Shape1: TShape
        AnchorSideRight.Control = PopolnPage
        AnchorSideRight.Side = asrBottom
        Left = 8
        Height = 96
        Top = 8
        Width = 495
        Anchors = [akTop, akLeft, akRight]
        BorderSpacing.Right = 9
        Brush.Style = bsClear
        Pen.Color = clBtnShadow
        OnMouseMove = TreeView1MouseMove
      end
      object Shape2: TShape
        AnchorSideRight.Control = PopolnPage
        AnchorSideRight.Side = asrBottom
        Left = 8
        Height = 96
        Top = 120
        Width = 495
        Anchors = [akTop, akLeft, akRight]
        BorderSpacing.Right = 9
        Brush.Style = bsClear
        Pen.Color = clBtnShadow
        OnMouseMove = TreeView1MouseMove
      end
      object TotalCopyLabel: TLabel
        AnchorSideRight.Control = ProgressBar1
        AnchorSideRight.Side = asrBottom
        Left = 18
        Height = 15
        Top = 16
        Width = 475
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
        Width = 475
        Anchors = [akTop, akLeft, akRight]
        BorderSpacing.Right = 10
        TabOrder = 0
      end
      object CopyButton: TButton
        Left = 36
        Height = 25
        Hint = 'Копировать обновления, USR и STT файлы'
        Top = 61
        Width = 100
        Caption = 'Копировать'
        OnClick = CopyButtonClick
        TabOrder = 1
      end
      object OpenDirConsButton: TButton
        AnchorSideRight.Side = asrBottom
        Left = 356
        Height = 25
        Hint = 'Открыть папку с Консультатнтом'
        Top = 61
        Width = 100
        BorderSpacing.Right = 20
        Caption = 'Папка К+'
        OnClick = OpenDirConsButtonClick
        TabOrder = 3
      end
      object RunPopolnButton: TButton
        AnchorSideLeft.Side = asrBottom
        Left = 196
        Height = 25
        Hint = 'Запустить Консультант с заданными ключами'
        Top = 61
        Width = 100
        BorderSpacing.Left = 60
        BorderSpacing.Right = 60
        Caption = 'Выполнить'
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
        Width = 495
        Anchors = [akTop, akLeft, akRight]
        BorderSpacing.Right = 9
        Brush.Style = bsClear
        Pen.Color = clBtnShadow
        OnMouseMove = TreeView1MouseMove
      end
      object SetDTButton: TButton
        AnchorSideRight.Control = Shape3
        AnchorSideRight.Side = asrBottom
        Left = 373
        Height = 25
        Hint = 'Изменить системную дату и время'
        Top = 246
        Width = 100
        Anchors = [akTop, akRight]
        BorderSpacing.Right = 30
        Caption = 'Изменить'
        OnClick = SetDTButtonClick
        TabOrder = 6
      end
      object DateTimePicker1: TDateTimePicker
        AnchorSideLeft.Side = asrBottom
        AnchorSideRight.Control = SetDTButton
        Left = 160
        Height = 23
        Hint = 'Колесиком мышки можно менять дату и время'
        Top = 248
        Width = 192
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
        Width = 100
        BorderSpacing.Left = 30
        Caption = 'Обновить'
        OnClick = ReloadDTButtonClick
        TabOrder = 4
      end
    end
    object BasesPage: TTabSheet
      Caption = 'BasesPage'
      ClientHeight = 400
      ClientWidth = 512
      OnMouseMove = TreeView1MouseMove
      object ListBases: TListView
        Left = 0
        Height = 400
        Top = 0
        Width = 512
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
            Width = 389
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
        OnMouseMove = TreeView1MouseMove
      end
    end
    object CfgPage: TTabSheet
      Caption = 'CfgPage'
      ClientHeight = 503
      ClientWidth = 642
      object ScrollBox1: TScrollBox
        Left = 0
        Height = 503
        Top = 0
        Width = 642
        HorzScrollBar.Increment = 36
        HorzScrollBar.Page = 365
        VertScrollBar.Increment = 57
        VertScrollBar.Page = 503
        Align = alClient
        BorderStyle = bsNone
        ClientHeight = 503
        ClientWidth = 625
        TabOrder = 0
        OnMouseMove = TreeView1MouseMove
        object GroupBox1: TGroupBox
          AnchorSideRight.Control = ScrollBox1
          AnchorSideRight.Side = asrBottom
          Left = 8
          Height = 83
          Top = 8
          Width = 599
          Anchors = [akTop, akLeft, akRight]
          BorderSpacing.Right = 10
          Caption = 'Название организации'
          ClientHeight = 63
          ClientWidth = 595
          TabOrder = 0
          OnMouseMove = TreeView1MouseMove
          object NameOrgEdit: TEdit
            AnchorSideRight.Control = GroupBox1
            AnchorSideRight.Side = asrBottom
            Left = 8
            Height = 28
            Top = 3
            Width = 575
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
            Width = 575
            Anchors = [akTop, akLeft, akRight]
            AutoSize = False
            Caption = 'В названии организации можно использовать только буквы, цифры, пробелы и символы - знак подчеркивания и тире. Длина не более 100 символов.'
            Font.Pitch = fpVariable
            Font.Quality = fqDraft
            ParentColor = False
            ParentFont = False
            WordWrap = True
            OnMouseMove = TreeView1MouseMove
          end
        end
        object GroupBox2: TGroupBox
          AnchorSideRight.Control = ScrollBox1
          AnchorSideRight.Side = asrBottom
          Left = 8
          Height = 72
          Top = 222
          Width = 599
          Anchors = [akTop, akLeft, akRight]
          BorderSpacing.Right = 10
          ClientHeight = 52
          ClientWidth = 595
          TabOrder = 1
          OnMouseMove = TreeView1MouseMove
          object PopolnCheckBox: TCheckBox
            Left = 8
            Height = 24
            Top = -18
            Width = 199
            Caption = 'Копировать пополнение'
            OnClick = PopolnCheckBoxClick
            TabOrder = 0
          end
          object PopolnEdit: TLabeledEdit
            AnchorSideRight.Control = PopolnButton
            Left = 8
            Height = 28
            Top = 21
            Width = 544
            Anchors = [akTop, akLeft, akRight]
            EditLabel.AnchorSideLeft.Control = PopolnEdit
            EditLabel.AnchorSideRight.Control = PopolnEdit
            EditLabel.AnchorSideRight.Side = asrBottom
            EditLabel.AnchorSideBottom.Control = PopolnEdit
            EditLabel.Left = 8
            EditLabel.Height = 20
            EditLabel.Top = 3
            EditLabel.Width = 544
            EditLabel.Caption = 'Папка с пополнением'
            EditLabel.ParentColor = False
            TabOrder = 1
            OnChange = PopolnEditChange
          end
          object PopolnButton: TSpeedButton
            AnchorSideRight.Control = GroupBox2
            AnchorSideRight.Side = asrBottom
            Left = 560
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
          AnchorSideRight.Control = ScrollBox1
          AnchorSideRight.Side = asrBottom
          Left = 8
          Height = 72
          Top = 302
          Width = 599
          Anchors = [akTop, akLeft, akRight]
          BorderSpacing.Right = 10
          ClientHeight = 52
          ClientWidth = 595
          TabOrder = 2
          OnMouseMove = TreeView1MouseMove
          object STTCheckBox: TCheckBox
            Left = 8
            Height = 24
            Top = -18
            Width = 186
            Caption = 'Копировать STT файлы'
            OnClick = STTCheckBoxClick
            TabOrder = 0
          end
          object STTEdit: TLabeledEdit
            AnchorSideRight.Control = STTDirButton
            Left = 8
            Height = 28
            Top = 21
            Width = 538
            Anchors = [akTop, akLeft, akRight]
            EditLabel.AnchorSideLeft.Control = STTEdit
            EditLabel.AnchorSideRight.Control = STTEdit
            EditLabel.AnchorSideRight.Side = asrBottom
            EditLabel.AnchorSideBottom.Control = STTEdit
            EditLabel.Left = 8
            EditLabel.Height = 20
            EditLabel.Top = 3
            EditLabel.Width = 538
            EditLabel.Caption = 'Папка с STT файлами'
            EditLabel.ParentColor = False
            TabOrder = 1
            OnChange = STTEditChange
          end
          object STTDirButton: TSpeedButton
            AnchorSideRight.Side = asrBottom
            Left = 558
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
          AnchorSideRight.Control = ScrollBox1
          AnchorSideRight.Side = asrBottom
          Left = 8
          Height = 91
          Top = 382
          Width = 599
          Anchors = [akTop, akLeft, akRight]
          BorderSpacing.Right = 10
          ClientHeight = 71
          ClientWidth = 595
          TabOrder = 3
          OnMouseMove = TreeView1MouseMove
          object USRCheckBox: TCheckBox
            Left = 8
            Height = 24
            Top = -18
            Width = 189
            Caption = 'Копировать USR файлы'
            OnClick = USRCheckBoxClick
            OnKeyUp = USRCheckBoxKeyUp
            TabOrder = 0
          end
          object USRDirEdit: TLabeledEdit
            AnchorSideRight.Control = USRDirButton
            Left = 8
            Height = 28
            Top = 21
            Width = 538
            Anchors = [akTop, akLeft, akRight]
            EditLabel.AnchorSideLeft.Control = USRDirEdit
            EditLabel.AnchorSideRight.Control = USRDirEdit
            EditLabel.AnchorSideRight.Side = asrBottom
            EditLabel.AnchorSideBottom.Control = USRDirEdit
            EditLabel.Left = 8
            EditLabel.Height = 20
            EditLabel.Top = 3
            EditLabel.Width = 538
            EditLabel.Caption = 'Папка куда будут копироваться USR файлы'
            EditLabel.ParentColor = False
            TabOrder = 1
            OnChange = USRDirEditChange
          end
          object USRDirButton: TSpeedButton
            AnchorSideRight.Side = asrBottom
            Left = 558
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
            Height = 24
            Top = 48
            Width = 355
            Caption = 'Создавать подпапки с названием организации'
            Checked = True
            OnClick = cbCreateSubDirClick
            State = cbChecked
            TabOrder = 2
          end
        end
        object GroupBox5: TGroupBox
          AnchorSideRight.Control = ScrollBox1
          AnchorSideRight.Side = asrBottom
          Left = 8
          Height = 48
          Top = 480
          Width = 599
          Anchors = [akTop, akLeft, akRight]
          BorderSpacing.Right = 10
          Caption = 'После запуска программы'
          ClientHeight = 28
          ClientWidth = 595
          TabOrder = 4
          OnMouseMove = TreeView1MouseMove
          object cbCloseProg: TCheckBox
            Left = 8
            Height = 24
            Top = 0
            Width = 427
            Caption = 'Закрывать программу (работает только с ключом /AUTO)'
            TabOrder = 0
          end
        end
        object Panel3: TPanel
          AnchorSideLeft.Control = ScrollBox1
          AnchorSideRight.Control = ScrollBox1
          AnchorSideRight.Side = asrBottom
          Left = 0
          Height = 50
          Top = 560
          Width = 621
          Anchors = [akTop, akLeft, akRight]
          BevelOuter = bvNone
          ClientHeight = 50
          ClientWidth = 621
          TabOrder = 5
          OnMouseMove = TreeView1MouseMove
          object ResetCFGButton: TButton
            AnchorSideLeft.Control = Panel3
            AnchorSideRight.Side = asrBottom
            Left = 8
            Height = 25
            Top = 13
            Width = 108
            BorderSpacing.Left = 8
            BorderSpacing.Right = 10
            Caption = 'Сброс настроек'
            OnClick = ResetCFGButtonClick
            TabOrder = 0
          end
          object ApplyButton: TButton
            AnchorSideRight.Control = Panel3
            AnchorSideRight.Side = asrBottom
            Left = 488
            Height = 25
            Top = 13
            Width = 108
            Anchors = [akTop, akRight]
            BorderSpacing.Right = 20
            Caption = 'Применить'
            OnClick = ApplyButtonClick
            TabOrder = 1
          end
        end
        object DisableResizeWindowCB: TCheckBox
          Left = 18
          Height = 24
          Top = 536
          Width = 365
          Caption = 'Запретить изменение размера окна программы'
          OnClick = DisableResizeWindowCBClick
          TabOrder = 6
        end
        object GroupBox6: TGroupBox
          AnchorSideRight.Control = ScrollBox1
          AnchorSideRight.Side = asrBottom
          Left = 8
          Height = 115
          Top = 98
          Width = 599
          Anchors = [akTop, akLeft, akRight]
          BorderSpacing.Right = 10
          ClientHeight = 95
          ClientWidth = 595
          TabOrder = 7
          object KeyCmdEdit: TLabeledEdit
            AnchorSideRight.Control = KeyCmdButton
            Left = 8
            Height = 28
            Top = 62
            Width = 545
            Anchors = [akTop, akLeft, akRight]
            EditLabel.AnchorSideLeft.Control = KeyCmdEdit
            EditLabel.AnchorSideRight.Control = KeyCmdEdit
            EditLabel.AnchorSideRight.Side = asrBottom
            EditLabel.AnchorSideBottom.Control = KeyCmdEdit
            EditLabel.Left = 8
            EditLabel.Height = 20
            EditLabel.Top = 55
            EditLabel.Width = 545
            EditLabel.Caption = 'Ключи командной строки Консультанта'
            EditLabel.ParentColor = False
            TabOrder = 0
            Text = '/adm /receive /base* /yes'
          end
          object KeyCmdButton: TSpeedButton
            AnchorSideLeft.Side = asrBottom
            AnchorSideRight.Side = asrBottom
            Left = 563
            Height = 24
            Top = 62
            Width = 24
            Anchors = [akTop, akRight]
            BorderSpacing.Right = 23
            Caption = '\/'
            OnClick = KeyCmdButtonClick
          end
          object DirConsButton: TSpeedButton
            AnchorSideRight.Side = asrBottom
            Left = 563
            Height = 23
            Hint = 'Открыть окно для выбора папки'
            Top = 16
            Width = 23
            Anchors = [akTop, akRight]
            BorderSpacing.Right = 21
            Caption = '...'
            OnClick = DirConsButtonClick
          end
          object DirConsEdit: TLabeledEdit
            AnchorSideRight.Control = DirConsButton
            Left = 8
            Height = 23
            Top = 16
            Width = 545
            Anchors = [akTop, akLeft, akRight]
            AutoSize = False
            EditLabel.AnchorSideLeft.Control = DirConsEdit
            EditLabel.AnchorSideTop.Side = asrCenter
            EditLabel.AnchorSideRight.Control = DirConsEdit
            EditLabel.AnchorSideRight.Side = asrBottom
            EditLabel.AnchorSideBottom.Control = DirConsEdit
            EditLabel.Left = 8
            EditLabel.Height = 20
            EditLabel.Top = -3
            EditLabel.Width = 545
            EditLabel.Caption = 'Папка с Консультантом'
            EditLabel.ParentColor = False
            ParentFont = False
            TabOrder = 1
            OnChange = DirConsEditChange
          end
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
        OnMouseMove = TreeView1MouseMove
        ReadOnly = True
        ScrollBars = ssAutoBoth
        TabOrder = 0
      end
    end
    object DocPage: TTabSheet
      Caption = 'DocPage'
      ClientHeight = 400
      ClientWidth = 499
      object PageControl1: TPageControl
        Left = 0
        Height = 336
        Top = 0
        Width = 499
        Align = alClient
        TabOrder = 1
        OnChange = PageControl1Change
        OnMouseMove = TreeView1MouseMove
      end
      object Panel2: TPanel
        Left = 0
        Height = 64
        Top = 336
        Width = 499
        Align = alBottom
        Anchors = []
        BevelOuter = bvNone
        ClientHeight = 64
        ClientWidth = 499
        TabOrder = 0
        OnMouseMove = TreeView1MouseMove
        object Label1: TLabel
          Left = 9
          Height = 15
          Top = 35
          Width = 35
          Caption = 'Поиск'
          ParentColor = False
        end
        object FindEdit: TEdit
          AnchorSideLeft.Side = asrBottom
          AnchorSideRight.Control = PrevSearchButton
          Left = 56
          Height = 23
          Top = 32
          Width = 363
          Anchors = [akTop, akLeft, akRight]
          BorderSpacing.Right = 10
          OnChange = FindEditChange
          OnKeyDown = FindEditKeyDown
          OnMouseEnter = FindEditMouseEnter
          TabOrder = 0
        end
        object PrevSearchButton: TButton
          AnchorSideRight.Control = NextSearchButton
          Left = 429
          Height = 25
          Hint = 'Найти предыдущее'
          Top = 32
          Width = 25
          Anchors = [akTop, akRight]
          BorderSpacing.Right = 10
          Caption = '<'
          OnClick = PrevSearchButtonClick
          TabOrder = 1
        end
        object NextSearchButton: TButton
          AnchorSideRight.Control = Panel2
          AnchorSideRight.Side = asrBottom
          Left = 464
          Height = 25
          Hint = 'Найти следующее'
          Top = 32
          Width = 25
          Anchors = [akTop, akRight]
          BorderSpacing.Right = 10
          Caption = '>'
          OnClick = NextSearchButtonClick
          TabOrder = 2
        end
        object WordWrapCB: TCheckBox
          Left = 9
          Height = 19
          Top = 6
          Width = 129
          Caption = 'Перенос по словам'
          Checked = True
          OnClick = WordWrapCBClick
          State = cbChecked
          TabOrder = 3
        end
      end
    end
    object AboutPage: TTabSheet
      Caption = 'AboutPage'
      ClientHeight = 400
      ClientWidth = 522
      OnMouseMove = TreeView1MouseMove
      object Image1: TImage
        Left = 16
        Height = 64
        Top = 16
        Width = 64
        AutoSize = True
        OnMouseMove = TreeView1MouseMove
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
        Left = 96
        Height = 45
        Top = 16
        Width = 122
        Caption = 'АвтоПополнение'#13#10'Версия 2.0'#13#10'Freeware (C) 2009-2017'
        ParentColor = False
        WordWrap = True
        OnMouseMove = TreeView1MouseMove
      end
      object Memo1: TMemo
        AnchorSideLeft.Control = AboutPage
        AnchorSideTop.Control = Image1
        AnchorSideTop.Side = asrBottom
        AnchorSideRight.Control = AboutPage
        AnchorSideRight.Side = asrBottom
        AnchorSideBottom.Control = AboutPage
        AnchorSideBottom.Side = asrBottom
        Left = 5
        Height = 310
        Top = 85
        Width = 512
        Anchors = [akTop, akLeft, akRight, akBottom]
        BorderSpacing.Left = 5
        BorderSpacing.Top = 5
        BorderSpacing.Right = 5
        BorderSpacing.Bottom = 5
        Lines.Strings = (
          'Программа распростроняется под лицензией GNU General Public License version 3'
          'Это проект с открытыми исходными кодами, они доступны на GitHub (https://github.com/ap-exe/AutoPopoln2).'
          'Абсолютна бесплатна для коммерческого использования.'
          'Программа написана на FreePascal(https://www.freepascal.org/) с использованием CodeTyphon(http://www.pilotlogic.com/).'
          ''
          'Лицензионное соглашение.'
          ''
          'ПРОГРАММА РАСПРОСТРАНЯЕТСЯ ПО ПРИНЦИПУ "КАК ЕСТЬ". ПРИ ЭТОМ НЕ ПРЕДУСМАТРИВАЕТСЯ НИКАКИХ ГАРАНТИЙ, ЯВНЫХ ИЛИ ПОДРАЗУМЕВАЕМЫХ. ВЫ ИСПОЛЬЗУЕТЕ ЕЕ НА СВОЙ СОБСТВЕННЫЙ РИСК. АВТОР НЕ НЕСЕТ ОТВЕТСТВЕННОСТИ ЗА ПОТЕРИ ДАННЫХ, ПОВРЕЖДЕНИЯ, ПОТЕРИ ПРИБЫЛИ ИЛИ ЛЮБЫЕ ДРУГИЕ ВИДЫ ПОТЕРЬ, СВЯЗАННЫЕ С ИСПОЛЬЗОВАНИЕМ (ПРАВИЛЬНЫМ ИЛИ НЕПРАВИЛЬНЫМ) ЭТОЙ ПРОГРАММЫ.'
          ''
          'Если вы не согласны с условиями данной лицензии, то должны удалить программу со своих устройств хранения информации и отказаться от дальнейшего использования этого программного продукта.'
        )
        ReadOnly = True
        ScrollBars = ssAutoVertical
        TabOrder = 0
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Height = 50
    Top = 450
    Width = 640
    Align = alBottom
    BevelOuter = bvNone
    ClientHeight = 50
    ClientWidth = 640
    TabOrder = 2
    OnMouseMove = TreeView1MouseMove
    object ExitButton: TButton
      AnchorSideRight.Control = Panel1
      AnchorSideRight.Side = asrBottom
      AnchorSideBottom.Control = Panel1
      AnchorSideBottom.Side = asrBottom
      Left = 535
      Height = 25
      Top = 15
      Width = 85
      Anchors = [akRight, akBottom]
      BorderSpacing.Right = 20
      BorderSpacing.Bottom = 10
      Caption = 'Выход'
      OnClick = ExitButtonClick
      TabOrder = 0
    end
  end
  object InfoPanel: TPanel
    Left = 0
    Height = 42
    Top = 0
    Width = 640
    Align = alTop
    Alignment = taLeftJustify
    BevelOuter = bvNone
    ClientHeight = 42
    ClientWidth = 640
    Color = clGrayText
    ParentColor = False
    TabOrder = 3
    object ClientLabel: TLabel
      AnchorSideLeft.Control = InfoPanel
      AnchorSideTop.Control = InfoPanel
      Left = 10
      Height = 15
      Top = 5
      Width = 75
      BorderSpacing.Left = 10
      BorderSpacing.Top = 5
      Caption = 'Организация:'
      Font.Color = clWhite
      ParentColor = False
      ParentFont = False
    end
    object InfoLabel: TLabel
      AnchorSideLeft.Control = InfoPanel
      AnchorSideTop.Control = ClientLabel
      AnchorSideTop.Side = asrBottom
      AnchorSideBottom.Control = InfoPanel
      AnchorSideBottom.Side = asrBottom
      Left = 10
      Height = 17
      Top = 20
      Width = 166
      Anchors = [akTop, akLeft, akBottom]
      BorderSpacing.Left = 10
      BorderSpacing.Bottom = 5
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
    object SelectAllBases: TMenuItem
      Caption = 'Выделить все'
      OnClick = SelectAllBasesClick
    end
    object UnselectAllBases: TMenuItem
      Caption = 'Отменить все'
      OnClick = UnselectAllBasesClick
    end
    object InvertSelect: TMenuItem
      Caption = 'Инвертировать выделение'
      OnClick = InvertSelectClick
    end
  end
  object SelectDirDialog: TSelectDirectoryDialog
    Options = [ofOldStyleDialog, ofEnableSizing, ofViewDetail]
    Left = 17
    Top = 368
  end
end
