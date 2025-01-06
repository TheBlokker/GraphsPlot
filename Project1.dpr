program Project1;

uses
  Vcl.Forms,
  Main in 'Main.pas' {GraphsPlot};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TGraphsPlot, GraphsPlot);
  Application.Run;
end.
