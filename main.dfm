object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'PuTTY Store'
  ClientHeight = 554
  ClientWidth = 792
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    792
    554)
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 535
    Width = 792
    Height = 19
    Panels = <
      item
        Width = 200
      end>
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 792
    Height = 536
    ActivePage = TabSheet1
    Anchors = [akLeft, akTop, akRight, akBottom]
    MultiLine = True
    TabOrder = 1
    TabPosition = tpBottom
    TabStop = False
    object TabSheet1: TTabSheet
      Caption = 'Backupsection'
      DesignSize = (
        784
        510)
      object Label1: TLabel
        Left = 8
        Top = 5
        Width = 150
        Height = 13
        Caption = 'Following Sessions were found:'
      end
      object puttyItems: TListView
        Left = 3
        Top = 24
        Width = 186
        Height = 421
        Anchors = [akLeft, akTop, akBottom]
        Checkboxes = True
        Columns = <>
        ReadOnly = True
        PopupMenu = ItemsPopup
        TabOrder = 0
        ViewStyle = vsList
        OnSelectItem = puttyItemsSelectItem
      end
      object Button1: TButton
        Left = 3
        Top = 451
        Width = 186
        Height = 25
        Align = alCustom
        Anchors = [akLeft, akBottom]
        Caption = '^ Backup selected ^'
        TabOrder = 1
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 3
        Top = 480
        Width = 186
        Height = 25
        Align = alCustom
        Anchors = [akLeft, akBottom]
        Caption = 'Export selected >'
        TabOrder = 2
        OnClick = Button2Click
      end
      object cbAutosort: TCheckBox
        Left = 195
        Top = 3
        Width = 97
        Height = 17
        Caption = 'Autosort'
        TabOrder = 3
        OnClick = cbAutosortClick
      end
      object SessionDetail: TListView
        Left = 195
        Top = 24
        Width = 586
        Height = 481
        Hint = 'Rightclick for Groupselection'
        Anchors = [akLeft, akTop, akRight, akBottom]
        Checkboxes = True
        Columns = <
          item
            Caption = 'Key'
            MaxWidth = 200
            MinWidth = 200
            Width = 200
          end
          item
            Caption = 'Value'
          end>
        ReadOnly = True
        ParentShowHint = False
        PopupMenu = SessionPopup
        ShowHint = True
        TabOrder = 4
        ViewStyle = vsReport
        OnResize = SessionDetailResize
      end
    end
  end
  object ItemsPopup: TPopupMenu
    Left = 40
    Top = 65528
    object InvertSelection1: TMenuItem
      Caption = 'Select all'
      OnClick = InvertSelection1Click
    end
    object Deselectall1: TMenuItem
      Caption = 'Deselect all'
      OnClick = Deselectall1Click
    end
    object InvertSelection2: TMenuItem
      Caption = 'Invert Selection'
      OnClick = InvertSelection2Click
    end
  end
  object SaveDialog1: TSaveDialog
    Filter = 'Registry Script|*.reg'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing, ofForceShowHidden]
    OptionsEx = [ofExNoPlacesBar]
    Left = 8
    Top = 65528
  end
  object SessionPopup: TPopupMenu
    Left = 104
    Top = 65528
    object est1: TMenuItem
      Caption = 'Connection Items'
      OnClick = est1Click
    end
    object ProxyItems1: TMenuItem
      Caption = 'Proxy Items'
      OnClick = ProxyItems1Click
    end
    object elnetItems1: TMenuItem
      Caption = 'Telnet Items'
      OnClick = elnetItems1Click
    end
    object RLoginItems1: TMenuItem
      Caption = 'RLogin Items'
      OnClick = RLoginItems1Click
    end
    object SSHItems1: TMenuItem
      Caption = 'SSH related Items'
      object SSH1: TMenuItem
        Caption = 'SSH'
        OnClick = SSH1Click
      end
      object Kex1: TMenuItem
        Caption = 'Kex'
        OnClick = Kex1Click
      end
      object Auth1: TMenuItem
        Caption = 'Auth'
        OnClick = Auth1Click
      end
      object erminal1: TMenuItem
        Caption = 'Terminal'
        OnClick = erminal1Click
      end
      object X111: TMenuItem
        Caption = 'X11'
        OnClick = X111Click
      end
      object unnels1: TMenuItem
        Caption = 'Tunnels'
        OnClick = unnels1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object AllItems2: TMenuItem
        Caption = 'All Items'
        OnClick = AllItems2Click
      end
    end
    object SerialItems1: TMenuItem
      Caption = 'Serial Items'
      OnClick = SerialItems1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object LogItems1: TMenuItem
      Caption = 'Log Items'
      OnClick = LogItems1Click
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object WindowAppearance1: TMenuItem
      Caption = 'Window && Appearance'
      OnClick = WindowAppearance1Click
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object AllItems1: TMenuItem
      Caption = 'All Items'
      OnClick = AllItems1Click
    end
  end
  object MainMenu1: TMainMenu
    Left = 72
    Top = 65528
    object Close1: TMenuItem
      Caption = 'File'
      object BackupPuTTYsessions1: TMenuItem
        Caption = 'Backup PuTTY sessions'
        OnClick = BackupPuTTYsessions1Click
      end
      object ImportXMLserverdata1: TMenuItem
        Caption = 'Import XML serverdata'
        OnClick = ImportXMLserverdata1Click
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object Close2: TMenuItem
        Caption = 'Close'
        OnClick = Close2Click
      end
    end
    object Help1: TMenuItem
      Caption = 'Help'
      object ViewQuickstart1: TMenuItem
        Caption = 'View Quickstart'
        OnClick = ViewQuickstart1Click
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object About1: TMenuItem
        Caption = 'About'
        OnClick = About1Click
      end
    end
  end
end
