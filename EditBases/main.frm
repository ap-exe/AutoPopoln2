object MainForm: TMainForm
  Left = 316
  Height = 441
  Top = 214
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
          434
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
        Picture.Data = {
          1754506F727461626C654E6574776F726B47726170686963C501000089504E47
          0D0A1A0A0000000D4948445200000040000000400806000000AA6971DE000000
          097048597300000B1300000B1301009A9C18000001774944415478DAED5BDB91
          C230109352070D50D4F571251C7550D435401BA0FB20617C04270EC179CC6A7F
          E25912CF5AA055563300C183DD42A7A3D0106880FB355D4FC801C00DC04DC955
          E3B9ABCAEF2DC95D339FE35E2BCF17026DC9FA390AEA9088F1CDEBEBA0070091
          C300ECA343BDF32CFB7B90230048EBF501E68B34053EDE01A300C0712AE50190
          5E22B678C1DC1B0516E6B07BC04C45990EC06274E022BFAAA6F8B09A8FB62960
          00EA4A5A1D00FEC9A1FAB9850B36050CC0F880F31E006C37E3F33A931BA28C12
          D528558FEE99C7F3EAE7D2FB5E51345747BACF13804D4FE60447A420D07A8204
          2299A200C0F385E129601934003B1C61274D9336454D81C131DFA668D914B862
          C13645DD03AA2A8A4DD1E2C3DA14F59BE0E625AD0E0036454D816D4B9A4D519B
          A28ED96CB2291A9802964103B0C31176D2346953D414181CF36D8A964D812B16
          6C53D43DA0AAA2D8142D3EAC4D51BF096E5ED2EA006053D414D8B6A4D914FD80
          29CAEF5F467384BA3F4F878F3F99C3647F4A9E1A9C0000000049454E44AE4260
          82
        }
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
        Caption = 'Программа распростроняется под лицензией GNU General Public License version 3'#13#10'Это проект с открытыми исходными кодами, они доступны на GitHub (https://github.com/ap-exe/AutoPopoln2).'#13#10'Абсолютна бесплатна для коммерческого использования.'#13#10'Программа написана на FreePascal(https://www.freepascal.org/) с использованием CodeTyphon(http://www.pilotlogic.com/).'#13#10#13#10'Лицензионное соглашение.'#13#10#13#10'ПРОГРАММА РАСПРОСТРАНЯЕТСЯ ПО ПРИНЦИПУ "КАК ЕСТЬ". ПРИ ЭТОМ НЕ ПРЕДУСМАТРИВАЕТСЯ НИКАКИХ ГАРАНТИЙ, ЯВНЫХ ИЛИ ПОДРАЗУМЕВАЕМЫХ. ВЫ ИСПОЛЬЗУЕТЕ ЕЕ НА СВОЙ СОБСТВЕННЫЙ РИСК. АВТОР НЕ НЕСЕТ ОТВЕТСТВЕННОСТИ ЗА ПОТЕРИ ДАННЫХ, ПОВРЕЖДЕНИЯ, ПОТЕРИ ПРИБЫЛИ ИЛИ ЛЮБЫЕ ДРУГИЕ ВИДЫ ПОТЕРЬ, СВЯЗАННЫЕ С ИСПОЛЬЗОВАНИЕМ (ПРАВИЛЬНЫМ ИЛИ НЕПРАВИЛЬНЫМ) ЭТОЙ ПРОГРАММЫ.'#13#10#13#10'Если вы не согласны с условиями данной лицензии, то должны удалить программу со своих устройств хранения информации и отказаться от дальнейшего использования этого программного продукта.'
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
