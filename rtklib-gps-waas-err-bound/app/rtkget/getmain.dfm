object MainForm: TMainForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'RTKGET'
  ClientHeight = 319
  ClientWidth = 444
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 444
    Height = 225
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object Label6: TLabel
      Left = 12
      Top = 264
      Width = 71
      Height = 13
      Caption = 'Local Directory'
    end
    object LabelSta: TLabel
      Left = 320
      Top = 6
      Width = 56
      Height = 13
      Caption = 'Stations (0)'
    end
    object Label8: TLabel
      Left = 127
      Top = 6
      Width = 85
      Height = 13
      Caption = 'Time Span (GPST)'
    end
    object BtnKeyword: TSpeedButton
      Left = 228
      Top = 180
      Width = 15
      Height = 19
      Caption = '?'
      Flat = True
      OnClick = BtnKeywordClick
    end
    object Panel1: TPanel
      Left = 123
      Top = 24
      Width = 194
      Height = 77
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 2
      object Label1: TLabel
        Left = 8
        Top = 8
        Width = 24
        Height = 13
        Caption = 'Start'
      end
      object Label3: TLabel
        Left = 8
        Top = 31
        Width = 18
        Height = 13
        Caption = 'End'
      end
      object BtnTime1: TSpeedButton
        Left = 176
        Top = 5
        Width = 15
        Height = 21
        Caption = '?'
        Flat = True
        OnClick = BtnTime1Click
      end
      object BtnTime2: TSpeedButton
        Left = 176
        Top = 28
        Width = 15
        Height = 21
        Caption = '?'
        Flat = True
        OnClick = BtnTime2Click
      end
      object Label7: TLabel
        Left = 8
        Top = 54
        Width = 20
        Height = 13
        Caption = 'Intv'
      end
      object Label2: TLabel
        Left = 100
        Top = 54
        Width = 17
        Height = 13
        Caption = 'No.'
      end
      object TimeY1: TEdit
        Left = 38
        Top = 5
        Width = 65
        Height = 21
        TabOrder = 0
        Text = '2000/01/01'
      end
      object TimeY2: TEdit
        Left = 38
        Top = 28
        Width = 65
        Height = 21
        TabOrder = 4
        Text = '2000/01/01'
      end
      object TimeH2: TEdit
        Left = 123
        Top = 28
        Width = 37
        Height = 21
        TabOrder = 6
        Text = '00:00'
      end
      object TimeH1: TEdit
        Left = 123
        Top = 5
        Width = 37
        Height = 21
        TabOrder = 2
        Text = '00:00'
      end
      object TimeY1UD: TUpDown
        Left = 103
        Top = 4
        Width = 17
        Height = 23
        TabOrder = 1
        OnChangingEx = TimeY1UDChangingEx
      end
      object TimeY2UD: TUpDown
        Left = 103
        Top = 27
        Width = 17
        Height = 23
        TabOrder = 5
        OnChangingEx = TimeY2UDChangingEx
      end
      object TimeH2UD: TUpDown
        Left = 160
        Top = 27
        Width = 17
        Height = 23
        TabOrder = 7
        OnChangingEx = TimeH2UDChangingEx
      end
      object TimeH1UD: TUpDown
        Left = 160
        Top = 4
        Width = 17
        Height = 23
        TabOrder = 3
        OnChangingEx = TimeH1UDChangingEx
      end
      object TimeInt: TComboBox
        Left = 37
        Top = 51
        Width = 50
        Height = 21
        TabOrder = 8
        Text = '24H'
        Items.Strings = (
          '15min'
          '30min'
          '1H'
          '3H'
          '6H'
          '12H'
          '24H'
          '7day')
      end
      object Number: TEdit
        Left = 123
        Top = 51
        Width = 52
        Height = 21
        TabOrder = 9
        Text = '0'
      end
    end
    object BtnDir: TButton
      Left = 424
      Top = 201
      Width = 17
      Height = 21
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
      OnClick = BtnDirClick
    end
    object DataList: TListBox
      Left = 1
      Top = 24
      Width = 120
      Height = 198
      ItemHeight = 13
      MultiSelect = True
      TabOrder = 1
      OnClick = DataListClick
    end
    object DataType: TComboBox
      Left = 1
      Top = 2
      Width = 60
      Height = 21
      AutoComplete = False
      Style = csDropDownList
      DropDownCount = 32
      TabOrder = 0
      OnChange = DataTypeChange
    end
    object BtnStas: TButton
      Left = 419
      Top = 2
      Width = 21
      Height = 21
      Hint = 'Load Station List'
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 10
      OnClick = BtnStasClick
    end
    object LocalDir: TCheckBox
      Left = 128
      Top = 181
      Width = 90
      Height = 17
      Caption = ' Local Directory'
      TabOrder = 6
      OnClick = LocalDirClick
    end
    object StaList: TListBox
      Left = 318
      Top = 24
      Width = 122
      Height = 174
      Hint = 'Station List'
      ItemHeight = 13
      MultiSelect = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 11
      OnClick = StaListClick
    end
    object Panel4: TPanel
      Left = 122
      Top = 102
      Width = 194
      Height = 43
      BevelOuter = bvNone
      TabOrder = 3
      object Label4: TLabel
        Left = 8
        Top = 2
        Width = 46
        Height = 13
        Caption = 'FTP Login'
      end
      object FtpLogin: TEdit
        Left = 1
        Top = 17
        Width = 86
        Height = 21
        TabOrder = 0
        Text = 'anonymous'
      end
      object FtpPasswd: TEdit
        Left = 88
        Top = 17
        Width = 106
        Height = 21
        PasswordChar = '*'
        TabOrder = 1
        Text = 'user@'
      end
      object HidePasswd: TCheckBox
        Left = 88
        Top = 0
        Width = 97
        Height = 17
        Caption = 'Password'
        TabOrder = 2
        OnClick = HidePasswdClick
      end
    end
    object UnZip: TCheckBox
      Left = 128
      Top = 162
      Width = 146
      Height = 17
      Caption = ' Unzip/Uncompact Files'
      TabOrder = 5
    end
    object SkipExist: TCheckBox
      Left = 128
      Top = 143
      Width = 112
      Height = 17
      Caption = ' Skip Existing Files'
      TabOrder = 4
    end
    object SubType: TComboBox
      Left = 62
      Top = 2
      Width = 59
      Height = 21
      AutoComplete = False
      Style = csDropDownList
      DropDownCount = 32
      Sorted = True
      TabOrder = 12
      OnChange = DataTypeChange
    end
    object BtnAll: TButton
      Left = 399
      Top = 2
      Width = 21
      Height = 21
      Hint = 'Select/Clear All'
      Caption = 'A'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 9
      OnClick = BtnAllClick
    end
    object Dir: TComboBox
      Left = 122
      Top = 201
      Width = 302
      Height = 21
      DropDownCount = 20
      TabOrder = 7
      OnChange = DirChange
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 295
    Width = 444
    Height = 24
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object BtnOpts: TButton
      Left = 145
      Top = 0
      Width = 73
      Height = 23
      Caption = '&Options...'
      TabOrder = 2
      OnClick = BtnOptsClick
    end
    object BtnLog: TButton
      Left = 73
      Top = 0
      Width = 71
      Height = 23
      Caption = '&Log...'
      TabOrder = 1
      OnClick = BtnLogClick
    end
    object BtnDownload: TButton
      Left = 294
      Top = 0
      Width = 74
      Height = 23
      Caption = '&Download'
      TabOrder = 4
      OnClick = BtnDownloadClick
    end
    object BtnExit: TButton
      Left = 369
      Top = 0
      Width = 74
      Height = 23
      Caption = '&Exit'
      TabOrder = 5
      OnClick = BtnExitClick
    end
    object BtnFile: TButton
      Left = 1
      Top = 0
      Width = 71
      Height = 23
      Caption = '&Files...'
      TabOrder = 0
      OnClick = BtnFileClick
    end
    object BtnTest: TButton
      Left = 219
      Top = 0
      Width = 74
      Height = 23
      Caption = '&Test...'
      TabOrder = 3
      OnClick = BtnTestClick
    end
  end
  object Msg1: TPanel
    Left = 0
    Top = 223
    Width = 444
    Height = 24
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    DoubleBuffered = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentDoubleBuffered = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    object MsgLabel1: TLabel
      Left = 2
      Top = 2
      Width = 440
      Height = 20
      Align = alClient
      Alignment = taCenter
      Layout = tlCenter
      ExplicitWidth = 3
      ExplicitHeight = 13
    end
  end
  object Msg3: TPanel
    Left = 0
    Top = 271
    Width = 444
    Height = 24
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    DoubleBuffered = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentDoubleBuffered = False
    ParentFont = False
    TabOrder = 3
    object MsgLabel3: TLabel
      Left = 2
      Top = 2
      Width = 440
      Height = 20
      Align = alClient
      Alignment = taCenter
      Layout = tlCenter
      ExplicitWidth = 3
      ExplicitHeight = 13
    end
    object BtnTray: TSpeedButton
      Left = 422
      Top = 2
      Width = 18
      Height = 19
      Flat = True
      Glyph.Data = {
        3E020000424D3E0200000000000036000000280000000D0000000D0000000100
        1800000000000802000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF787878FFFFFF787878FFFFFF787878FF
        FFFF000000000000000000FFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF000000FFFFFF000000FFFFFFFFFFFF00FFFFFFFFFFFF
        787878FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000FFFFFFFFFF
        FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF787878FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF787878FFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
        787878FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF787878FFFFFFFFFF
        FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF787878FFFFFF787878FFFFFF787878FF
        FFFF787878FFFFFF787878FFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF00}
      OnClick = BtnTrayClick
    end
    object BtnHelp: TSpeedButton
      Left = 3
      Top = 2
      Width = 14
      Height = 19
      Caption = '?'
      Flat = True
      OnClick = BtnHelpClick
    end
  end
  object Msg2: TPanel
    Left = 0
    Top = 247
    Width = 444
    Height = 24
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    DoubleBuffered = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentDoubleBuffered = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    object Image1: TImage
      Left = 425
      Top = 6
      Width = 12
      Height = 12
      Picture.Data = {
        07544269746D6170DE000000424DDE0000000000000076000000280000000D00
        00000D0000000100040000000000680000000000000000000000100000000000
        0000000000000000800000800000008080008000000080008000808000008080
        8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
        FF00FFFFFFFFFFFFF000FFFFFFFFFFFFF000FF0F70000FFFF000FF000FFFF0FF
        F000FF0007FFFF7FF000FF00FFFFFFFFF000FF0FFFFFFF0FF000FFFFFFFFF00F
        F000FF7FFFF7000FF000FFF0FFFF000FF000FFFF00007F0FF000FFFFFFFFFFFF
        F000FFFFFFFFFFFFF000}
      Transparent = True
      Visible = False
    end
    object Image2: TImage
      Left = 425
      Top = 6
      Width = 12
      Height = 12
      Picture.Data = {
        07544269746D6170DE000000424DDE0000000000000076000000280000000D00
        00000D0000000100040000000000680000000000000000000000100000000000
        0000000000000000800000800000008080008000000080008000808000008080
        8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
        FF00FFFFFFFFFFFFF000FFFFFFFFFFFFF000FFFF00000FFFF000F7F0FFFFF8FF
        F000F00078FFFF8FF000F0007FFFFF0FF000F707FFFFF707F000FF0FFFFF7000
        F000FF8FFFF87000F000FFF8FFFFF0F7F000FFFF00000FFFF000FFFFFFFFFFFF
        F000FFFFFFFFFFFFF000}
      Transparent = True
      Visible = False
    end
    object Image3: TImage
      Left = 425
      Top = 6
      Width = 12
      Height = 12
      Picture.Data = {
        07544269746D6170DE000000424DDE0000000000000076000000280000000D00
        00000D0000000100040000000000680000000000000000000000100000000000
        0000000000000000800000800000008080008000000080008000808000008080
        8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
        FF00FFFFFFFFFFFFF000FFFFFFFFFFFFF000FFFF00078FFFF000FFF0FFFFF0FF
        F000FF0FFFFFF00FF0007F0F7FFFF007F000F0008FFF7000F000F700FFFF8F0F
        7000FF00FFFFFF0FF000FFF0FFFFF0FFF000FFFF87000FFFF000FFFFFFFFFFFF
        F000FFFFFFFFFFFFF000}
      Transparent = True
      Visible = False
    end
    object Image4: TImage
      Left = 425
      Top = 6
      Width = 12
      Height = 12
      Picture.Data = {
        07544269746D6170DE000000424DDE0000000000000076000000280000000D00
        00000D0000000100040000000000680000000000000000000000100000000000
        0000000000000000800000800000008080008000000080008000808000008080
        8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
        FF00FFFFFFFFFFFFF000FFFFFFFFFFFFF000FFFF00F70FFFF000FFF0FFFF007F
        F000FF0FFFFFF007F000FF0FFFFF8000F000F80F7FFF7F08F000F0008FFFFF0F
        F000F700FFFFFF0FF000FF700FFFF0FFF000FFFF07F00FFFF000FFFFFFFFFFFF
        F000FFFFFFFFFFFFF000}
      Transparent = True
      Visible = False
    end
    object Image5: TImage
      Left = 425
      Top = 6
      Width = 12
      Height = 12
      Picture.Data = {
        07544269746D6170DE000000424DDE0000000000000076000000280000000D00
        00000D0000000100040000000000680000000000000000000000100000000000
        0000000000000000800000800000008080008000000080008000808000008080
        8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
        FF00FFFFFFFFFFFFF000FFFFFFFFFFFFF000FFFF7F00000FF000FFF0FFF000FF
        F000FF0FFFFF007FF000FF0FFFFF7F0FF000FF0FFFFFFF0FF000FF0F7FFFFF0F
        F000FF700FFFFF0FF000FFF000FFF0FFF000FF00000F7FFFF000FFFFFFFFFFFF
        F000FFFFFFFFFFFFF000}
      Transparent = True
      Visible = False
    end
    object Image6: TImage
      Left = 425
      Top = 6
      Width = 12
      Height = 12
      Picture.Data = {
        07544269746D6170DE000000424DDE0000000000000076000000280000000D00
        00000D0000000100040000000000680000000000000000000000100000000000
        0000000000000000800000800000008080008000000080008000808000008080
        8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
        FF00FFFFFFFFFFFFF000FFFFFF7007FFF000FFFF80000FFFF000FFF8FF7000FF
        F000FF0FFFF77F0FF000FF0FFFFF8F0FF000FF0FFFFFFF0FF000FF0F8FFFFF0F
        F000FF0F77FFFF0FF000FFF0007FF8FFF000FFFF00008FFFF000FFF7007FFFFF
        F000FFFFFFFFFFFFF000}
      Transparent = True
      Visible = False
    end
    object Image7: TImage
      Left = 425
      Top = 6
      Width = 12
      Height = 12
      Picture.Data = {
        07544269746D6170DE000000424DDE0000000000000076000000280000000D00
        00000D0000000100040000000000680000000000000000000000100000000000
        0000000000000000800000800000008080008000000080008000808000008080
        8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
        FF00FFFFFFF7FFFFF000FFFFF70FFFFFF000FFFF00000FFFF000FFF0000FF0FF
        F000FF8FFF78FF0FF000FF7FFFFFFF0FF000FF0FFFFFFF0FF000FF0FFFFFFF7F
        F000FF0FF78FFF8FF000FFF0FF0000FFF000FFFF00000FFFF000FFFFFF07FFFF
        F000FFFFF7FFFFFFF000}
      Transparent = True
      Visible = False
    end
    object Image8: TImage
      Left = 425
      Top = 6
      Width = 12
      Height = 12
      Picture.Data = {
        07544269746D6170DE000000424DDE0000000000000076000000280000000D00
        00000D0000000100040000000000680000000000000000000000100000000000
        0000000000000000800000800000008080008000000080008000808000008080
        8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
        FF00FFFFFFFFFFFFF000FFFF708FFFFFF000FFF700000FFFF000FFF000FFF0FF
        F000FF00F87FFF0FF000FF7FFFFFFF0FF000FFFFFFFFFFFFF000FF0FFFFFFF7F
        F000FF0FFF78F00FF000FFF0FFF000FFF000FFFF000007FFF000FFFFFF807FFF
        F000FFFFFFFFFFFFF000}
      Transparent = True
      Visible = False
    end
    object MsgLabel2: TLabel
      Left = 2
      Top = 2
      Width = 440
      Height = 20
      Align = alClient
      Alignment = taCenter
      Layout = tlCenter
      ExplicitWidth = 3
      ExplicitHeight = 13
    end
  end
  object OpenDialog: TOpenDialog
    Filter = 'Text File (*.txt)|*.txt|All Files (*.*)|*.*'
    Title = 'Satation List File'
    Left = 25
    Top = 41
  end
  object SaveDialog: TSaveDialog
    Left = 66
    Top = 41
  end
  object Timer: TTimer
    Enabled = False
    Interval = 150
    OnTimer = TimerTimer
    Left = 24
    Top = 88
  end
  object TrayIcon: TTrayIcon
    Hint = 'RTKGET'
    Icon.Data = {
      0000010001002020000001001800A80C00001600000028000000200000004000
      00000100180000000000800C000000000000000000000000000000000000CC48
      3FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC
      483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
      CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC48
      3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDEDED00000000000000
      00007F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F000000000000000000
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC483FCC48
      3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000007F7F7FFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F
      000000363636FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC483FCC48
      3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000007F7F7FFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFF7F7F7F515151FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC483FCC48
      3FFFFFFFFFFFFFFFFFFFFFFFFF0000007F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF7F7F7F3D3D3DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC483FCC48
      3FFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC483FCC48
      3FFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFF3C3C3CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC483FCC48
      3FFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFF7F7F7F3832327F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFF3E3E3EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC483FCC48
      3FFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFF7F7F7F3E303000F2FF3330307F7F7FFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFF3E3E3EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC483FCC48
      3FFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF7F7F7F3D2F2F00F2FF00F2FF00F2FF3029297F7F7FF8F8F8FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFF3E3E3EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC483FCC48
      3FFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFE8E8E80000000000007F
      7F7F3B2D2D00F2FF00F2FF00F2FF00F2FF00F2FF312A2A7F7F7F000000000000
      FFFFFFFFFFFFFFFFFF3E3E3EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC483FCC48
      3FFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF000000000000FFFFFF7F7F7F3D
      2E2E00F2FF00F2FF00F2FF00F2FF00F2FF00F2FF00F2FF3532327F7F7FFFFFFF
      000000373737FFFFFF484848FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC483FCC48
      3FFFFFFFFFFFFFFFFFFFFFFFFF0000003838387F7F7FFFFFFF7F7F7F3F393900
      F2FF00F2FF00F2FF00F2FF00F2FF00F2FF00F2FF00F2FF00F2FF383F3F7F7F7F
      FFFFFF7F7F7F000000414141FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC483FCC48
      3FFFFFFFFFFFFFFFFFFFFFFFFF0000007F7F7FFFFFFFFFFFFF27252500000000
      000000000000F2FF00F2FF00F2FF00F2FF00F2FF0000000000000000001E1C1C
      FFFFFFFFFFFF7F7F7F3B3B3BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC483FCC48
      3FFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFF8F7F7FF
      FFFF00000000F2FF00F2FF00F2FF00F2FF00F2FF3B2B2BFFFFFFF7F5F5F8F8F8
      EBEBEBFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC483FCC48
      3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFE9E9E9FFFFFFFFFFFFFF
      FFFF00000000F2FF00F2FF00F2FF00F2FF00F2FF3B2E2EFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF383838F6F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC483FCC48
      3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFFFFFFFFFFFF
      FFFF00000000F2FF00F2FF00F2FF00F2FF00F2FF3E3131FFFFFFFFFFFFFFFFFF
      363636000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC483FCC48
      3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F000000000000FF
      FFFF00000000F2FF00F2FF00F2FF00F2FF00F2FF453838FFFFFF000000000000
      7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC483FCC48
      3FFFFFFFFFFFFFFFFFFFC1C1C164696B8C9497ABB0B3CACED0ECEFF0FFFFFF7F
      7F7F00000000F2FF00F2FF00F2FF00F2FF00F2FF382E2E7F7F7FFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC483FCC48
      3FFFFFFFFFFFFFFFFFFF9EA4A65626176B240D5D2C19502F2444322D282728FF
      FFFF000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC483FCC48
      3FFFFFFFFFFFFFFFFFFF7D848A76380A92390090390091380098360048372BE9
      EBEDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9D9D9D
      ADB3B5CDD1D3EBEEEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC483FCC48
      3FFFFFFFFFFFFFFFFFFF5E656E8F4F029C55009B55009B5500A45600353637FF
      FFFFB4B7B9363D44562C1C5F2E18542F202F3339A5A8AAFFFFFFFFFFFF333739
      5E25134E2D2542322F3434373F494E727272FFFFFFFFFFFFFFFFFFCC483FCC48
      3FFFFFFFFFFFFFFFFFFF3A4251B47100AD6F00AC6F00AD6F00B47200454D5BCD
      CFD239322D943B00943D00933E00943D00953C003D342FA8ABAEFFFFFF3B3634
      9430008E32008F31009230007E2E00656D72FFFFFFFFFFFFFFFFFFCC483FCC48
      3FFFFFFFFFFFFFFFFFFF343437CD8E00C08700C08700C28900B27F036F75843D
      424AA55C00A05C009E5D009E5D009E5D009F5C00A75B00393D43E9ECF04E3E2C
      9D50009650009650009A500078470E878D93FFFFFFFFFFFFFFFFFFCC483FCC48
      3FFFFFFFFFFFFFE7E8ED52492EDFA500D29D00D29D00D7A000B28B13383F526F
      5B31BC7C00B37800B37800B37800B37800B37800BB7B007B5C2069707D6D5329
      AE6B00A86900A86900AD6B00725018A6ABB1FFFFFFFFFFFFFFFFFFCC483FCC48
      3FFFFFFFFFFFFFC9CBD36D5D25EEB600E2AF00E2AF00EBB400A38520373E5599
      771DD09600C99200C99200C99200C99200C99200CF9500A37D173A42578B6B21
      C28500BC8200BC8200C48600675222C7CAD0FFFFFFFFFFFFFFFFFFCC483FCC48
      3FFFFFFFFFFFFFA6A9B592781AFAC200F0BC00F0BC00FBC3008D782864697D88
      7026E7AF00DBA700DBA700DBA700DBA700DBA700E6AE0090782741485FAB8314
      D39B00CE9800CE9800DA9F00574B2BE2E4E9FFFFFFFFFFFFFFFFFFCC483FCC48
      3FFFFFFFFFFFFF888C9BC09B0CFFD400FFCC00FFCA00FFD2006A5C2ADEE0E930
      3547FAC100EEB900EBB700EBB700EBB700EDB800FFC6003E3F43696F83CC9E03
      E2AD00DFAB00DFAB00EFB6003C3A34FFFFFFFFFFFFFFFFFFFFFFFFCC483FCC48
      3FFFFFFFFFFFFF5F60654E4729756424947C1CB59411E9BA0048432EFFFFFFA6
      A8AE49432EFFCF00FFCC00FEC800FFCB00FFD200544C2DA6A9B1464D65F7BE00
      EDB900EDB900EDB900FEC40033394EFFFFFFFFFFFFFFFFFFFFFFFFCC483FCC48
      3FFFFFFFFFFFFFFFFFFFEBECF0CACCD5A7AAB7868A9A666A7E45464AFFFFFFFF
      FFFF9C9EA62C2D338B751FBE9B0F9C81172C2F3B92949CFFFFFF383737FFD700
      FDC700FAC500FAC500E9B80051576CFFFFFFFFFFFFFFFFFFFFFFFFCC483FCC48
      3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFA7AAB5767A8AA2A5B1FDFEFFFFFFFFECECEE363226A58814
      BD990EDDB105FFCE00DEB20173788AFFFFFFFFFFFFFFFFFFFFFFFFCC483FCC48
      3FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC
      483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
      CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000}
    OnDblClick = TrayIconDblClick
    Left = 67
    Top = 89
  end
end
