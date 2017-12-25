object MainForm: TMainForm
  Left = 85
  Height = 415
  Top = 85
  Width = 521
  Caption = 'Редактирование bases.lst'
  ClientHeight = 395
  ClientWidth = 521
  Menu = MainMenu1
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  Position = poScreenCenter
  LCLVersion = '6.2'
  object ExtendedTabControl1: TExtendedTabControl
    Left = 0
    Height = 395
    Top = 0
    Width = 521
    OnChanging = ExtendedTabControl1Changing
    TabIndex = 0
    Tabs.Strings = (
      'Базы'
    )
    Align = alClient
    OnMouseMove = ExtendedTabControl1MouseMove
    PopupMenu = TabsPopupMenu
    TabOrder = 0
    ShowToolBar = tsRight
    object ExtendedTabToolbar1: TExtendedTabToolbar
      Left = 497
      Height = 21
      Top = 0
      Width = 28
      Align = alCustom
      AutoSize = True
      Constraints.MaxHeight = 21
      Constraints.MinHeight = 21
      EdgeBorders = [ebLeft]
      ShowCaptions = True
      TabOrder = 0
    end
    object PageControl1: TPageControl
      Left = 2
      Height = 370
      Top = 23
      Width = 517
      ActivePage = TabSheet1
      Align = alClient
      ShowTabs = False
      TabIndex = 0
      TabOrder = 2
      object TabSheet1: TTabSheet
        Caption = 'Базы'
        ClientHeight = 362
        ClientWidth = 509
        object BasesListEditor: TValueListEditor
          Left = 0
          Height = 362
          Top = 0
          Width = 509
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
            413
          )
        end
      end
    end
    object AddTabButton: TExtendedTabToolButton
      Left = 3
      Hint = 'Добавление вкладки'
      Top = 0
      Caption = '+'
      OnClick = AddTabButtonClick
    end
  end
  object MainMenu1: TMainMenu
    Left = 120
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
        Caption = 'Загрузить названия баз'
        OnClick = LoadBasesTXTClick
      end
      object SaveBasesTXT: TMenuItem
        Caption = 'Сохранить названия баз'
        OnClick = SaveBasesTXTClick
      end
      object MenuItem12: TMenuItem
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
    object AboutItem: TMenuItem
      Caption = 'О программе'
      OnClick = AboutItemClick
    end
  end
  object BasesPopupMenu: TPopupMenu
    Left = 216
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
    Left = 304
    Top = 296
  end
  object SaveDialog1: TSaveDialog
    Title = 'Сохранить файл'
    Left = 40
    Top = 296
  end
  object TabsPopupMenu: TPopupMenu
    OnPopup = TabsPopupMenuPopup
    Left = 392
    Top = 296
    object AddTabItem: TMenuItem
      Caption = 'Добавить'
      OnClick = AddTabItemClick
    end
    object RenameMenuItem: TMenuItem
      Caption = 'Изменить'
      OnClick = RenameMenuItemClick
    end
    object DelTabItem: TMenuItem
      Caption = 'Удалить'
      OnClick = DelTabItemClick
    end
  end
end
