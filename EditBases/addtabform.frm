object AddTabForm1: TAddTabForm1
  Left = 316
  Height = 162
  Top = 184
  Width = 474
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Добавление вкладки'
  ClientHeight = 162
  ClientWidth = 474
  Position = poMainFormCenter
  LCLVersion = '6.2'
  object NameTabEdit: TLabeledEdit
    Left = 8
    Height = 23
    Top = 24
    Width = 456
    EditLabel.AnchorSideLeft.Control = NameTabEdit
    EditLabel.AnchorSideRight.Control = NameTabEdit
    EditLabel.AnchorSideRight.Side = asrBottom
    EditLabel.AnchorSideBottom.Control = NameTabEdit
    EditLabel.Left = 8
    EditLabel.Height = 15
    EditLabel.Top = 6
    EditLabel.Width = 456
    EditLabel.Caption = 'Название вкладки'
    EditLabel.ParentColor = False
    TabOrder = 0
  end
  object FileTabEdit: TLabeledEdit
    Left = 8
    Height = 23
    Top = 80
    Width = 433
    EditLabel.AnchorSideLeft.Control = FileTabEdit
    EditLabel.AnchorSideRight.Control = FileTabEdit
    EditLabel.AnchorSideRight.Side = asrBottom
    EditLabel.AnchorSideBottom.Control = FileTabEdit
    EditLabel.Left = 8
    EditLabel.Height = 15
    EditLabel.Top = 62
    EditLabel.Width = 433
    EditLabel.Caption = 'RTF файл'
    EditLabel.ParentColor = False
    TabOrder = 1
  end
  object OpenFileButton: TSpeedButton
    Left = 440
    Height = 23
    Top = 80
    Width = 24
    Caption = '...'
    OnClick = OpenFileButtonClick
  end
  object OKButton: TButton
    Left = 389
    Height = 25
    Top = 125
    Width = 75
    Caption = 'ОК'
    ModalResult = 1
    OnClick = OKButtonClick
    TabOrder = 2
  end
  object CancelButton: TButton
    Left = 288
    Height = 25
    Top = 125
    Width = 75
    Cancel = True
    Caption = 'Отмена'
    ModalResult = 2
    OnClick = CancelButtonClick
    TabOrder = 3
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '.rtf'
    Filter = 'RTF|*.rtf'
    Left = 54
    Top = 110
  end
end
