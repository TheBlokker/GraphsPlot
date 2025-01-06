object GraphsPlot: TGraphsPlot
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'GraphsPlot'
  ClientHeight = 555
  ClientWidth = 941
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu1
  OnCreate = FormCreate
  TextHeight = 15
  object Label1: TLabel
    Left = 200
    Top = 192
    Width = 44
    Height = 15
    Caption = 'Analyse:'
  end
  object Image1: TImage
    Left = 368
    Top = 24
    Width = 545
    Height = 481
  end
  object Labelyistgleich: TLabel
    Left = 24
    Top = 72
    Width = 14
    Height = 15
    Caption = 'y='
    Visible = False
  end
  object Labellenifktx: TLabel
    Left = 111
    Top = 72
    Width = 24
    Height = 15
    Caption = '* x +'
    Visible = False
  end
  object Labelquadratxhoch2: TLabel
    Left = 111
    Top = 71
    Width = 28
    Height = 15
    Caption = '* x'#178' +'
    Visible = False
  end
  object Labelquadratx: TLabel
    Left = 183
    Top = 71
    Width = 24
    Height = 15
    Caption = '* x +'
    Visible = False
  end
  object Labelsinfktsin: TLabel
    Left = 111
    Top = 71
    Width = 30
    Height = 15
    Caption = '* sin ('
    Visible = False
  end
  object Labelsinfktx: TLabel
    Left = 183
    Top = 71
    Width = 24
    Height = 15
    Caption = '* x +'
    Visible = False
  end
  object Labelsinfktplus: TLabel
    Left = 250
    Top = 71
    Width = 15
    Height = 15
    Caption = ') +'
    Visible = False
  end
  object Labelcosfktplus: TLabel
    Left = 250
    Top = 71
    Width = 15
    Height = 15
    Caption = ') +'
    Visible = False
  end
  object Labelcosfktcos: TLabel
    Left = 111
    Top = 71
    Width = 33
    Height = 15
    Caption = '* cos ('
    Visible = False
  end
  object Labelcosfktx: TLabel
    Left = 183
    Top = 71
    Width = 24
    Height = 15
    Caption = '* x +'
    Visible = False
  end
  object Labeltanfktplus: TLabel
    Left = 250
    Top = 71
    Width = 15
    Height = 15
    Caption = ') +'
    Visible = False
  end
  object Labeltanfkttan: TLabel
    Left = 111
    Top = 71
    Width = 32
    Height = 15
    Caption = '* tan ('
    Visible = False
  end
  object Labeltanfktx: TLabel
    Left = 183
    Top = 71
    Width = 24
    Height = 15
    Caption = '* x +'
    Visible = False
  end
  object Labelxistgleich: TLabel
    Left = 24
    Top = 72
    Width = 13
    Height = 15
    Caption = 'x='
    Visible = False
  end
  object Label2: TLabel
    Left = 40
    Top = 168
    Width = 5
    Height = 15
    Caption = 'x'
  end
  object Label3: TLabel
    Left = 127
    Top = 168
    Width = 6
    Height = 15
    Caption = 'y'
  end
  object MemoX: TMemo
    Left = 8
    Top = 192
    Width = 81
    Height = 313
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object MemoY: TMemo
    Left = 95
    Top = 192
    Width = 81
    Height = 313
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object Enter: TButton
    Left = 227
    Top = 18
    Width = 75
    Height = 25
    Caption = 'Enter'
    TabOrder = 2
    OnClick = EnterClick
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 536
    Width = 941
    Height = 19
    Panels = <>
  end
  object MemoAnalysis: TMemo
    Left = 182
    Top = 213
    Width = 180
    Height = 89
    Hint = 'Erst in Sp'#228'teren Version verf'#252'gbar.'
    Enabled = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
  end
  object ComboBox1: TComboBox
    Left = 24
    Top = 19
    Width = 168
    Height = 23
    Style = csDropDownList
    TabOrder = 5
    TextHint = 'Bitte etwas ausw'#228'hlen'
    OnChange = ComboBox1Change
    Items.Strings = (
      'Lineare Funktion'
      'Quadratische Funktion'
      'Sinusfunktion'
      'Kosinusfunktion'
      'Tangensfuntion'
      'Senkrechte Funktion')
  end
  object Editlenifktm: TEdit
    Left = 48
    Top = 69
    Width = 57
    Height = 23
    TabOrder = 6
    Text = '0'
    Visible = False
  end
  object Editlenifktn: TEdit
    Left = 145
    Top = 69
    Width = 32
    Height = 23
    TabOrder = 7
    Text = '0'
    Visible = False
  end
  object Editquadratfkta: TEdit
    Left = 48
    Top = 68
    Width = 57
    Height = 23
    TabOrder = 8
    Text = '0'
    Visible = False
  end
  object Editquadratfktb: TEdit
    Left = 145
    Top = 69
    Width = 32
    Height = 23
    TabOrder = 9
    Text = '0'
    Visible = False
  end
  object Editquadratfktc: TEdit
    Left = 213
    Top = 69
    Width = 31
    Height = 23
    TabOrder = 10
    Text = '0'
    Visible = False
  end
  object Editsinfkta: TEdit
    Left = 48
    Top = 68
    Width = 57
    Height = 23
    TabOrder = 11
    Text = '0'
    Visible = False
  end
  object Editsinfktb: TEdit
    Left = 145
    Top = 69
    Width = 32
    Height = 23
    TabOrder = 12
    Text = '0'
    Visible = False
  end
  object Editsinfktc: TEdit
    Left = 213
    Top = 69
    Width = 31
    Height = 23
    TabOrder = 13
    Text = '0'
    Visible = False
  end
  object Editsinfktd: TEdit
    Left = 271
    Top = 69
    Width = 31
    Height = 23
    TabOrder = 14
    Text = '0'
    Visible = False
  end
  object Editcosfkta: TEdit
    Left = 48
    Top = 68
    Width = 57
    Height = 23
    TabOrder = 15
    Text = '0'
    Visible = False
  end
  object Editcosfktb: TEdit
    Left = 145
    Top = 69
    Width = 32
    Height = 23
    TabOrder = 16
    Text = '0'
    Visible = False
  end
  object Editcosfktc: TEdit
    Left = 213
    Top = 69
    Width = 31
    Height = 23
    TabOrder = 17
    Text = '0'
    Visible = False
  end
  object Editcosfktd: TEdit
    Left = 271
    Top = 69
    Width = 31
    Height = 23
    TabOrder = 18
    Text = '0'
    Visible = False
  end
  object Edittanfkta: TEdit
    Left = 48
    Top = 68
    Width = 57
    Height = 23
    TabOrder = 19
    Text = '0'
    Visible = False
  end
  object Edittanfktb: TEdit
    Left = 145
    Top = 69
    Width = 32
    Height = 23
    TabOrder = 20
    Text = '0'
    Visible = False
  end
  object Edittanfktc: TEdit
    Left = 213
    Top = 69
    Width = 31
    Height = 23
    TabOrder = 21
    Text = '0'
    Visible = False
  end
  object Edittanfktd: TEdit
    Left = 271
    Top = 69
    Width = 31
    Height = 23
    TabOrder = 22
    Text = '0'
    Visible = False
  end
  object Editsenkrfktk: TEdit
    Left = 48
    Top = 68
    Width = 57
    Height = 23
    TabOrder = 23
    Text = '0'
    Visible = False
  end
  object MainMenu1: TMainMenu
    Top = 520
    object Datei1: TMenuItem
      Caption = 'Datei'
      object Funktionanalysieren1: TMenuItem
        Caption = 'Funktion analysieren'
        Enabled = False
        object Nullstellen1: TMenuItem
          Caption = 'Nullstellen'
          Enabled = False
        end
        object Minimum1: TMenuItem
          Caption = 'Minimum'
          Enabled = False
        end
        object Maximum1: TMenuItem
          Caption = 'Maximum'
          Enabled = False
        end
        object Schnittpunkte1: TMenuItem
          Caption = 'Schnittpunkte'
          Enabled = False
        end
        object Wendepunkte1: TMenuItem
          Caption = 'Wendepunkte'
          Enabled = False
        end
        object N2: TMenuItem
          Caption = '-'
          Enabled = False
        end
        object Limes1: TMenuItem
          Caption = 'Limes'
          Enabled = False
        end
        object Abbleitungen1: TMenuItem
          Caption = 'Abbleitungen'
          Enabled = False
        end
        object angenteFunktion1: TMenuItem
          Caption = 'Tangente Funktion'
          Enabled = False
        end
        object AbbleitunganeinemPunkt1: TMenuItem
          Caption = 'Abbleitung an einem Punkt'
          Enabled = False
        end
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Beenden1: TMenuItem
        Caption = 'Beenden'
        OnClick = Beenden1Click
      end
    end
    object Extras1: TMenuItem
      Caption = 'Extras'
      Enabled = False
    end
  end
end
