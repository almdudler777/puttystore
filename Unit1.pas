unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls;

type
  TAboutform = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Memo1: TMemo;
    Memo2: TMemo;
    Label1: TLabel;
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Aboutform: TAboutform;

implementation

{$R *.dfm}

end.
