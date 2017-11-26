object fmMain: TfmMain
  Left = 201
  Top = 133
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1057#1073#1072#1083#1072#1085#1089#1080#1088#1086#1074#1072#1085#1085#1072#1103' '#1087#1088#1086#1080#1079#1074#1086#1076#1089#1090#1074#1077#1085#1085#1072#1103' '#1094#1077#1087#1086#1095#1082#1072'.'
  ClientHeight = 475
  ClientWidth = 655
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
    Enabled = False
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
  object btnStartGame: TButton
    Left = 6
    Top = 4
    Width = 75
    Height = 25
    Caption = #1053#1072#1095#1072#1090#1100' '#1080#1075#1088#1091
    TabOrder = 7
    OnClick = btnStartGameClick
  end
  object tmTimer: TTimer
    Enabled = False
    OnTimer = tmTimerTimer
    Left = 296
    Top = 48
  end
end
