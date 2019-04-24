object Form1: TForm1
  Left = 289
  Top = 34
  Width = 819
  Height = 605
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 728
    Top = 0
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object WebBrowser1: TWebBrowser
    Left = 0
    Top = -8
    Width = 729
    Height = 569
    TabOrder = 1
    OnDocumentComplete = WebBrowser1DocumentComplete
    ControlData = {
      4C000000584B0000CF3A00000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126208000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
  object Button2: TButton
    Left = 728
    Top = 152
    Width = 75
    Height = 25
    Caption = 'Button2'
    TabOrder = 2
  end
end
