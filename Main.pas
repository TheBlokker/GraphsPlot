unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.TitleBarCtrls, Vcl.ComCtrls,
  Vcl.Menus, Vcl.StdCtrls, Vcl.Grids, Vcl.ControlList, Vcl.NumberBox,
  System.Math,
  Vcl.ExtCtrls;

type
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
  end;

type
  TForm1 = class(TForm)
    MemoX: TMemo;
    MemoY: TMemo;
    Enter: TButton;
    MainMenu1: TMainMenu;
    StatusBar1: TStatusBar;
    Datei1: TMenuItem;
    Datei2: TMenuItem;
    LeniareFunktion1: TMenuItem;
    QuadratischeFunktion1: TMenuItem;
    Potenzfunktion1: TMenuItem;
    rigonometrischeFunktion1: TMenuItem;
    SenkrechteFunktion1: TMenuItem;
    FreieFunktioneingabe1: TMenuItem;
    Extras1: TMenuItem;
    N1: TMenuItem;
    Beenden1: TMenuItem;
    Funktionanalysieren1: TMenuItem;
    Funktionanalysieren2: TMenuItem;
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
    tabelle: TMenuItem;
    abelleexternAnzeigen1: TMenuItem;
    abelleexternAnzeigen2: TMenuItem;
    Label1: TLabel;
    Image1: TImage;
    MemoAnalysis: TMemo;
    ComboBox1: TComboBox;
    Labelyistgleich: TLabel;
    Labellenifktx: TLabel;
    Editlenifktm: TEdit;
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
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure EnterClick(Sender: TObject);
  private
    FWorker: TFunctionWorker;
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;
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
  x, y: Double;
  px, py: Integer;
begin
  FMemoX.Clear;
  FMemoY.Clear;

  FCanvas.Pen.Color := Farben[Random(Length(Farben))];
  FCanvas.Pen.Width := 2;

  for px := 0 to FWidth do
  begin
    x := (px - FOffsetX) / FScaleX;
    y := FFunction(x);
    py := FOffsetY - Round(y * FScaleY);

    if px = 0 then
      FCanvas.MoveTo(px, py)
    else
      FCanvas.LineTo(px, py);

    if px mod 20 = 0 then
    begin
      FMemoX.Lines.Add(Format('%.2f', [x]));
      FMemoY.Lines.Add(Format('%.2f', [y]));
    end;
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
begin
  FMemoAnalysis.Clear;
  FMemoAnalysis.Lines.Add('Analyse der Funktion:');
  FMemoAnalysis.Lines.Add('Ableitung: Noch nicht implementiert');
  FMemoAnalysis.Lines.Add('Grenzwert: Nicht definiert');
end;

{ TForm1 }

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
  case ComboBox1.ItemIndex of
    0:
      begin
        Labellenifktx.Visible := true;
        Editlenifktm.Visible := true;
        Editlenifktn.Visible := true;
        Labelyistgleich.Visible := true;

        // False statements
        Labelquadratx.Visible := false;
        Labelquadratxhoch2.Visible := false;
        Editquadratfkta.Visible := false;
        Editquadratfktb.Visible := false;
        Editquadratfktc.Visible := false;
        Labelsinfktsin.Visible := false;
        Labelsinfktx.Visible := false;
        Labelsinfktplus.Visible := false;
        Editsinfkta.Visible := false;
        Editsinfktb.Visible := false;
        Editsinfktc.Visible := false;
        Editsinfktd.Visible := false;
        Labelcosfktcos.Visible := false;
        Labelcosfktx.Visible := false;
        Labelcosfktplus.Visible := false;
        Editcosfkta.Visible := false;
        Editcosfktb.Visible := false;
        Editcosfktc.Visible := false;
        Editcosfktd.Visible := false;
        Labeltanfkttan.Visible := false;
        Labeltanfktx.Visible := false;
        Labeltanfktplus.Visible := false;
        Edittanfkta.Visible := false;
        Edittanfktb.Visible := false;
        Edittanfktc.Visible := false;
        Edittanfktd.Visible := false;
        Labelxistgleich.Visible := false;
        Editsenkrfktk.Visible := false;
      end;

    1:
      begin
        Labelquadratxhoch2.Visible := true;
        Labelquadratx.Visible := true;
        Editquadratfkta.Visible := true;
        Editquadratfktb.Visible := true;
        Editquadratfktc.Visible := true;
        Labelyistgleich.Visible := true;

        // False statements
        Labellenifktx.Visible := false;
        Editlenifktm.Visible := false;
        Editlenifktn.Visible := false;
        Labelsinfktsin.Visible := false;
        Labelsinfktx.Visible := false;
        Labelsinfktplus.Visible := false;
        Editsinfkta.Visible := false;
        Editsinfktb.Visible := false;
        Editsinfktc.Visible := false;
        Editsinfktd.Visible := false;
        Labelcosfktcos.Visible := false;
        Labelcosfktx.Visible := false;
        Labelcosfktplus.Visible := false;
        Editcosfkta.Visible := false;
        Editcosfktb.Visible := false;
        Editcosfktc.Visible := false;
        Editcosfktd.Visible := false;
        Labeltanfkttan.Visible := false;
        Labeltanfktx.Visible := false;
        Labeltanfktplus.Visible := false;
        Edittanfkta.Visible := false;
        Edittanfktb.Visible := false;
        Edittanfktc.Visible := false;
        Edittanfktd.Visible := false;
        Labelxistgleich.Visible := false;
        Editsenkrfktk.Visible := false;
      end;

    2:
      begin
        Labelsinfktsin.Visible := true;
        Labelsinfktx.Visible := true;
        Labelsinfktplus.Visible := true;
        Editsinfkta.Visible := true;
        Editsinfktb.Visible := true;
        Editsinfktc.Visible := true;
        Editsinfktd.Visible := true;
        Labelyistgleich.Visible := true;

        // False statements
        Labelquadratx.Visible := false;
        Labellenifktx.Visible := false;
        Editlenifktm.Visible := false;
        Editlenifktn.Visible := false;
        Labelquadratxhoch2.Visible := false;
        Editquadratfkta.Visible := false;
        Editquadratfktb.Visible := false;
        Editquadratfktc.Visible := false;
        Labelcosfktcos.Visible := false;
        Labelcosfktx.Visible := false;
        Labelcosfktplus.Visible := false;
        Editcosfkta.Visible := false;
        Editcosfktb.Visible := false;
        Editcosfktc.Visible := false;
        Editcosfktd.Visible := false;
        Labeltanfkttan.Visible := false;
        Labeltanfktx.Visible := false;
        Labeltanfktplus.Visible := false;
        Edittanfkta.Visible := false;
        Edittanfktb.Visible := false;
        Edittanfktc.Visible := false;
        Edittanfktd.Visible := false;
        Labelxistgleich.Visible := false;
        Editsenkrfktk.Visible := false;
      end;

    3:
      begin
        Labelcosfktcos.Visible := true;
        Labelcosfktx.Visible := true;
        Labelcosfktplus.Visible := true;
        Editcosfkta.Visible := true;
        Editcosfktb.Visible := true;
        Editcosfktc.Visible := true;
        Editcosfktd.Visible := true;
        Labelyistgleich.Visible := true;

        // False statements
        Labelquadratx.Visible := false;
        Labellenifktx.Visible := false;
        Editlenifktm.Visible := false;
        Editlenifktn.Visible := false;
        Labelquadratxhoch2.Visible := false;
        Editquadratfkta.Visible := false;
        Editquadratfktb.Visible := false;
        Editquadratfktc.Visible := false;
        Labelsinfktsin.Visible := false;
        Labelsinfktx.Visible := false;
        Labelsinfktplus.Visible := false;
        Editsinfkta.Visible := false;
        Editsinfktb.Visible := false;
        Editsinfktc.Visible := false;
        Editsinfktd.Visible := false;
        Labeltanfkttan.Visible := false;
        Labeltanfktx.Visible := false;
        Labeltanfktplus.Visible := false;
        Edittanfkta.Visible := false;
        Edittanfktb.Visible := false;
        Edittanfktc.Visible := false;
        Edittanfktd.Visible := false;
        Labelxistgleich.Visible := false;
        Editsenkrfktk.Visible := false;
      end;

    4:
      begin
        Labeltanfkttan.Visible := true;
        Labeltanfktx.Visible := true;
        Labeltanfktplus.Visible := true;
        Edittanfkta.Visible := true;
        Edittanfktb.Visible := true;
        Edittanfktc.Visible := true;
        Edittanfktd.Visible := true;
        Labelyistgleich.Visible := true;

        // False statements
        Labelquadratx.Visible := false;
        Labellenifktx.Visible := false;
        Editlenifktm.Visible := false;
        Editlenifktn.Visible := false;
        Labelquadratxhoch2.Visible := false;
        Editquadratfkta.Visible := false;
        Editquadratfktb.Visible := false;
        Editquadratfktc.Visible := false;
        Labelsinfktsin.Visible := false;
        Labelsinfktx.Visible := false;
        Labelsinfktplus.Visible := false;
        Editsinfkta.Visible := false;
        Editsinfktb.Visible := false;
        Editsinfktc.Visible := false;
        Editsinfktd.Visible := false;
        Labelcosfktcos.Visible := false;
        Labelcosfktx.Visible := false;
        Labelcosfktplus.Visible := false;
        Editcosfkta.Visible := false;
        Editcosfktb.Visible := false;
        Editcosfktc.Visible := false;
        Editcosfktd.Visible := false;
        Labelxistgleich.Visible := false;
        Editsenkrfktk.Visible := false;
      end;

    5:
      begin
        Labelxistgleich.Visible := true;
        Editsenkrfktk.Visible := true;

        // False statements
        Labelyistgleich.Visible := false;
        Labelquadratx.Visible := false;
        Labellenifktx.Visible := false;
        Editlenifktm.Visible := false;
        Editlenifktn.Visible := false;
        Labelquadratxhoch2.Visible := false;
        Editquadratfkta.Visible := false;
        Editquadratfktb.Visible := false;
        Editquadratfktc.Visible := false;
        Labelsinfktsin.Visible := false;
        Labelsinfktx.Visible := false;
        Labelsinfktplus.Visible := false;
        Editsinfkta.Visible := false;
        Editsinfktb.Visible := false;
        Editsinfktc.Visible := false;
        Editsinfktd.Visible := false;
        Labelcosfktcos.Visible := false;
        Labelcosfktx.Visible := false;
        Labelcosfktplus.Visible := false;
        Editcosfkta.Visible := false;
        Editcosfktb.Visible := false;
        Editcosfktc.Visible := false;
        Editcosfktd.Visible := false;
        Labeltanfkttan.Visible := false;
        Labeltanfktx.Visible := false;
        Labeltanfktplus.Visible := false;
        Edittanfkta.Visible := false;
        Edittanfktb.Visible := false;
        Edittanfktc.Visible := false;
        Edittanfktd.Visible := false;
      end;
  end;

end;

procedure TForm1.EnterClick(Sender: TObject);
begin
  case ComboBox1.ItemIndex of
    0:
      begin
        FWorker.Drawleniarefkt(StrToFloat(Editlenifktm.Text),
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
end;

procedure TForm1.FormCreate(Sender: TObject);
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
  Farben[3] := clCream;
  Farben[4] := clDkGray;
  Farben[5] := clFuchsia;
  Farben[6] := clGreen;
  Farben[7] := clLime;
  Farben[8] := clMaroon;
  Farben[9] := clMedGray; // In der bibliotheks referenz steht das es clMedGreen gibt.
  Farben[10] := clNavy;
  Farben[11] := clOlive;
  Farben[12] := clPurple;
  Farben[13] := clRed;
  Farben[14] := clSkyBlue;
  Farben[15] := clTeal;
  Farben[16] := clYellow;


end;

end.
