program Project1;

uses
  Vcl.Forms,
  Direct2DShape.View.Main in 'Direct2DShape.View.Main.pas' {frmSample};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmSample, frmSample);
  Application.Run;
end.
