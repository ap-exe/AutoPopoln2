object MainForm: TMainForm
  Left = 57
  Height = 429
  Top = 57
  Width = 566
  Caption = 'Редактирование bases.lst'
  ClientHeight = 409
  ClientWidth = 566
  Menu = MainMenu1
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  Position = poScreenCenter
  LCLVersion = '6.2'
  object PageControl1: TPageControl
    Left = 0
    Height = 409
    Top = 0
    Width = 566
    ActivePage = TabSheet1
    Align = alClient
    PopupMenu = TabsPopupMenu
    TabIndex = 0
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Базы'
      ClientHeight = 381
      ClientWidth = 558
      object BasesListEditor: TValueListEditor
        Left = 0
        Height = 381
        Top = 0
        Width = 558
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
          462
        )
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Ошибки'
      ClientHeight = 381
      ClientWidth = 558
      object ErrEdit: TRichMemo
        Left = 0
        Height = 381
        Top = 0
        Width = 558
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
      ClientHeight = 381
      ClientWidth = 558
      object KeyEdit: TRichMemo
        Left = 0
        Height = 381
        Top = 0
        Width = 558
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
    object AboutItem: TMenuItem
      Caption = 'О программе'
      OnClick = AboutItemClick
    end
  end
  object BasesPopupMenu: TPopupMenu
    Left = 176
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
  object TabsPopupMenu: TPopupMenu
    Left = 312
    Top = 296
    object DelTabItem: TMenuItem
      Caption = 'Удалить вкладку'
    end
    object AddTabItem: TMenuItem
      Caption = 'Добавить вкладку'
    end
  end
end
