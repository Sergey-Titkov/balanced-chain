object fmMain: TfmMain
  Left = 201
  Top = 133
  Caption = 'fmMain'
  ClientHeight = 587
  ClientWidth = 1046
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lb4: TLabel
    Left = 588
    Top = 432
    Width = 14
    Height = 13
    Caption = 'lb4'
  end
  object lb5: TLabel
    Left = 588
    Top = 462
    Width = 14
    Height = 13
    Caption = 'lb5'
  end
  object Label1: TLabel
    Left = 11
    Top = 432
    Width = 70
    Height = 22
    Caption = #1041#1072#1083#1072#1085#1089':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Consolas'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbBalans: TLabel
    Left = 87
    Top = 432
    Width = 10
    Height = 22
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Consolas'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lstOne: TListBox
    Left = 6
    Top = 88
    Width = 121
    Height = 305
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ItemHeight = 23
    ParentFont = False
    TabOrder = 0
  end
  object lstTwo: TListBox
    Left = 133
    Top = 88
    Width = 121
    Height = 305
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ItemHeight = 23
    ParentFont = False
    TabOrder = 1
  end
  object lstThree: TListBox
    Left = 260
    Top = 88
    Width = 121
    Height = 305
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
    Left = 11
    Top = 52
    Width = 47
    Height = 22
    MaxValue = 255
    MinValue = 0
    TabOrder = 3
    Value = 0
  end
  object btnProceedTurn: TButton
    Left = 64
    Top = 50
    Width = 217
    Height = 25
    Caption = #1057#1076#1077#1083#1072#1090#1100' '#1093#1086#1076
    TabOrder = 4
    OnClick = btnProceedTurnClick
  end
  object lstFour: TListBox
    Left = 387
    Top = 88
    Width = 121
    Height = 305
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ItemHeight = 23
    ParentFont = False
    TabOrder = 5
  end
  object lstFive: TListBox
    Left = 514
    Top = 88
    Width = 121
    Height = 305
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ItemHeight = 23
    ParentFont = False
    TabOrder = 6
  end
  object btn2: TButton
    Left = 6
    Top = 4
    Width = 75
    Height = 25
    Caption = #1053#1072#1095#1072#1090#1100' '#1080#1075#1088#1091
    TabOrder = 7
  end
  object tmTimer: TTimer
    Enabled = False
    OnTimer = tmTimerTimer
    Left = 296
    Top = 48
  end
end
