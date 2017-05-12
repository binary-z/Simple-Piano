object Form1: TForm1
  Left = 198
  Top = 158
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  BorderStyle = bsDialog
  Caption = 'Piano'
  ClientHeight = 201
  ClientWidth = 313
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyUp = FormKeyUp
  OnPaint = FormPaint
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 37
    Height = 13
    Caption = #1054#1082#1090#1072#1074#1072
  end
  object Label2: TLabel
    Left = 80
    Top = 8
    Width = 55
    Height = 13
    Caption = #1043#1088#1086#1084#1082#1086#1089#1090#1100
  end
  object Label3: TLabel
    Left = 160
    Top = 8
    Width = 61
    Height = 13
    Caption = #1048#1085#1089#1090#1088#1091#1084#1077#1085#1090
  end
  object octava: TTrackBar
    Left = 8
    Top = 24
    Width = 65
    Height = 33
    Max = 5
    Position = 3
    TabOrder = 0
    OnChange = octavaChange
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 56
    Width = 297
    Height = 137
    Caption = ' '#1054#1082#1090#1072#1074#1072' 3 '
    TabOrder = 1
    object PaintBox1: TPaintBox
      Left = 8
      Top = 16
      Width = 281
      Height = 105
    end
  end
  object ComboBox1: TComboBox
    Left = 160
    Top = 24
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 2
    OnChange = ComboBox1Change
  end
  object volume: TTrackBar
    Left = 72
    Top = 24
    Width = 81
    Height = 33
    Max = 127
    Frequency = 10
    Position = 127
    TabOrder = 3
    TickMarks = tmBoth
    TickStyle = tsNone
    OnChange = volumeChange
  end
end
