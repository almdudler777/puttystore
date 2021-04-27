object Form3: TForm3
  Left = 0
  Top = 0
  AutoSize = True
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Quickstart - Guide'
  ClientHeight = 369
  ClientWidth = 417
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 417
    Height = 369
    ActivePage = TabSheet1
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Backup'
      object Label1: TLabel
        Left = 3
        Top = 3
        Width = 383
        Height = 13
        Caption = 
          'Note: PuTTYstore does everything in read-only mode! No data will' +
          '  be changed!'
      end
      object Memo1: TMemo
        Left = 3
        Top = 22
        Width = 403
        Height = 313
        Lines.Strings = (
          'You can backup your entire PuTTY data.'
          ''
          
            '1. In the left list, select the sessions which you want to back ' +
            'up'
          
            '2. Hit the '#39'Backup selected'#39' button, the first button under the ' +
            #39'backuplist'#39
          '3. Choose a filename and click save'
          ''
          
            'Note: Try to use rightclick to get a Popup with multiple functio' +
            'ns.'
          ''
          
            'PuTTYstore will now !read! the data from the registry and write ' +
            'it into a textfile.'
          
            'This file is stored with the filename you chose + the extension ' +
            #39'.reg'#39
          ''
          
            'To reimport the data - just doubleclick on the '#39'.reg'#39'-file and i' +
            't will be stored in '
          'your registry.'
          ''
          
            'Note: When you doubleclick the '#39'.reg'#39'-file the inbuilt windows r' +
            'egistry editor '
          'should write the data back to the registry.'
          'PuTTYstore does not offer any reimport tools!'
          ''
          
            'Attention: If you'#39're not able to doubleclick the file, or nothin' +
            'g happens, then '
          'pleas go to:'
          #39'Start->Run'#39' and enter '#39'regedit'#39'. '
          'That will, hopefully, open the Windows Registry Editor. '
          
            'There you'#39'll find an option for importing the PuTTYstore backup ' +
            'files.')
        ReadOnly = True
        TabOrder = 0
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Export'
      ImageIndex = 1
      object Label2: TLabel
        Left = 3
        Top = 3
        Width = 383
        Height = 13
        Caption = 
          'Note: PuTTYstore does everything in read-only mode! No data will' +
          '  be changed!'
      end
      object Memo2: TMemo
        Left = 3
        Top = 22
        Width = 403
        Height = 316
        Lines.Strings = (
          'You can export partial information about your PuTTY sessions.'
          ''
          
            'Click on the one of the PuTTY Sessions in the left list. (DO NOT' +
            ' CHECK IT!)'
          ''
          'Then you will see detailed information in the right list.'
          ''
          'You can then check all options you want to export.'
          ''
          'Note: I tried to group several items into logical groups.'
          'Use the rightlick menu to select or deselect groups of items.'
          ''
          'Use the second button to '#39'export'#39' the data.'
          ''
          'Choose a filename and hit '#39'Save'#39'. '
          'You will then get a '#39'.reg'#39' file which contains your data.'
          ''
          'See the Quickstart topic '#39'Backup'#39' on how to reimport the data.')
        ReadOnly = True
        TabOrder = 0
      end
    end
  end
end
