object MainForm: TMainForm
  Left = 317
  Height = 441
  Top = 184
  Width = 555
  Caption = 'Редактирование bases.lst'
  ClientHeight = 421
  ClientWidth = 555
  Menu = MainMenu1
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  Position = poScreenCenter
  LCLVersion = '6.2'
  object PageControl1: TPageControl
    Left = 0
    Height = 421
    Top = 0
    Width = 555
    ActivePage = TabSheet1
    Align = alClient
    Constraints.MinHeight = 421
    Constraints.MinWidth = 555
    TabIndex = 0
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Базы'
      ClientHeight = 393
      ClientWidth = 547
      object BasesListEditor: TValueListEditor
        Left = 0
        Height = 393
        Top = 0
        Width = 547
        Align = alClient
        BorderStyle = bsNone
        DefaultColWidth = 96
        FixedCols = 0
        PopupMenu = BasesPopupMenu
        RowCount = 2
        TabOrder = 0
        TitleStyle = tsNative
        DoubleBuffered = True
        KeyOptions = [keyEdit, keyAdd, keyDelete]
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goColSizing, goEditing, goAutoAddRows, goTabs, goRowSelect, goThumbTracking, goRelaxedRowSelect, goDblClickAutoSize, goFixedRowNumbering]
        TitleCaptions.Strings = (
          'База'
          'Полное название'
        )
        OnStringsChange = BasesListEditorStringsChange
        ColWidths = (
          96
          451
        )
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Ошибки'
      ClientHeight = 393
      ClientWidth = 547
      object ErrEdit: TRichMemo
        Left = 0
        Height = 393
        Top = 0
        Width = 547
        Align = alClient
        BorderStyle = bsNone
        HideSelection = False
        OnKeyPress = ErrEditKeyPress
        Rtf = '{\rtf1\ansi\ansicpg1251\deff0\nouicompat\deflang1049{\fonttbl{\f0\fnil Segoe UI;}}'#13#10'{\*\generator Riched20 10.0.16299}\viewkind4\uc1 '#13#10'\pard\f0\fs18\par'#13#10'}'#13#10#0
        ScrollBars = ssAutoVertical
        TabOrder = 0
        ZoomFactor = 1
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Ключи'
      ClientHeight = 393
      ClientWidth = 547
      object KeyEdit: TRichMemo
        Left = 0
        Height = 393
        Top = 0
        Width = 547
        Align = alClient
        BorderStyle = bsNone
        HideSelection = False
        OnKeyPress = KeyEditKeyPress
        Rtf = '{\rtf1\ansi\ansicpg1251\deff0\nouicompat\deflang1049{\fonttbl{\f0\fnil Segoe UI;}}'#13#10'{\*\generator Riched20 10.0.16299}\viewkind4\uc1 '#13#10'\pard\f0\fs18\par'#13#10'}'#13#10#0
        ScrollBars = ssAutoVertical
        TabOrder = 0
        ZoomFactor = 1
      end
    end
    object About: TTabSheet
      Caption = 'О программе'
      ClientHeight = 393
      ClientWidth = 547
      object Image1: TImage
        Left = 16
        Height = 64
        Top = 16
        Width = 64
      end
      object Label1: TLabel
        Left = 90
        Height = 15
        Top = 22
        Width = 34
        Caption = 'Label1'
        ParentColor = False
      end
      object Label2: TLabel
        AnchorSideLeft.Control = About
        AnchorSideRight.Control = About
        AnchorSideRight.Side = asrBottom
        AnchorSideBottom.Control = About
        AnchorSideBottom.Side = asrBottom
        Left = 10
        Height = 287
        Top = 96
        Width = 527
        Anchors = [akTop, akLeft, akRight, akBottom]
        AutoSize = False
        BorderSpacing.Left = 10
        BorderSpacing.Right = 10
        BorderSpacing.Bottom = 10
        Caption = 'Программа распростроняется под лицензией GNU General Public License version 3'#13#10'Это проект с открытыми исходными кодами, они доступны на GitHub (https://github.com/ap-exe/AutoPopoln2).'#13#10'Абсолютна бесплатна для коммерческого использования.'#13#10'Программа написана на FreePascal(https://www.freepascal.org/) с использованием Lazarus(http://www.lazarus-ide.org/) и CodeTyphon(http://www.pilotlogic.com/).'#13#10#13#10'Лицензионное соглашение.'#13#10#13#10'ПРОГРАММА РАСПРОСТРАНЯЕТСЯ ПО ПРИНЦИПУ "КАК ЕСТЬ". ПРИ ЭТОМ НЕ ПРЕДУСМАТРИВАЕТСЯ НИКАКИХ ГАРАНТИЙ, ЯВНЫХ ИЛИ ПОДРАЗУМЕВАЕМЫХ. ВЫ ИСПОЛЬЗУЕТЕ ЕЕ НА СВОЙ СОБСТВЕННЫЙ РИСК. АВТОР НЕ НЕСЕТ ОТВЕТСТВЕННОСТИ ЗА ПОТЕРИ ДАННЫХ, ПОВРЕЖДЕНИЯ, ПОТЕРИ ПРИБЫЛИ ИЛИ ЛЮБЫЕ ДРУГИЕ ВИДЫ ПОТЕРЬ, СВЯЗАННЫЕ С ИСПОЛЬЗОВАНИЕМ (ПРАВИЛЬНЫМ ИЛИ НЕПРАВИЛЬНЫМ) ЭТОЙ ПРОГРАММЫ.'#13#10#13#10'Если вы не согласны с условиями данной лицензии, то должны удалить программу со своих устройств хранения информации и отказаться от дальнейшего использования этого программного продукта.'
        ParentColor = False
        WordWrap = True
      end
    end
  end
  object MainMenu1: TMainMenu
    Left = 112
    Top = 296
    object FileMenuItem: TMenuItem
      Caption = 'Файл'
      object OpenLST: TMenuItem
        Caption = 'Открыть LST'
        ShortCut = 16463
        OnClick = OpenLSTClick
      end
      object SaveLST: TMenuItem
        Caption = 'Сохранить LST'
        ShortCut = 16467
        OnClick = SaveLSTClick
      end
      object MenuItem6: TMenuItem
        Caption = '-'
      end
      object LoadBasesTXT: TMenuItem
        Caption = 'Загрузить описание баз'
        OnClick = LoadBasesTXTClick
      end
      object SaveBasesTXT: TMenuItem
        Caption = 'Сохранить описание баз'
        OnClick = SaveBasesTXTClick
      end
      object MenuItem9: TMenuItem
        Caption = '-'
      end
      object LoadError: TMenuItem
        Caption = 'Загрузить описание ошибок'
        OnClick = LoadErrorClick
      end
      object SaveError: TMenuItem
        Caption = 'Сохранить описание ошибок'
        OnClick = SaveErrorClick
      end
      object MenuItem12: TMenuItem
        Caption = '-'
      end
      object LoadKey: TMenuItem
        Caption = 'Загрузить описание ключей'
        OnClick = LoadKeyClick
      end
      object SaveKey: TMenuItem
        Caption = 'Сохранить описание ключей'
        OnClick = SaveKeyClick
      end
      object MenuItem16: TMenuItem
        Caption = '-'
      end
      object ExitItem: TMenuItem
        Caption = 'Выход'
        OnClick = ExitItemClick
      end
    end
    object EditMenuItem: TMenuItem
      Caption = 'Правка'
      object AddItemBases: TMenuItem
        Caption = 'Добавить описание базы'
        OnClick = AddItemBasesClick
      end
      object DelItemBases: TMenuItem
        Caption = 'Удалить описание базы'
        OnClick = DelItemBasesClick
      end
    end
  end
  object BasesPopupMenu: TPopupMenu
    Left = 168
    Top = 296
    object AddItemBasesPop: TMenuItem
      Caption = 'Добавить'
      OnClick = AddItemBasesClick
    end
    object DelItemBasesPop: TMenuItem
      Caption = 'Удалить'
      OnClick = DelItemBasesClick
    end
  end
  object OpenDialog1: TOpenDialog
    Title = 'Открыть файл'
    Left = 240
    Top = 296
  end
  object SaveDialog1: TSaveDialog
    Title = 'Сохранить файл'
    Left = 40
    Top = 296
  end
end
