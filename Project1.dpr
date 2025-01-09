program Project1;

uses
  Vcl.Forms,
  Main in 'Main.pas' {GraphsPlot},
  ABOUT in 'ABOUT.pas' {AboutBox};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TGraphsPlot, GraphsPlot);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.Run;
end.
