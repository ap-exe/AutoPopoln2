object MainForm: TMainForm
  Left = 273
  Height = 415
  Top = 184
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
  object PageControl1: TPageControl
    Left = 0
    Height = 395
    Top = 0
    Width = 521
    ActivePage = BasesTab
    Align = alClient
    PopupMenu = TabsPopupMenu
    TabIndex = 0
    TabOrder = 0
    OnMouseMove = PageControl1MouseMove
    object BasesTab: TTabSheet
      Caption = 'Базы'
      ClientHeight = 367
      ClientWidth = 513
      OnExit = BasesTabExit
      object BasesListEditor: TValueListEditor
        Left = 0
        Height = 367
        Top = 0
        Width = 513
        Align = alClient
        BorderStyle = bsNone
        DefaultColWidth = 96
        FixedCols = 0
        PopupMenu = BasesPopupMenu
        RowCount = 2
        TabOrder = 0
        TitleStyle = tsNative
        DoubleBuffered = True
        KeyOptions = [keyEdit, keyAdd]
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goEditing, goThumbTracking, goFixedRowNumbering, goRowHighlight]
        TitleCaptions.Strings = (
          'База'
          'Полное название'
        )
        OnStringsChange = BasesListEditorStringsChange
        ColWidths = (
          96
          417
        )
      end
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
      object SaveLST1: TMenuItem
        Caption = 'Сохранить LST'
        ShortCut = 16467
        OnClick = SaveLST1Click
      end
      object MenuItem6: TMenuItem
        Caption = '-'
      end
      object LoadBasesTXT: TMenuItem
        Caption = 'Загрузить названия баз'
        ShortCut = 24655
        OnClick = LoadBasesTXTClick
      end
      object SaveBasesTXT: TMenuItem
        Caption = 'Сохранить названия баз'
        ShortCut = 24659
        OnClick = SaveBasesTXTClick
      end
      object MenuItem12: TMenuItem
        Caption = '-'
      end
      object ExitItem: TMenuItem
        Caption = 'Выход'
        ShortCut = 32883
        OnClick = ExitItemClick
      end
    end
    object EditMenuItem: TMenuItem
      Caption = 'Правка'
      object AddItemBases: TMenuItem
        Caption = 'Добавить описание базы'
        ShortCut = 45
        OnClick = AddItemBasesClick
      end
      object DelItemBases: TMenuItem
        Caption = 'Удалить описание базы'
        ShortCut = 16430
        OnClick = DelItemBasesClick
      end
      object MenuItem1: TMenuItem
        Caption = '-'
      end
      object AddTabItemMain: TMenuItem
        Caption = 'Добавить вкладку'
        ShortCut = 16429
        OnClick = AddTabItemMainClick
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
