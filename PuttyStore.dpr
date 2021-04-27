program PuttyStore;

uses
  Forms,
  main in 'main.pas' {Form2},
  Unit1 in 'Unit1.pas' {Aboutform},
  Unit3 in 'Unit3.pas' {Form3};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'PuTTY Store - Daniel Sahlmann';
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TAboutform, Aboutform);
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
