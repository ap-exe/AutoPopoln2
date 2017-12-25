object AboutForm: TAboutForm
  Left = 316
  Height = 388
  Top = 184
  Width = 600
  HorzScrollBar.Page = 525
  HorzScrollBar.Range = 525
  VertScrollBar.Page = 295
  VertScrollBar.Range = 295
  AutoSize = True
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'О программе'
  ClientHeight = 388
  ClientWidth = 600
  Constraints.MinHeight = 388
  Constraints.MinWidth = 535
  OnClick = FormClick
  OnCreate = FormCreate
  Position = poMainFormCenter
  LCLVersion = '6.2'
  object Image1: TImage
    Left = 10
    Height = 64
    Top = 16
    Width = 64
    BorderSpacing.Left = 20
    BorderSpacing.Top = 20
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
    Left = 90
    Height = 15
    Top = 22
    Width = 34
    Caption = 'Label1'
    ParentColor = False
    OnClick = FormClick
  end
  object Label2: TLabel
    Left = 20
    Height = 272
    Top = 96
    Width = 560
    Align = alBottom
    Anchors = [akTop, akLeft, akRight, akBottom]
    AutoSize = False
    BorderSpacing.Left = 20
    BorderSpacing.Right = 20
    BorderSpacing.Bottom = 20
    Caption = 'Программа распростроняется под лицензией GNU General Public License version 3'#13#10'Это проект с открытыми исходными кодами, они доступны на GitHub (https://github.com/ap-exe/AutoPopoln2).'#13#10'Абсолютна бесплатна для коммерческого использования.'#13#10'Программа написана на FreePascal(https://www.freepascal.org/) с использованием CodeTyphon(http://www.pilotlogic.com/).'#13#10#13#10'Лицензионное соглашение.'#13#10#13#10'ПРОГРАММА РАСПРОСТРАНЯЕТСЯ ПО ПРИНЦИПУ "КАК ЕСТЬ". ПРИ ЭТОМ НЕ ПРЕДУСМАТРИВАЕТСЯ НИКАКИХ ГАРАНТИЙ, ЯВНЫХ ИЛИ ПОДРАЗУМЕВАЕМЫХ. ВЫ ИСПОЛЬЗУЕТЕ ЕЕ НА СВОЙ СОБСТВЕННЫЙ РИСК. АВТОР НЕ НЕСЕТ ОТВЕТСТВЕННОСТИ ЗА ПОТЕРИ ДАННЫХ, ПОВРЕЖДЕНИЯ, ПОТЕРИ ПРИБЫЛИ ИЛИ ЛЮБЫЕ ДРУГИЕ ВИДЫ ПОТЕРЬ, СВЯЗАННЫЕ С ИСПОЛЬЗОВАНИЕМ (ПРАВИЛЬНЫМ ИЛИ НЕПРАВИЛЬНЫМ) ЭТОЙ ПРОГРАММЫ.'#13#10#13#10'Если вы не согласны с условиями данной лицензии, то должны удалить программу со своих устройств хранения информации и отказаться от дальнейшего использования этого программного продукта.'
    ParentColor = False
    WordWrap = True
    OnClick = FormClick
  end
end
