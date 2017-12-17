object fmMain: TfmMain
  Left = 201
  Top = 133
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1057#1073#1072#1083#1072#1085#1089#1080#1088#1086#1074#1072#1085#1085#1072#1103' '#1087#1088#1086#1080#1079#1074#1086#1076#1089#1090#1074#1077#1085#1085#1072#1103' '#1094#1077#1087#1086#1095#1082#1072'.'
  ClientHeight = 383
  ClientWidth = 269
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
    Left = 9
    Top = 354
    Width = 77
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
    Left = 85
    Top = 354
    Width = 11
    Height = 22
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Consolas'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lb4: TLabel
    Left = 10
    Top = 86
    Width = 143
    Height = 13
    Caption = #1044#1086#1089#1090#1091#1087#1085#1086' '#1077#1076#1080#1085#1080#1094' '#1084#1086#1076#1085#1086#1089#1090#1080':'
  end
  object lbFreePower: TLabel
    Left = 158
    Top = 86
    Width = 6
    Height = 13
    Caption = '0'
  end
  object se1: TSpinEdit
    Left = 11
    Top = 52
    Width = 47
    Height = 22
    MaxValue = 255
    MinValue = 0
    TabOrder = 0
    Value = 0
  end
  object btnProceedTurn: TButton
    Left = 64
    Top = 50
    Width = 199
    Height = 25
    Caption = #1057#1076#1077#1083#1072#1090#1100' '#1093#1086#1076
    Enabled = False
    TabOrder = 1
    OnClick = btnProceedTurnClick
  end
  object btnStartGame: TButton
    Left = 6
    Top = 4
    Width = 75
    Height = 25
    Caption = #1053#1072#1095#1072#1090#1100' '#1080#1075#1088#1091
    TabOrder = 2
    OnClick = btnStartGameClick
  end
  object gb1: TGroupBox
    Left = 8
    Top = 108
    Width = 253
    Height = 43
    Caption = #1056#1072#1073#1086#1095#1080#1081' '#1094#1077#1085#1090#1088' 1'
    TabOrder = 3
    object lb1: TLabel
      Left = 6
      Top = 16
      Width = 89
      Height = 13
      Caption = #1044#1083#1080#1085#1085#1072' '#1086#1095#1077#1088#1077#1076#1080': '
    end
    object lbQueryLengthCenterOne: TLabel
      Left = 97
      Top = 16
      Width = 6
      Height = 13
      Caption = '0'
    end
    object lb3: TLabel
      Left = 138
      Top = 16
      Width = 56
      Height = 13
      Caption = #1052#1086#1097#1085#1086#1089#1090#1100':'
    end
    object sePowerOfCenetrOne: TSpinEdit
      Left = 199
      Top = 11
      Width = 47
      Height = 22
      MaxValue = 255
      MinValue = 0
      TabOrder = 0
      Value = 6
      OnKeyPress = sePowerOfCenetrOneKeyPress
    end
  end
  object gb2: TGroupBox
    Left = 8
    Top = 158
    Width = 253
    Height = 43
    Caption = #1056#1072#1073#1086#1095#1080#1081' '#1094#1077#1085#1090#1088' 2'
    TabOrder = 4
    object lb6: TLabel
      Left = 6
      Top = 16
      Width = 89
      Height = 13
      Caption = #1044#1083#1080#1085#1085#1072' '#1086#1095#1077#1088#1077#1076#1080': '
    end
    object lbQueryLengthCenterTwo: TLabel
      Left = 97
      Top = 16
      Width = 6
      Height = 13
      Caption = '0'
    end
    object lb8: TLabel
      Left = 138
      Top = 16
      Width = 56
      Height = 13
      Caption = #1052#1086#1097#1085#1086#1089#1090#1100':'
    end
    object sePowerOfCenetrTwo: TSpinEdit
      Left = 199
      Top = 11
      Width = 47
      Height = 22
      MaxValue = 255
      MinValue = 0
      TabOrder = 0
      Value = 6
    end
  end
  object gb3: TGroupBox
    Left = 8
    Top = 206
    Width = 253
    Height = 43
    Caption = #1056#1072#1073#1086#1095#1080#1081' '#1094#1077#1085#1090#1088' 3'
    TabOrder = 5
    object lb9: TLabel
      Left = 6
      Top = 16
      Width = 89
      Height = 13
      Caption = #1044#1083#1080#1085#1085#1072' '#1086#1095#1077#1088#1077#1076#1080': '
    end
    object lbQueryLengthCenterThree: TLabel
      Left = 97
      Top = 16
      Width = 6
      Height = 13
      Caption = '0'
    end
    object lb11: TLabel
      Left = 138
      Top = 16
      Width = 56
      Height = 13
      Caption = #1052#1086#1097#1085#1086#1089#1090#1100':'
    end
    object sePowerOfCenetrThree: TSpinEdit
      Left = 199
      Top = 11
      Width = 47
      Height = 22
      MaxValue = 255
      MinValue = 0
      TabOrder = 0
      Value = 6
    end
  end
  object gb4: TGroupBox
    Left = 8
    Top = 256
    Width = 253
    Height = 43
    Caption = #1056#1072#1073#1086#1095#1080#1081' '#1094#1077#1085#1090#1088' 4'
    TabOrder = 6
    object lb12: TLabel
      Left = 6
      Top = 16
      Width = 89
      Height = 13
      Caption = #1044#1083#1080#1085#1085#1072' '#1086#1095#1077#1088#1077#1076#1080': '
    end
    object lbQueryLengthCenterFour: TLabel
      Left = 97
      Top = 16
      Width = 6
      Height = 13
      Caption = '0'
    end
    object lb14: TLabel
      Left = 138
      Top = 16
      Width = 56
      Height = 13
      Caption = #1052#1086#1097#1085#1086#1089#1090#1100':'
    end
    object sePowerOfCenetrFour: TSpinEdit
      Left = 199
      Top = 11
      Width = 47
      Height = 22
      MaxValue = 255
      MinValue = 0
      TabOrder = 0
      Value = 6
    end
  end
  object gb5: TGroupBox
    Left = 8
    Top = 306
    Width = 253
    Height = 43
    Caption = #1056#1072#1073#1086#1095#1080#1081' '#1094#1077#1085#1090#1088' 5'
    TabOrder = 7
    object lb15: TLabel
      Left = 6
      Top = 16
      Width = 89
      Height = 13
      Caption = #1044#1083#1080#1085#1085#1072' '#1086#1095#1077#1088#1077#1076#1080': '
    end
    object lbQueryLengthCenterFive: TLabel
      Left = 97
      Top = 16
      Width = 6
      Height = 13
      Caption = '0'
    end
    object lb17: TLabel
      Left = 138
      Top = 16
      Width = 56
      Height = 13
      Caption = #1052#1086#1097#1085#1086#1089#1090#1100':'
    end
    object sePowerOfCenetrFive: TSpinEdit
      Left = 199
      Top = 11
      Width = 47
      Height = 22
      MaxValue = 255
      MinValue = 0
      TabOrder = 0
      Value = 6
    end
  end
  object tmTimer: TTimer
    Enabled = False
    OnTimer = tmTimerTimer
    Left = 124
    Top = 8
  end
end
