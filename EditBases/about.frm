object AboutForm: TAboutForm
  Left = 270
  Height = 485
  Top = 185
  Width = 669
  HorzScrollBar.Page = 525
  HorzScrollBar.Range = 525
  VertScrollBar.Page = 295
  VertScrollBar.Range = 295
  AutoSize = True
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'О программе'
  ClientHeight = 485
  ClientWidth = 669
  Constraints.MinHeight = 485
  Constraints.MinWidth = 669
  DesignTimePPI = 120
  OnClick = FormClick
  OnCreate = FormCreate
  Position = poMainFormCenter
  LCLVersion = '6.3'
  object Image1: TImage
    Left = 12
    Height = 80
    Top = 20
    Width = 80
    BorderSpacing.Left = 25
    BorderSpacing.Top = 25
    OnClick = FormClick
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
    Left = 112
    Height = 20
    Top = 20
    Width = 44
    Caption = 'Label1'
    ParentColor = False
    OnClick = FormClick
  end
  object Memo1: TMemo
    AnchorSideLeft.Control = Owner
    AnchorSideTop.Control = Image1
    AnchorSideTop.Side = asrBottom
    AnchorSideRight.Control = Owner
    AnchorSideRight.Side = asrBottom
    AnchorSideBottom.Control = Owner
    AnchorSideBottom.Side = asrBottom
    Left = 6
    Height = 373
    Top = 106
    Width = 657
    Anchors = [akTop, akLeft, akRight, akBottom]
    BorderSpacing.Left = 6
    BorderSpacing.Top = 6
    BorderSpacing.Right = 6
    BorderSpacing.Bottom = 6
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
