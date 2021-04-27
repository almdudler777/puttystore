unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Registry, StdCtrls, ComCtrls, Menus, ExtCtrls;

const PUTTYPLACE : string = 'Software\SimonTatham\PuTTY\Sessions';


type TObjectString = class
  Text : string;
  constructor Create(Text:string);
  destructor destroy;
end;


type
  TForm2 = class(TForm)
    puttyItems: TListView;
    SessionDetail: TListView;
    Label1: TLabel;
    ItemsPopup: TPopupMenu;
    InvertSelection1: TMenuItem;
    Deselectall1: TMenuItem;
    InvertSelection2: TMenuItem;
    cbAutosort: TCheckBox;
    Button1: TButton;
    SaveDialog1: TSaveDialog;
    Button2: TButton;
    StatusBar1: TStatusBar;
    SessionPopup: TPopupMenu;
    est1: TMenuItem;
    N1: TMenuItem;
    ProxyItems1: TMenuItem;
    elnetItems1: TMenuItem;
    RLoginItems1: TMenuItem;
    SSHItems1: TMenuItem;
    Kex1: TMenuItem;
    Auth1: TMenuItem;
    erminal1: TMenuItem;
    X111: TMenuItem;
    unnels1: TMenuItem;
    SerialItems1: TMenuItem;
    AllItems1: TMenuItem;
    N2: TMenuItem;
    AllItems2: TMenuItem;
    SSH1: TMenuItem;
    N3: TMenuItem;
    LogItems1: TMenuItem;
    MainMenu1: TMainMenu;
    Close1: TMenuItem;
    Help1: TMenuItem;
    Close2: TMenuItem;
    ViewQuickstart1: TMenuItem;
    N4: TMenuItem;
    About1: TMenuItem;
    WindowAppearance1: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    ImportXMLserverdata1: TMenuItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    BackupPuTTYsessions1: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure InvertSelection2Click(Sender: TObject);
    procedure Deselectall1Click(Sender: TObject);
    procedure InvertSelection1Click(Sender: TObject);
    procedure puttyItemsSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure SessionDetailResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure est1Click(Sender: TObject);
    procedure ProxyItems1Click(Sender: TObject);
    procedure elnetItems1Click(Sender: TObject);
    procedure RLoginItems1Click(Sender: TObject);
    procedure Kex1Click(Sender: TObject);
    procedure erminal1Click(Sender: TObject);
    procedure unnels1Click(Sender: TObject);
    procedure X111Click(Sender: TObject);
    procedure Auth1Click(Sender: TObject);
    procedure SerialItems1Click(Sender: TObject);
    procedure AllItems2Click(Sender: TObject);
    procedure AllItems1Click(Sender: TObject);
    procedure SSH1Click(Sender: TObject);
    procedure LogItems1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Close2Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure cbAutosortClick(Sender: TObject);
    procedure ViewQuickstart1Click(Sender: TObject);
    procedure WindowAppearance1Click(Sender: TObject);
    procedure BackupPuTTYsessions1Click(Sender: TObject);
    procedure ImportXMLserverdata1Click(Sender: TObject);
  private
    { Private-Deklarationen }
    SETconnection : array[0..13] of string;
    SETProxy      : array[0..8] of string;
    SETTelnet     : array[0..2] of string;
    SETRLogin     : array[0..0] of string;
    SETSSH        : array[0..6] of string;
    SETKex        : array[0..2] of string;
    SETAuth       : array[0..5] of string;
    SETTerminal   : array[0..22] of string;
    SETLogging    : array[0..5] of string;
    SETSerial     : array [0..5] of string;
    SETTunnel     : array [0..2] of string;
    SETX11        : array [0..2] of string;
    SETWindow     : array [0..86] of string;
  public
    { Public-Deklarationen }
    procedure InvertSelection;
    procedure BackUpKey(Key:string;DataFile:TStringList);
    function  EscapeString(Text: string) : string;
    procedure WriteStatus(Text : string);
    procedure LoadGroups;
    procedure selectGroup(GrpArray:array of string; Sender: TObject);
    procedure DeselectGroup(GrpArray:array of string; Sender: TObject);
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

uses unit1,unit3;

constructor TObjectString.Create(Text: string);
begin
  self.Text := Text;
end;

destructor TObjectString.destroy;
begin
//
end;

procedure TForm2.WriteStatus(Text: string);
begin
  self.StatusBar1.Panels.Items[0].Text := Text;
end;

//##############################################################################
//## PUP Methods for ITEM Box
//## Methods: De-Select all, Invertselection
//##############################################################################
procedure TForm2.InvertSelection;
  var
    I     : integer;
begin
  if(PuttyItems.Items.Count > 0) then
    begin
      for I := 0 to PuttyItems.Items.Count - 1 do
        PuttyItems.Items.Item[I].Checked := not  PuttyItems.Items.Item[I].Checked;
    end;

   self.WriteStatus('Selection inverted!');
end;

procedure TForm2.InvertSelection1Click(Sender: TObject);
  var
    I     : integer;
begin
  if(PuttyItems.Items.Count > 0) then
    begin
      for I := 0 to PuttyItems.Items.Count - 1 do
        PuttyItems.Items.Item[I].Checked := true;
    end;

    self.WriteStatus('All Items selected!');
end;

procedure TForm2.InvertSelection2Click(Sender: TObject);
begin
  self.InvertSelection;
end;

procedure TForm2.Deselectall1Click(Sender: TObject);
  var
    I     : integer;
begin
  if(PuttyItems.Items.Count > 0) then
    begin
      for I := 0 to PuttyItems.Items.Count - 1 do
        PuttyItems.Items.Item[I].Checked := false;
    end;

    self.WriteStatus('All Items deselected!');
end;


//##############################################################################
//##############################################################################

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++ BACKUP FUNCTION
//+++
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

procedure TForm2.Button1Click(Sender: TObject);
var
  I : integer;
  DataFile : TStringList;
  selected : boolean;
begin
  selected := false;
    for I := 0 to puttyItems.Items.Count - 1 do
      begin
        if puttyItems.Items.Item[I].Checked then
          begin
            selected := true;
          end;
      end;
if selected then
begin
  if(SaveDialog1.Execute) AND (SaveDialog1.FileName <> '') then
  begin
    DataFile := TStringList.Create;

    //HEAD
    DataFile.Add('Windows Registry Editor Version 5.00');
    DataFile.Add('');

    for I := 0 to puttyItems.Items.Count - 1 do
      begin
        if puttyItems.Items.Item[I].Checked then
          begin
            BackUpKey(PUTTYPLACE + '\' + TObjectString(puttyItems.Items.Item[I].Data).Text,DataFile);
            puttyItems.Items.Item[I].Checked := false;
          end;
      end;

    DataFile.SaveToFile(SaveDialog1.FileName +'.reg');
    DataFile.Free;

    self.WriteStatus('Backupjob done!');
  end;
end
else
  self.StatusBar1.Panels.Items[0].Text := 'No Item selected!';
end;


procedure TForm2.Button2Click(Sender: TObject);
var
  DataFile : TStringList;
  i,z  : integer;
  selected : boolean;
  key : string;
begin
selected := false;
for I := 0 to SessionDetail.Items.Count - 1 do
  begin
    if SessionDetail.Items[I].Checked then
      selected := true;
  end;

  if selected then
  begin
    if(SaveDialog1.Execute) AND (SaveDialog1.FileName <> '') then
      begin
        with TRegistry.Create do
          begin
            try
              Rootkey:=HKEY_CURRENT_USER; //Hauptschlüssel
              key :=   PUTTYPLACE + '\' + TObjectString(puttyItems.Selected.Data).Text;
              if OpenKeyReadOnly(Key) then
                begin
                  DataFile := TStringList.Create;

                  //HEAD
                  DataFile.Add('Windows Registry Editor Version 5.00');
                  DataFile.Add('');
                  DataFile.Add('[HKEY_CURRENT_USER\'+ key + ']');

                  z := 0;
                  for I := 0 to SessionDetail.Items.Count - 1 do
                    begin
                      if SessionDetail.Items[I].Checked then
                        begin
                          if(getDataType(SessionDetail.Items[I].Caption) = rdString) then
                          DataFile.Add('"'+SessionDetail.Items[I].Caption+'"="'+EscapeString(ReadString(SessionDetail.Items[I].Caption))+'"');

                          if(getDataType(SessionDetail.Items[I].Caption) = rdInteger) then
                          DataFile.Add('"'+SessionDetail.Items[I].Caption+'"=dword:'+ StrLower(PAnsiChar(IntToHex(ReadInteger(SessionDetail.Items[I].Caption),8))));

                          inc(z);

                          SessionDetail.Items[I].Checked := false;
                        end;
                    end;

                  DataFile.SaveToFile(SaveDialog1.FileName +'.reg');
                  DataFile.Free;

                  self.WriteStatus('Export done! ' +IntToStr(z) +' Items exported!');
                end;
            finally
              Free;
            end;
          end;
      end;
  end;
end;

procedure TForm2.cbAutosortClick(Sender: TObject);
begin
  SessionDetail.AlphaSort;
end;

procedure TForm2.Close2Click(Sender: TObject);
begin
  self.Close;
end;

function TForm2.EscapeString(Text: string) : string;
  var
    return : string;
begin
  return := stringreplace(text,'\','\\',[rfReplaceAll]);
  result := return;
end;

procedure TForm2.BackUpKey(Key: string; DataFile: TStringList);
var
  I : integer;
  KeyList : TStringList;
begin
  with TRegistry.Create do
    begin
      try
          Rootkey:=HKEY_CURRENT_USER; //Hauptschlüssel
          if OpenKeyReadOnly(Key) then
            begin
              Keylist := TStringList.Create; //KeyListe initieren
              GetValueNames(KeyList);  //SESSIONS auslesen
              DataFile.Add('[HKEY_CURRENT_USER\'+Key+']');
              for I := 0 to KeyList.Count - 1 do
                begin
                  if(getDataType(KeyList[I]) = rdString) then
                    DataFile.Add('"'+KeyList[I]+'"="'+EscapeString(ReadString(KeyList[I]))+'"');

                  if(getDataType(KeyList[I]) = rdInteger) then
                    DataFile.Add('"'+KeyList[I]+'"=dword:'+ StrLower(PAnsiChar(IntToHex(ReadInteger(KeyList[I]),8))));
                end;
              KeyList.Free;    //LISTE FREIGEBEN

              //Leerzeile
              DataFile.Add('');
            end;
      finally
        Free;
      end;
    end;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


//******************************************************************************
//**** FORM FUNCTIONS
//****
//******************************************************************************
procedure TForm2.ImportXMLserverdata1Click(Sender: TObject);
begin
  self.PageControl1.Pages[1].Show;
end;

procedure TForm2.BackupPuTTYsessions1Click(Sender: TObject);
begin
  self.PageControl1.Pages[0].Show;
end;

procedure TForm2.puttyItemsSelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
  var
    KeyList   : TStringList;
    I,K         : integer;
    NewItem   : TListItem;
begin
//im session Detail alles deselecten
for I := 0 to SessionDetail.PopupMenu.Items.Count - 1 do
  begin
    if SessionDetail.PopupMenu.Items[I].Count <> 0 then
      begin
        for k := 0 to SessionDetail.PopupMenu.Items[I].Count - 1 do
          SessionDetail.PopupMenu.Items[I].Items[K].Checked := false;
      end;
      SessionDetail.PopupMenu.Items[I].Checked := false;
  end;

  if Selected then
    SessionDetail.Clear;
    begin
      with TRegistry.Create do
      begin
        try
          Rootkey:=HKEY_CURRENT_USER; //Hauptschlüssel
          if OpenKeyReadOnly(PUTTYPLACE+'\'+TObjectString(Item.Data).Text) then //Unterschlüssel öffnen
          begin
            Keylist := TStringList.Create; //KeyListe initieren
            GetValueNames(KeyList);  //SESSIONS auslesen
            for I := 0 to KeyList.Count - 1 do
              begin
                NewItem := SessionDetail.Items.Add;
                NewItem.Caption := StringReplace(KeyList[I],'%20',' ',[rfReplaceALL]);

                if(getDataType(KeyList[I]) = rdString) then
                  NewItem.SubItems.Add(ReadString(KeyList[I]));

                if(getDataType(KeyList[I]) = rdInteger) then
                  NewItem.SubItems.Add(IntToHex(ReadInteger(KeyList[I]),8) + ' ('+ FloatToStr(ReadInteger(KeyList[I])) +')');

              end;
            KeyList.Free;    //LISTE FREIGEBEN
          end;
        finally
          Free;
        end;
      end;
    end;

    if Form2.cbAutosort.Checked then
      SessionDetail.Alphasort;
end;

procedure TForm2.SessionDetailResize(Sender: TObject);
begin
  SessionDetail.Column[1].Width := SessionDetail.ClientWidth - SessionDetail.Column[0].Width;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  self.DoubleBuffered := true;
  self.LoadGroups;
end;

procedure TForm2.FormShow(Sender: TObject);
  var
    KeyList   : TStringList;
    I         : integer;
    Item      : TListItem;
begin
  //SITZUNGEN SUCHEN
  with TRegistry.Create do
  begin
    try
      Rootkey:=HKEY_CURRENT_USER; //Hauptschlüssel
      if OpenKeyReadOnly(PUTTYPLACE) then //Unterschlüssel öffnen
      begin
        if(hasSubKeys()) then //SIND Sessions vorhanden?
          begin
            Keylist := TStringList.Create; //KeyListe initieren
            getKeyNames(KeyList);  //SESSIONS auslesen
            for I := 0 to KeyList.Count - 1 do
              begin
                PuttyItems.AddItem(StringReplace(KeyList.Strings[I],'%20',' ',[rfReplaceALL]),TObjectString.Create(KeyList.Strings[I]));
              end;
            KeyList.Free;    //LISTE FREIGEBEN
          end
        else
          begin
            messageDlg('No Puttysessions found! PuTTYstore will shutdown now!',mtInformation,[mbOk],0);
            self.Close;
          end;
      end;
    finally
      Free;
    end;
  end;
end;

//******************************************************************************
//******************************************************************************


//------------------------------------------------------------------------------
//---- PU Session DETAIL
//----
//------------------------------------------------------------------------------

procedure TForm2.selectGroup(GrpArray:array of string; Sender: TObject);
var
  i : integer;
  number : integer;
begin
if SessionDetail.Items.Count > 0 then
begin
  for I := 0 to High(GrpArray) do
  begin
    if SessionDetail.FindCaption(0,GrpArray[I],true,false,false) <> nil then
      SessionDetail.Items[SessionDetail.FindCaption(0,GrpArray[I],true,false,false).Index].Checked := true;
  end;

  TMenuItem(Sender).Checked := true;
end;
end;

procedure TForm2.DeselectGroup(GrpArray:array of string; Sender: TObject);
var
  i : integer;
  number : integer;
begin
if SessionDetail.Items.Count > 0 then
begin
  for I := 0 to High(GrpArray) do
  begin
    if SessionDetail.FindCaption(0,GrpArray[I],true,false,false) <> nil then
      SessionDetail.Items[SessionDetail.FindCaption(0,GrpArray[I],true,false,false).Index].Checked := false;
  end;

  TMenuItem(Sender).Checked := false;
end;
end;


procedure TForm2.elnetItems1Click(Sender: TObject);
begin
  if TMenuItem(Sender).Checked then
    deselectGroup(SETTelnet,Sender)
  else selectGroup(SETTelnet,Sender);
end;

procedure TForm2.erminal1Click(Sender: TObject);
begin
  if TMenuItem(Sender).Checked then
    deselectGroup(SETTerminal,Sender)
  else selectGroup(SETTerminal,Sender);
end;

procedure TForm2.unnels1Click(Sender: TObject);
begin
  if TMenuItem(Sender).Checked then
    deselectGroup(SETTunnel,Sender)
  else selectGroup(SETTunnel,Sender);
end;

procedure TForm2.ViewQuickstart1Click(Sender: TObject);
begin
  Form3.ShowModal;
end;

procedure TForm2.RLoginItems1Click(Sender: TObject);
begin
  if TMenuItem(Sender).Checked then
    deselectGroup(SETRlogin,Sender)
  else selectGroup(SETRlogin,Sender);
end;


procedure TForm2.est1Click(Sender: TObject);
begin
  if TMenuItem(Sender).Checked then
    deselectGroup(SETconnection,Sender)
  else selectGroup(SETconnection,Sender);
end;

procedure TForm2.ProxyItems1Click(Sender: TObject);
begin
  if TMenuItem(Sender).Checked then
    deselectGroup(SETProxy,Sender)
  else selectGroup(SETProxy,Sender);
end;


procedure TForm2.Kex1Click(Sender: TObject);
begin
  if TMenuItem(Sender).Checked then
    deselectGroup(SETKex,Sender)
  else selectGroup(SETKex,Sender);
end;

procedure TForm2.X111Click(Sender: TObject);
begin
  if TMenuItem(Sender).Checked then
    deselectGroup(SETX11,Sender)
  else selectGroup(SETX11,Sender);
end;


procedure TForm2.About1Click(Sender: TObject);
begin
  AboutForm.ShowModal;
end;

procedure TForm2.AllItems1Click(Sender: TObject);
var i :integer;
begin
  if TMenuItem(Sender).Checked then
  begin
    for I := 0 to SessionDetail.Items.Count - 1 do
      begin
        SessionDetail.Items.Item[I].Checked := false;
        TMenuItem(Sender).Checked := false;
      end;

    for i := 0 to SessionDetail.PopupMenu.Items.Count - 1 do
      SessionDetail.PopupMenu.Items[I].Checked := false;
  end
  else
  begin
    for I := 0 to SessionDetail.Items.Count - 1 do
      begin
        SessionDetail.Items.Item[I].Checked := true;
        TMenuItem(Sender).Checked := true;
      end;

      for i := 0 to SessionDetail.PopupMenu.Items.Count - 1 do
        SessionDetail.PopupMenu.Items[I].Checked := true;
  end;
end;

procedure TForm2.AllItems2Click(Sender: TObject);
var i : integer;
begin
  if TMenuItem(Sender).Checked then
  begin
    deselectGroup(SETAuth,Sender);
    deselectGroup(SETX11,Sender);
    deselectGroup(SETKex,Sender) ;
    deselectGroup(SETTunnel,Sender);
    deselectGroup(SETTelnet,Sender) ;
    deselectGroup(SETTerminal,Sender);
    deselectGroup(SETSSH,Sender);

      for I := 0 to TMenuItem(FindComponent('SSHItems1')).Count - 1 do
        TMenuItem(FindComponent('SSHItems1')).Items[I].Checked := false;
  end
  else
    begin
      selectGroup(SETAuth,Sender);
      selectGroup(SETX11,Sender);
      selectGroup(SETKex,Sender);
      selectGroup(SETTunnel,Sender);
      selectGroup(SETTelnet,Sender);
      selectGroup(SETTerminal,Sender);
      selectGroup(SETSSH,Sender);

      for I := 0 to TMenuItem(FindComponent('SSHItems1')).Count - 1 do
        TMenuItem(FindComponent('SSHItems1')).Items[I].Checked := true;
    end;
end;

procedure TForm2.Auth1Click(Sender: TObject);
begin
  if TMenuItem(Sender).Checked then
    deselectGroup(SETAuth,Sender)
  else selectGroup(SETAuth,Sender);
end;


procedure TForm2.SerialItems1Click(Sender: TObject);
begin
  if TMenuItem(Sender).Checked then
    deselectGroup(SETSerial,Sender)
  else selectGroup(SETSerial,Sender);
end;

procedure TForm2.SSH1Click(Sender: TObject);
begin
  if TMenuItem(Sender).Checked then
    deselectGroup(SETSSH,Sender)
  else selectGroup(SETSSH,Sender);
end;

procedure TForm2.LogItems1Click(Sender: TObject);
begin
  if TMenuItem(Sender).Checked then
    deselectGroup(SETLogging,Sender)
  else selectGroup(SETLogging,Sender);
end;

procedure TForm2.WindowAppearance1Click(Sender: TObject);
begin
  if TMenuItem(Sender).Checked then
    deselectGroup(SETWindow,Sender)
  else selectGroup(SETWindow,Sender);
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------





//#ö#ö#ö#ö#ö#ö##ö#ö#ö#ö#ö#ö##ö#ö#ö#ö#ö#ö#ö#ö#ö#ö#ö#ö#ö#ö#öö#ö#ö#ö#ö#ö#ö#ö#ö#ö#ö#
//#ö#ö     ARRAYS FOR GROUPS
//#ö#ö
//#ö#ö#ö#ö#ö#ö#ö#ö#ö#ö#ö#ö#ö#ö#ö#ö#ö#ö#ö#ö#ö#ö#ö#ö#ö#ö#ö#ö#ö#ö#öö#ö#ö#ö#ö#ö#ö#ö#

procedure TForm2.LoadGroups;
begin
    SETconnection[0] := 'HostName';
    SETconnection[1] := 'PortNumber';
    SETconnection[2] := 'Protocol';
    SETconnection[3] := 'CloseOnExit';
    SETconnection[4] := 'UserName';
    SETconnection[5] := 'TerminalModes';
    SETconnection[6] := 'TerminalSpeed';
    SETconnection[7] := 'TerminalType';
    SETconnection[8] := 'Environment';
    SETconnection[9] := 'AddressFamily';
    SETconnection[10] := 'TCPNoDelay';
    SETconnection[11] := 'TCPKeepalives';
    SETconnection[12] := 'PingInterval';
    SETconnection[13] := 'PingIntervalSecs';

    SETProxy[0]      := 'ProxyExcludeList';
    SETProxy[1]      := 'ProxyHost';
    SETProxy[2]      := 'ProxyDNS';
    SETProxy[3]      := 'ProxyLocalhost';
    SETProxy[4]      := 'ProxyMethod';
    SETProxy[5]      := 'ProxyPassword';
    SETProxy[6]      := 'ProxyPort';
    SETProxy[7]      := 'ProxyTelnetCommand';
    SETProxy[8]      := 'ProxyUsername';

    SETTelnet[0]      := 'PassiveTelnet';
    SETTelnet[1]      := 'TelnetRet';
    SETTelnet[2]      := 'TelnetKey';

    SETRLogin[0]      := 'LocalUserName';

    SETSSH[0]      := 'RemoteCommand';
    SETSSH[1]      := 'SshNoShell';
    SETSSH[2]      := 'SshNoAuth';
    SETSSH[3]      := 'SshProt';
    SETSSH[4]      := 'Cipher';
    SETSSH[5]      := 'Compression';
    SETSSH[6]      := 'SSH2DES';

    SETKex[0]      := 'KEX';
    SETKex[1]      := 'RekeyBytes';
    SETKex[2]      := 'RekeyTime';

    SETAuth[0]     := 'AgentFwd';
    SETAuth[1]     := 'ChangeUsername';
    SETAuth[2]     := 'TryAgent';
    SETAuth[3]     := 'AuthTIS';
    SETAuth[4]     := 'AuthKI';
    SETAuth[5]     := 'PublicKeyFile';

    SETTerminal[0] := 'TerminalModes';
    SETTerminal[1] := 'NoPTY';
    SETTerminal[2] := 'TerminalModes';
    SETTerminal[3] := 'TerminalSpeed';
    SETTerminal[4] := 'TermHeight';
    SETTerminal[5] := 'TermWidth';
    SETTerminal[6] := 'TerminalType';
    SETTerminal[7] := 'AnswerBack';
    SETTerminal[8] := 'DECOriginMode';
    SETTerminal[9] := 'BlinkText';
    SETTerminal[10] := 'LocalEcho';
    SETTerminal[11] := 'LocalEdit';
    SETTerminal[12] := 'Printer';
    SETTerminal[13] := 'BackspaceIsDelete';
    SETTerminal[14] := 'BellWaveFile';
    SETTerminal[15] := 'BellOverload';
    SETTerminal[16] := 'BellOverloadN';
    SETTerminal[17] := 'BellOverloadS';
    SETTerminal[18] := 'BellOverloadT';
    SETTerminal[19] := 'Beep';
    SETTerminal[20] := 'BeepInd';
    SETTerminal[21] := 'LFImpliesCR';
    SETTerminal[22] := 'LinuxFunctionKeys';

    SETX11[0]     := 'X11AuthType';
    SETX11[1]     := 'X11Display';
    SETX11[2]     := 'X11Forward';

    SETTunnel[0]  := 'LocalPortAcceptAll';
    SETTunnel[1]  := 'RemotePortAcceptAll';
    SETTunnel[2]  := 'PortForwardings';

    SETSerial[0]  := 'SerialDataBits';
    SETSerial[1]  := 'SerialFlowControl';
    SETSerial[2]  := 'SerialLine';
    SETSerial[3]  := 'SerialParity';
    SETSerial[4]  := 'SerialSpeed';
    SETSerial[5]  := 'SerialStopHalfbits';

    SETLogging[0]  := 'LogType';
    SETLogging[1]  := 'LogFileName';
    SETLogging[2]  := 'LogFlush';
    SETLogging[3]  := 'LogFileClash';
    SETLogging[4]  := 'SSHLogOmitData';
    SETLogging[5]  := 'SSHLogOmitPasswords';

    SETWindow[0]   := 'Termheight';
    SETWindow[1]   := 'Termwidth';
    SETWindow[2]   := 'ScrollbackLines';
    SETWindow[3]   := 'ScrollBar';
    SETWindow[4]   := 'ScrollBarFullScreen';
    SETWindow[5]   := 'ScrollOnKey';
    SETWindow[6]   := 'ScrollbarOnLeft';
    SETWindow[7]   := 'ScrollOnDisp';
    SETWindow[8]   := 'LockSize';
    SETWindow[9]   := 'CurType';
    SETWindow[10]   := 'BlinkCur';
    SETWindow[11]   := 'Font';
    SETWindow[12]   := 'FontQuality';
    SETWindow[13]   := 'FontCharset';
    SETWindow[14]   := 'FontHeight';
    SETWindow[15]   := 'FontIsBold';
    SETWindow[16]   := 'FontVTMode';
    SETWindow[17]   := 'HideMousePtr';
    SETWindow[18]   := 'SunkenEdge';
    SETWindow[19]   := 'WinTitle';
    SETWindow[20]   := 'WarnOnClose';
    SETWindow[21]   := 'FullScreenOnAltEnter';
    SETWindow[22]   := 'AltF4';
    SETWindow[23]   := 'AltOnly';
    SETWindow[24]   := 'AltSpace';
    SETWindow[25]   := 'AlwaysOnTop';
    SETWindow[26]   := 'WideBoldFont';
    SETWindow[27]   := 'WideBoldFontCharSet';
    SETWindow[28]   := 'WideBoldFontHeight';
    SETWindow[29]   := 'WideBoldFontIsBold';
    SETWindow[30]   := 'WideFont';
    SETWindow[31]   := 'CapsLockCyr';
    SETWindow[32]   := 'CJKAmbigWide';
    SETWindow[33]   := 'UTF8Override';
    SETWindow[34]   := 'MouseOverride';
    SETWindow[35]   := 'PasteRTF';
    SETWindow[36]   := 'NoRemoteWinTitle';
    SETWindow[37]   := 'NoRemoteResize';
    SETWindow[38]   := 'NoRemoteCharset';
    SETWindow[39]   := 'ANSIColour';
    SETWindow[40]   := 'Xterm256Colour';
    SETWindow[41]   := 'BoldAsColour';
    SETWindow[42]   := 'UseSystemColours';
    SETWindow[43]   := 'TryPalette';
    SETWindow[44]   := 'Colour0';
    SETWindow[45]   := 'Colour1';
    SETWindow[46]   := 'Colour2';
    SETWindow[47]   := 'Colour3';
    SETWindow[48]   := 'Colour4';
    SETWindow[49]   := 'Colour5';
    SETWindow[50]   := 'Colour6';
    SETWindow[51]   := 'Colour7';
    SETWindow[52]   := 'Colour8';
    SETWindow[53]   := 'Colour9';
    SETWindow[54]   := 'Colour10';
    SETWindow[55]   := 'Colour11';
    SETWindow[56]   := 'Colour12';
    SETWindow[57]   := 'Colour13';
    SETWindow[58]   := 'Colour14';
    SETWindow[59]   := 'Colour15';
    SETWindow[60]   := 'Colour16';
    SETWindow[61]   := 'Colour17';
    SETWindow[62]   := 'Colour18';
    SETWindow[63]   := 'Colour19';
    SETWindow[64]   := 'Colour20';
    SETWindow[65]   := 'Colour21';
    SETWindow[66]   := 'RectSelect';
    SETWindow[67]   := 'WideFontCharSet';
    SETWindow[68]   := 'WideFontHeight';
    SETWindow[69]   := 'WideFontIsBold';
    SETWindow[70]   := 'WindowBorder';
    SETWindow[71]   := 'WinNameAlways';
    SETWindow[72]   := 'BoldFontCharSet';
    SETWindow[73]   := 'BoldFontHeight';
    SETWindow[74]   := 'BoldFontIsBold';
    SETWindow[75]   := 'BoldFont';
    SETWindow[76]   := 'MouseIsXterm';
    SETWindow[77]   := 'LineCodePage';
    SETWindow[78]   := 'Wordness0';
    SETWindow[79]   := 'Wordness32';
    SETWindow[80]   := 'Wordness64';
    SETWindow[81]   := 'Wordness96';
    SETWindow[82]   := 'Wordness128';
    SETWindow[83]   := 'Wordness160';
    SETWindow[84]   := 'Wordness192';
    SETWindow[85]   := 'Wordness224';
    SETWindow[86]   := 'EraseToScrollback';
end;

end.
