// ======================================================================
//
//          GGGGGGGGGGGGG                                                      hhhhhhh             PPPPPPPPPPPPPPPPP   lllllll                           tttt
//       GGG::::::::::::G                                                      h:::::h             P::::::::::::::::P  l:::::l                        ttt:::t
//     GG:::::::::::::::G                                                      h:::::h             P::::::PPPPPP:::::P l:::::l                        t:::::t
//    G:::::GGGGGGGG::::G                                                      h:::::h             PP:::::P     P:::::Pl:::::l                        t:::::t
//   G:::::G       GGGGGGrrrrr   rrrrrrrrr   aaaaaaaaaaaaa  ppppp   ppppppppp   h::::h hhhhh         P::::P     P:::::P l::::l    ooooooooooo   ttttttt:::::ttttttt
//  G:::::G              r::::rrr:::::::::r  a::::::::::::a p::::ppp:::::::::p  h::::hh:::::hhh      P::::P     P:::::P l::::l  oo:::::::::::oo t:::::::::::::::::t
//  G:::::G              r:::::::::::::::::r aaaaaaaaa:::::ap:::::::::::::::::p h::::::::::::::hh    P::::PPPPPP:::::P  l::::l o:::::::::::::::ot:::::::::::::::::t
//  G:::::G    GGGGGGGGGGrr::::::rrrrr::::::r         a::::app::::::ppppp::::::ph:::::::hhh::::::h   P:::::::::::::PP   l::::l o:::::ooooo:::::otttttt:::::::tttttt
//  G:::::G    G::::::::G r:::::r     r:::::r  aaaaaaa:::::a p:::::p     p:::::ph::::::h   h::::::h  P::::PPPPPPPPP     l::::l o::::o     o::::o      t:::::t
//  G:::::G    GGGGG::::G r:::::r     rrrrrrraa::::::::::::a p:::::p     p:::::ph:::::h     h:::::h  P::::P             l::::l o::::o     o::::o      t:::::t
//  G:::::G        G::::G r:::::r           a::::aaaa::::::a p:::::p     p:::::ph:::::h     h:::::h  P::::P             l::::l o::::o     o::::o      t:::::t
//   G:::::G       G::::G r:::::r          a::::a    a:::::a p:::::p    p::::::ph:::::h     h:::::h  P::::P             l::::l o::::o     o::::o      t:::::t    tttttt
//    G:::::GGGGGGGG::::G r:::::r          a::::a    a:::::a p:::::ppppp:::::::ph:::::h     h:::::hPP::::::PP          l::::::lo:::::ooooo:::::o      t::::::tttt:::::t
//     GG:::::::::::::::G r:::::r          a:::::aaaa::::::a p::::::::::::::::p h:::::h     h:::::hP::::::::P          l::::::lo:::::::::::::::o      tt::::::::::::::t
//       GGG::::::GGG:::G r:::::r           a::::::::::aa:::ap::::::::::::::pp  h:::::h     h:::::hP::::::::P          l::::::l oo:::::::::::oo         tt:::::::::::tt
//          GGGGGG   GGGG rrrrrrr            aaaaaaaaaa  aaaap::::::pppppppp    hhhhhhh     hhhhhhhPPPPPPPPPP          llllllll   ooooooooooo             ttttttttttt
//                                                           p:::::p
//                                                           p:::::p
//                                                          p:::::::p
//                                                          p:::::::p
//                                                          p:::::::p
//                                                          ppppppppp
//
// Grammar AI: GitHub Copilot, comments, documentation
// Copyright: Timm Göring (c) 2025
//
// Repo: https://github.com/TheBlokker/GraphsPlot
//
// ======================================================================
unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.TitleBarCtrls, Vcl.ComCtrls,
  Vcl.Menus, Vcl.StdCtrls, Vcl.Grids, Vcl.ControlList, Vcl.NumberBox,
  System.Math, ABOUT,
  Vcl.ExtCtrls;

type  // https://docwiki.embarcadero.com/RADStudio/Sydney/en/Delphi_Comments#:~:text=the%20reference%20code.-,XML%20Documentation%20Comments,-Delphi%20supports%20XML
      //  wie muss ich das hiermachen, ist über der richtige wegen von defntion einer class?
  TFunctionWorker = class
  private
    FCanvas: TCanvas;
    FWidth: Integer;
    FHeight: Integer;
    FScaleX: Double;
    FScaleY: Double;
    FOffsetX: Integer;
    FOffsetY: Integer;
    FMemoX: TMemo;
    FMemoY: TMemo;
    FMemoAnalysis: TMemo;
    FFunction: TFunc<Double, Double>; // Funktion, die analysiert wird
    procedure DrawGrid;
    procedure DrawAxisMarks;
  public
    constructor Create(ACanvas: TCanvas; AWidth, AHeight: Integer;
      MemoX, MemoY, MemoAnalysis: TMemo);
    procedure SetFunction(AFunction: TFunc<Double, Double>);
    procedure SetScale(AScaleX, AScaleY: Double);
    procedure DrawFunction;
    procedure Drawleniarefkt(m, n: Double);
    procedure Drawquadratfkt(a, b, c: Double);
    procedure Drawsinfkt(a, b, c, d: Double);
    procedure Drawcosfkt(a, b, c, d: Double);
    procedure Drawtanfkt(a, b, c, d: Double);
    procedure Drawsenkrfkt(k: Double);
    procedure AnalyzeFunction;
    function Derive(x: Double): Double;
    function SecondDerive(x: Double): Double;
  end;

type
  TGraphsPlot = class(TForm)
    MemoX: TMemo;
    MemoY: TMemo;
    Enter: TButton;
    MainMenu1: TMainMenu;
    StatusBar1: TStatusBar;
    Datei1: TMenuItem;
    Extras1: TMenuItem;
    N1: TMenuItem;
    Beenden1: TMenuItem;
    Funktionanalysieren1: TMenuItem;
    Limes1: TMenuItem;
    Nullstellen1: TMenuItem;
    Minimum1: TMenuItem;
    Maximum1: TMenuItem;
    Schnittpunkte1: TMenuItem;
    Wendepunkte1: TMenuItem;
    N2: TMenuItem;
    Abbleitungen1: TMenuItem;
    angenteFunktion1: TMenuItem;
    AbbleitunganeinemPunkt1: TMenuItem;
    Label1: TLabel;
    Image1: TImage;
    MemoAnalysis: TMemo;
    ComboBox1: TComboBox;
    Labelyistgleich: TLabel;
    Labellenifktx: TLabel;
    EditLeniFktM: TEdit;
    Editlenifktn: TEdit;
    Editquadratfkta: TEdit;
    Labelquadratxhoch2: TLabel;
    Editquadratfktb: TEdit;
    Labelquadratx: TLabel;
    Editquadratfktc: TEdit;
    Editsinfkta: TEdit;
    Labelsinfktsin: TLabel;
    Editsinfktb: TEdit;
    Labelsinfktx: TLabel;
    Editsinfktc: TEdit;
    Labelsinfktplus: TLabel;
    Editsinfktd: TEdit;
    Editcosfkta: TEdit;
    Editcosfktb: TEdit;
    Editcosfktc: TEdit;
    Editcosfktd: TEdit;
    Labelcosfktplus: TLabel;
    Labelcosfktcos: TLabel;
    Labelcosfktx: TLabel;
    Edittanfkta: TEdit;
    Edittanfktb: TEdit;
    Edittanfktc: TEdit;
    Edittanfktd: TEdit;
    Labeltanfktplus: TLabel;
    Labeltanfkttan: TLabel;
    Labeltanfktx: TLabel;
    Labelxistgleich: TLabel;
    Editsenkrfktk: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Ueber1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure EnterClick(Sender: TObject);
    procedure Beenden1Click(Sender: TObject);
    procedure Ueber1Click(Sender: TObject);
  private
    FWorker: TFunctionWorker;
    { Private-Deklarationen }
  public
    { Public-Deklarationen }

  end;

var
  GraphsPlot: TGraphsPlot;
  Farben: array [0 .. 16] of TColor;
  // Array kann global defniert werden, TList aber nicht?
  CounterFarben: Integer;

implementation

{$R *.dfm}
{ TFunctionWorker }

constructor TFunctionWorker.Create(ACanvas: TCanvas; AWidth, AHeight: Integer;
  MemoX, MemoY, MemoAnalysis: TMemo);
begin
  FCanvas := ACanvas;
  FWidth := AWidth;
  FHeight := AHeight;
  FMemoX := MemoX;
  FMemoY := MemoY;
  FMemoAnalysis := MemoAnalysis;
  FScaleX := 20; // Standard-Skalierung
  FScaleY := 20;
  FOffsetX := FWidth div 2;
  FOffsetY := FHeight div 2;
end;

procedure TFunctionWorker.SetFunction(AFunction: TFunc<Double, Double>);
begin
  FFunction := AFunction;
end;

procedure TFunctionWorker.SetScale(AScaleX, AScaleY: Double);
begin
  FScaleX := AScaleX;
  FScaleY := AScaleY;
end;

procedure TFunctionWorker.DrawGrid;
var
  px, py: Integer;
begin
  FCanvas.Brush.Color := clWhite;
  FCanvas.FillRect(Rect(0, 0, FWidth, FHeight));

  // Gitterlinien zeichnen
  FCanvas.Pen.Color := clSilver;
  FCanvas.Pen.Style := psDot;

  for px := 0 to FWidth do
  begin
    if (px - FOffsetX) mod Round(FScaleX) = 0 then
    begin
      FCanvas.MoveTo(px, 0);
      FCanvas.LineTo(px, FHeight);
    end;
  end;

  for py := 0 to FHeight do
  begin
    if (py - FOffsetY) mod Round(FScaleY) = 0 then
    begin
      FCanvas.MoveTo(0, py);
      FCanvas.LineTo(FWidth, py);
    end;
  end;

  // Achsen zeichnen
  FCanvas.Pen.Color := clGray;
  FCanvas.Pen.Style := psSolid;
  FCanvas.MoveTo(0, FOffsetY);
  FCanvas.LineTo(FWidth, FOffsetY);
  FCanvas.MoveTo(FOffsetX, 0);
  FCanvas.LineTo(FOffsetX, FHeight);

  DrawAxisMarks;
end;

procedure TFunctionWorker.DrawAxisMarks;
var
  i, px, py: Integer;
  MarkLength: Integer;
  Value: Double;
  Text: string;
begin
  MarkLength := 5;

  FCanvas.Font.Name := 'Arial';
  FCanvas.Font.Size := 6;
  FCanvas.Font.Color := clBlack;

  // Markierungen entlang der x-Achse
  for i := -FOffsetX to FWidth - FOffsetX do
  begin
    if i mod Round(FScaleX) = 0 then
    begin
      px := FOffsetX + i;
      Value := i / FScaleX;

      FCanvas.MoveTo(px, FOffsetY - MarkLength);
      FCanvas.LineTo(px, FOffsetY + MarkLength);

      Text := Format('%.1f', [Value]);
      FCanvas.TextOut(px - FCanvas.TextWidth(Text) div 2,
        FOffsetY + MarkLength + 2, Text);
    end;
  end;

  // Markierungen entlang der y-Achse
  for i := -FOffsetY to FHeight - FOffsetY do
  begin
    if i mod Round(FScaleY) = 0 then
    begin
      py := FOffsetY + i;
      Value := -i / FScaleY;

      FCanvas.MoveTo(FOffsetX - MarkLength, py);
      FCanvas.LineTo(FOffsetX + MarkLength, py);

      Text := Format('%.1f', [Value]);
      FCanvas.TextOut(FOffsetX - FCanvas.TextWidth(Text) - MarkLength - 2,
        py - FCanvas.TextHeight(Text) div 2, Text);
    end;
  end;
end;

procedure TFunctionWorker.DrawFunction;
var
  x, y, yPrev: Double;
  px, py, pxPrev, pyPrev: Integer;
  Step: Double;
  IsJump: Boolean;

begin
  FMemoX.Clear;
  FMemoY.Clear;

  Step := 0.05;

  FCanvas.Pen.Color := Farben[Random(Length(Farben))];
  FCanvas.Pen.Width := 2;

  // Startpunkt berechnen
  x := -(FOffsetX / FScaleX); // Startpunkt links auf der Leinwand
  y := FFunction(x);

  // Initialisiere vorherige Koordinaten
  pxPrev := Round(FOffsetX + x * FScaleX);
  pyPrev := FOffsetY - Round(y * FScaleY);
  yPrev := y;
  FCanvas.MoveTo(pxPrev, pyPrev);

  // Schleife über den gesamten Zeichenbereich
  while pxPrev <= FWidth do
  begin
    x := (pxPrev - FOffsetX) / FScaleX; // Weltkoordinate berechnen
    y := FFunction(x);

    // Unstetigkeit oder Sprungprüfung
    IsJump := Abs(y - yPrev) > 100; // Setze eine Schwelle für große Sprünge
    if not IsJump and (Abs(y) < 1E6) then // Werte überspringen, wenn zu groß
    begin
      px := Round(FOffsetX + x * FScaleX);
      py := FOffsetY - Round(y * FScaleY);

      FCanvas.LineTo(px, py);
    end
    else
    begin
      // Bei einem Sprung: MoveTo anstelle von LineTo
      px := Round(FOffsetX + x * FScaleX);
      py := FOffsetY - Round(y * FScaleY);
      FCanvas.MoveTo(px, py);
    end;

    // Werte nur alle 0.05-Schritte in die Tabellen eintragen
    if Abs(Frac(x / Step)) < 1E-6 then
    begin
      FMemoX.Lines.Add(Format('%.2f', [x]));
      FMemoY.Lines.Add(Format('%.2f', [y]));
    end;

    // Werte aktualisieren
    pxPrev := px;
    pyPrev := py;
    yPrev := y;

    // Nächster Pixel
    pxPrev := pxPrev + 1;
  end;
end;

procedure TFunctionWorker.Drawleniarefkt(m: Double; n: Double);
begin
  SetFunction(
    function(x: Double): Double
    begin
      Result := m * x + n;
    end);
  DrawFunction;
end;

procedure TFunctionWorker.Drawquadratfkt(a: Double; b: Double; c: Double);
begin
  SetFunction(
    function(x: Double): Double
    begin
      Result := a * x * x + b * x + c;
    end);
  DrawFunction;
end;

procedure TFunctionWorker.Drawsinfkt(a: Double; b: Double; c: Double;
d: Double);
begin
  SetFunction(
    function(x: Double): Double
    begin
      Result := a * Sin(b * x + c) + d;
    end);
  DrawFunction;
end;

procedure TFunctionWorker.Drawcosfkt(a: Double; b: Double; c: Double;
d: Double);
begin
  SetFunction(
    function(x: Double): Double
    begin
      Result := a * Cos(b * x + c) + d;
    end);
  DrawFunction;
end;

procedure TFunctionWorker.Drawtanfkt(a: Double; b: Double; c: Double;
d: Double);
begin
  SetFunction(
    function(x: Double): Double
    begin
      Result := a * Tan(b * x + c) + d;
    end);
  DrawFunction;
end;

procedure TFunctionWorker.Drawsenkrfkt(k: Double);
var
  px: Integer;
begin

  // Berechnung der Pixelposition für x = k
  px := FOffsetX + Round(k * FScaleX);

  // Zeichne die senkrechte Linie
  FCanvas.Pen.Color := Farben[Random(Length(Farben))];
  FCanvas.Pen.Width := 2;
  FCanvas.MoveTo(px, 0);
  FCanvas.LineTo(px, FHeight);

  // Optional: Werte in die Memos schreiben
  FMemoX.Clear;
  FMemoX.Lines.Add(Format('x = %.2f', [k]));
  FMemoY.Clear;
  FMemoY.Lines.Add('Alle y-Werte möglich');
end;

procedure TFunctionWorker.AnalyzeFunction;
var
  x, y, derivative, secondDerivative: Double;
  foundResults: Boolean;
  i: Integer;
begin
  FMemoAnalysis.Clear; // Analysenfeld leeren
  FMemoAnalysis.Lines.Add('Analyse der Funktion:');
  FMemoAnalysis.Lines.Add('-----------------------');
  foundResults := False;

  for i := -FOffsetX to FWidth - FOffsetX do
  begin
    x := i / FScaleX;
    y := FFunction(x);
    derivative := Derive(x);
    secondDerivative := SecondDerive(x);

    // **Nullstellen-Erkennung** (Kombination aus exakter Prüfung und Zwischenwert-Methode)
    if Abs(y) < 0.0001 then
    begin
      FMemoAnalysis.Lines.Add(Format('Nullstelle bei x = %.2f', [x]));
      foundResults := True;
    end
    else if (i > -FOffsetX) and (FFunction(x) * FFunction(x - 1 / FScaleX) < 0)
    then
    begin
      FMemoAnalysis.Lines.Add(Format('Nullstelle bei x zwischen %.2f und %.2f',
        [x - 1 / FScaleX, x]));
      foundResults := True;
    end;

    // **Extrempunkte-Erkennung** (Ableitung nahe null + Vorzeichenwechsel der Ableitung)
    if Abs(derivative) < 0.0001 then
    begin
      // Bestimme das Vorzeichen der zweiten Ableitung
      if secondDerivative > 0 then
        FMemoAnalysis.Lines.Add
          (Format('Minimum bei x = %.2f, y = %.2f', [x, y]))
      else if secondDerivative < 0 then
        FMemoAnalysis.Lines.Add
          (Format('Maximum bei x = %.2f, y = %.2f', [x, y]));
      foundResults := True;
    end
    else if (i > -FOffsetX) and (Derive(x - 1 / FScaleX) * Derive(x) < 0) then
    begin
      FMemoAnalysis.Lines.Add
        (Format('Extrempunkt in der Nähe von x = %.2f', [x]));
      foundResults := True;
    end;

    // **Wendepunkte-Erkennung** (Zweite Ableitung nahe null + Vorzeichenwechsel)
    if Abs(secondDerivative) < 0.0001 then
    begin
      // Zusätzliche Prüfung: Vorzeichenwechsel der ersten Ableitung
      if (i > -FOffsetX) and
        (Derive(x - 1 / FScaleX) * Derive(x + 1 / FScaleX) < 0) then
      begin
        FMemoAnalysis.Lines.Add
          (Format('Wendepunkt bei x = %.2f, y = %.2f', [x, y]));
        foundResults := True;
      end;
    end
    else if (i > -FOffsetX) and
      (SecondDerive(x - 1 / FScaleX) * SecondDerive(x) < 0) then
    begin
      FMemoAnalysis.Lines.Add
        (Format('Wendepunkt in der Nähe von x = %.2f', [x]));
      foundResults := True;
    end;
  end;

  // Standardmeldung, falls keine Ergebnisse gefunden werden
  if not foundResults then
    FMemoAnalysis.Lines.Add
      ('Keine Nullstellen, Extrempunkte oder Wendepunkte gefunden.');
end;

function TFunctionWorker.Derive(x: Double): Double;
const
  h = 0.0001; // Sehr kleiner Schritt für numerische Ableitung
begin
  Result := (FFunction(x + h) - FFunction(x - h)) / (2 * h);
end;

function TFunctionWorker.SecondDerive(x: Double): Double;
const
  h = 0.0001; // Sehr kleiner Schritt
begin
  Result := (FFunction(x + h) - 2 * FFunction(x) + FFunction(x - h)) / (h * h);
end;

{ TForm1 }

procedure TGraphsPlot.Beenden1Click(Sender: TObject);
begin
  Application.Terminate;
end;

// Auswahl auslagern???
procedure TGraphsPlot.ComboBox1Change(Sender: TObject);
begin
  case ComboBox1.ItemIndex of
    0:
      begin
        Labellenifktx.Visible := True;
        EditLeniFktM.Visible := True;
        Editlenifktn.Visible := True;
        Labelyistgleich.Visible := True;

        // False statements
        Labelquadratx.Visible := False;
        Labelquadratxhoch2.Visible := False;
        Editquadratfkta.Visible := False;
        Editquadratfktb.Visible := False;
        Editquadratfktc.Visible := False;
        Labelsinfktsin.Visible := False;
        Labelsinfktx.Visible := False;
        Labelsinfktplus.Visible := False;
        Editsinfkta.Visible := False;
        Editsinfktb.Visible := False;
        Editsinfktc.Visible := False;
        Editsinfktd.Visible := False;
        Labelcosfktcos.Visible := False;
        Labelcosfktx.Visible := False;
        Labelcosfktplus.Visible := False;
        Editcosfkta.Visible := False;
        Editcosfktb.Visible := False;
        Editcosfktc.Visible := False;
        Editcosfktd.Visible := False;
        Labeltanfkttan.Visible := False;
        Labeltanfktx.Visible := False;
        Labeltanfktplus.Visible := False;
        Edittanfkta.Visible := False;
        Edittanfktb.Visible := False;
        Edittanfktc.Visible := False;
        Edittanfktd.Visible := False;
        Labelxistgleich.Visible := False;
        Editsenkrfktk.Visible := False;
      end;

    1:
      begin
        Labelquadratxhoch2.Visible := True;
        Labelquadratx.Visible := True;
        Editquadratfkta.Visible := True;
        Editquadratfktb.Visible := True;
        Editquadratfktc.Visible := True;
        Labelyistgleich.Visible := True;

        // False statements
        Labellenifktx.Visible := False;
        EditLeniFktM.Visible := False;
        Editlenifktn.Visible := False;
        Labelsinfktsin.Visible := False;
        Labelsinfktx.Visible := False;
        Labelsinfktplus.Visible := False;
        Editsinfkta.Visible := False;
        Editsinfktb.Visible := False;
        Editsinfktc.Visible := False;
        Editsinfktd.Visible := False;
        Labelcosfktcos.Visible := False;
        Labelcosfktx.Visible := False;
        Labelcosfktplus.Visible := False;
        Editcosfkta.Visible := False;
        Editcosfktb.Visible := False;
        Editcosfktc.Visible := False;
        Editcosfktd.Visible := False;
        Labeltanfkttan.Visible := False;
        Labeltanfktx.Visible := False;
        Labeltanfktplus.Visible := False;
        Edittanfkta.Visible := False;
        Edittanfktb.Visible := False;
        Edittanfktc.Visible := False;
        Edittanfktd.Visible := False;
        Labelxistgleich.Visible := False;
        Editsenkrfktk.Visible := False;
      end;

    2:
      begin
        Labelsinfktsin.Visible := True;
        Labelsinfktx.Visible := True;
        Labelsinfktplus.Visible := True;
        Editsinfkta.Visible := True;
        Editsinfktb.Visible := True;
        Editsinfktc.Visible := True;
        Editsinfktd.Visible := True;
        Labelyistgleich.Visible := True;

        // False statements
        Labelquadratx.Visible := False;
        Labellenifktx.Visible := False;
        EditLeniFktM.Visible := False;
        Editlenifktn.Visible := False;
        Labelquadratxhoch2.Visible := False;
        Editquadratfkta.Visible := False;
        Editquadratfktb.Visible := False;
        Editquadratfktc.Visible := False;
        Labelcosfktcos.Visible := False;
        Labelcosfktx.Visible := False;
        Labelcosfktplus.Visible := False;
        Editcosfkta.Visible := False;
        Editcosfktb.Visible := False;
        Editcosfktc.Visible := False;
        Editcosfktd.Visible := False;
        Labeltanfkttan.Visible := False;
        Labeltanfktx.Visible := False;
        Labeltanfktplus.Visible := False;
        Edittanfkta.Visible := False;
        Edittanfktb.Visible := False;
        Edittanfktc.Visible := False;
        Edittanfktd.Visible := False;
        Labelxistgleich.Visible := False;
        Editsenkrfktk.Visible := False;
      end;

    3:
      begin
        Labelcosfktcos.Visible := True;
        Labelcosfktx.Visible := True;
        Labelcosfktplus.Visible := True;
        Editcosfkta.Visible := True;
        Editcosfktb.Visible := True;
        Editcosfktc.Visible := True;
        Editcosfktd.Visible := True;
        Labelyistgleich.Visible := True;

        // False statements
        Labelquadratx.Visible := False;
        Labellenifktx.Visible := False;
        EditLeniFktM.Visible := False;
        Editlenifktn.Visible := False;
        Labelquadratxhoch2.Visible := False;
        Editquadratfkta.Visible := False;
        Editquadratfktb.Visible := False;
        Editquadratfktc.Visible := False;
        Labelsinfktsin.Visible := False;
        Labelsinfktx.Visible := False;
        Labelsinfktplus.Visible := False;
        Editsinfkta.Visible := False;
        Editsinfktb.Visible := False;
        Editsinfktc.Visible := False;
        Editsinfktd.Visible := False;
        Labeltanfkttan.Visible := False;
        Labeltanfktx.Visible := False;
        Labeltanfktplus.Visible := False;
        Edittanfkta.Visible := False;
        Edittanfktb.Visible := False;
        Edittanfktc.Visible := False;
        Edittanfktd.Visible := False;
        Labelxistgleich.Visible := False;
        Editsenkrfktk.Visible := False;
      end;

    4:
      begin
        Labeltanfkttan.Visible := True;
        Labeltanfktx.Visible := True;
        Labeltanfktplus.Visible := True;
        Edittanfkta.Visible := True;
        Edittanfktb.Visible := True;
        Edittanfktc.Visible := True;
        Edittanfktd.Visible := True;
        Labelyistgleich.Visible := True;

        // False statements
        Labelquadratx.Visible := False;
        Labellenifktx.Visible := False;
        EditLeniFktM.Visible := False;
        Editlenifktn.Visible := False;
        Labelquadratxhoch2.Visible := False;
        Editquadratfkta.Visible := False;
        Editquadratfktb.Visible := False;
        Editquadratfktc.Visible := False;
        Labelsinfktsin.Visible := False;
        Labelsinfktx.Visible := False;
        Labelsinfktplus.Visible := False;
        Editsinfkta.Visible := False;
        Editsinfktb.Visible := False;
        Editsinfktc.Visible := False;
        Editsinfktd.Visible := False;
        Labelcosfktcos.Visible := False;
        Labelcosfktx.Visible := False;
        Labelcosfktplus.Visible := False;
        Editcosfkta.Visible := False;
        Editcosfktb.Visible := False;
        Editcosfktc.Visible := False;
        Editcosfktd.Visible := False;
        Labelxistgleich.Visible := False;
        Editsenkrfktk.Visible := False;
      end;

    5:
      begin
        Labelxistgleich.Visible := True;
        Editsenkrfktk.Visible := True;

        // False statements
        Labelyistgleich.Visible := False;
        Labelquadratx.Visible := False;
        Labellenifktx.Visible := False;
        EditLeniFktM.Visible := False;
        Editlenifktn.Visible := False;
        Labelquadratxhoch2.Visible := False;
        Editquadratfkta.Visible := False;
        Editquadratfktb.Visible := False;
        Editquadratfktc.Visible := False;
        Labelsinfktsin.Visible := False;
        Labelsinfktx.Visible := False;
        Labelsinfktplus.Visible := False;
        Editsinfkta.Visible := False;
        Editsinfktb.Visible := False;
        Editsinfktc.Visible := False;
        Editsinfktd.Visible := False;
        Labelcosfktcos.Visible := False;
        Labelcosfktx.Visible := False;
        Labelcosfktplus.Visible := False;
        Editcosfkta.Visible := False;
        Editcosfktb.Visible := False;
        Editcosfktc.Visible := False;
        Editcosfktd.Visible := False;
        Labeltanfkttan.Visible := False;
        Labeltanfktx.Visible := False;
        Labeltanfktplus.Visible := False;
        Edittanfkta.Visible := False;
        Edittanfktb.Visible := False;
        Edittanfktc.Visible := False;
        Edittanfktd.Visible := False;
      end;
  end;

end;

procedure TGraphsPlot.EnterClick(Sender: TObject);
begin
  case ComboBox1.ItemIndex of
    0:
      begin
        FWorker.Drawleniarefkt(StrToFloat(EditLeniFktM.Text),
          StrToFloat(Editlenifktn.Text));
      end;
    1:
      begin
        FWorker.Drawquadratfkt(StrToFloat(Editquadratfkta.Text),
          StrToFloat(Editquadratfktb.Text), StrToFloat(Editquadratfktc.Text));
      end;
    2:
      begin
        FWorker.Drawsinfkt(StrToFloat(Editsinfkta.Text),
          StrToFloat(Editsinfktb.Text), StrToFloat(Editsinfktc.Text),
          StrToFloat(Editsinfktd.Text));
      end;
    3:
      begin
        FWorker.Drawcosfkt(StrToFloat(Editcosfkta.Text),
          StrToFloat(Editcosfktb.Text), StrToFloat(Editcosfktc.Text),
          StrToFloat(Editcosfktd.Text));
      end;
    4:
      begin
        FWorker.Drawtanfkt(StrToFloat(Edittanfkta.Text),
          StrToFloat(Edittanfktb.Text), StrToFloat(Edittanfktc.Text),
          StrToFloat(Edittanfktd.Text));
      end;
    5:
      begin
        FWorker.Drawsenkrfkt(StrToFloat(Editsenkrfktk.Text));
      end;

  end;
  FWorker.AnalyzeFunction;
end;

procedure TGraphsPlot.FormCreate(Sender: TObject);
begin
  Randomize;

  // funktioniert nur bei sin, wie bnei anderen fkt
  FWorker := TFunctionWorker.Create(Image1.Canvas, Image1.Width, Image1.Height,
    MemoX, MemoY, MemoAnalysis);

  FWorker.DrawGrid;
  // Farben definieren
  Farben[0] := clAqua;
  Farben[1] := clBlack;
  Farben[2] := clBlue;
  Farben[3] := clBlue;
  Farben[4] := clDkGray;
  Farben[5] := clFuchsia;
  Farben[6] := clGreen;
  Farben[7] := clLime;
  Farben[8] := clMaroon;
  Farben[9] := clMedGray;
  // In der bibliotheks referenz steht das es clMedGreen gibt.
  Farben[10] := clNavy;
  Farben[11] := clOlive;
  Farben[12] := clPurple;
  Farben[13] := clRed;
  Farben[14] := clSkyBlue;
  Farben[15] := clTeal;
  Farben[16] := clYellow;

end;

procedure TGraphsPlot.Ueber1Click(Sender: TObject);
begin
  AboutBox.Show();
end;

end.
