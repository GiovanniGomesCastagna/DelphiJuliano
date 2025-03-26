program projectDoTesteBrabo;

uses
  Vcl.Forms,
  uTesteBrabo in 'uTesteBrabo.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
