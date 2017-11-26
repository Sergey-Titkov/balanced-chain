object Form1: TForm1
  Left = 201
  Top = 133
  Width = 870
  Height = 500
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lb1: TLabel
    Left = 236
    Top = 66
    Width = 14
    Height = 13
    Caption = 'lb1'
  end
  object lb2: TLabel
    Left = 366
    Top = 68
    Width = 14
    Height = 13
    Caption = 'lb2'
  end
  object lb3: TLabel
    Left = 648
    Top = 84
    Width = 14
    Height = 13
    Caption = 'lb3'
  end
  object lb4: TLabel
    Left = 652
    Top = 112
    Width = 14
    Height = 13
    Caption = 'lb4'
  end
  object lst1: TListBox
    Left = 236
    Top = 82
    Width = 121
    Height = 289
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ItemHeight = 23
    ParentFont = False
    TabOrder = 0
  end
  object lst2: TListBox
    Left = 364
    Top = 82
    Width = 121
    Height = 289
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ItemHeight = 23
    ParentFont = False
    TabOrder = 1
  end
  object lst3: TListBox
    Left = 490
    Top = 82
    Width = 121
    Height = 291
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ItemHeight = 23
    ParentFont = False
    TabOrder = 2
  end
  object se1: TSpinEdit
    Left = 26
    Top = 100
    Width = 47
    Height = 22
    MaxValue = 255
    MinValue = 0
    TabOrder = 3
    Value = 0
  end
  object btn1: TButton
    Left = 124
    Top = 106
    Width = 75
    Height = 25
    Caption = 'btn1'
    TabOrder = 4
    OnClick = btn1Click
  end
end
