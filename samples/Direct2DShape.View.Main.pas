unit Direct2DShape.View.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, System.TypInfo, Direct2DShape,
  Vcl.Samples.Spin;

type
  TfrmSample = class(TForm)
    pnlShape: TPanel;
    pnlD2DShape: TPanel;
    lbTShape: TLabel;
    lbD2DShape: TLabel;
    shapeAvg: TShape;
    shapeBig: TShape;
    shapeSmall1: TShape;
    shapeSmall2: TShape;
    shapeSmall3: TShape;
    shapeSmall4: TShape;
    D2DshapeSmall4: TDirect2DShape;
    D2DshapeBig: TDirect2DShape;
    D2DshapeAvg: TDirect2DShape;
    D2DshapeSmall3: TDirect2DShape;
    D2DshapeSmall2: TDirect2DShape;
    D2DshapeSmall1: TDirect2DShape;
    pnlOptions: TPanel;
    cbShapeType: TComboBox;
    gbShapeType: TGroupBox;
    GroupBox1: TGroupBox;
    cbBrushStyle: TComboBox;
    lbD2DInfo: TLabel;
    colorBrush: TColorBox;
    gbPen: TGroupBox;
    colorPen: TColorBox;
    edtPenWidth: TSpinEdit;
    cbPenStyle: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure cbShapeTypeChange(Sender: TObject);
    procedure cbBrushStyleChange(Sender: TObject);
    procedure lbD2DInfoClick(Sender: TObject);
    procedure colorBrushChange(Sender: TObject);
    procedure colorPenChange(Sender: TObject);
    procedure edtPenWidthChange(Sender: TObject);
    procedure cbPenStyleChange(Sender: TObject);
  private
    procedure UpdateShapesType(AValue: TShapeType);
    procedure UpdateBrushStyle(AValue: TBrushStyle);
    procedure UpdateBrushColor(AValue: TColor);
    procedure UpdatePenColor(AValue: TColor);
    procedure UpdatePenWidth(AValue: Integer);
    procedure UpdatePenStyle(AValue: TPenStyle);
  public
    { Public declarations }
  end;

var
  frmSample: TfrmSample;

implementation

{$R *.dfm}

procedure TfrmSample.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown:= True;

  // Shape type
  cbShapetype.Items.Clear;
  for var ShapeType := Low(TShapeType) to High(TShapeType) do
    cbShapeType.Items.AddObject(GetEnumName(TypeInfo(TShapeType), Ord(ShapeType)), TObject(ShapeType));
  cbShapetype.ItemIndex:= 0;
  cbShapeType.OnChange(cbShapeType);

  // Brush style
  cbPenStyle.Items.Clear;
  for var BrushStyle := Low(TBrushStyle) to High(TBrushStyle) do
    cbBrushStyle.Items.AddObject(GetEnumName(TypeInfo(TBrushStyle), Ord(BrushStyle)), TObject(BrushStyle));
  cbBrushStyle.ItemIndex:= 0;
  cbBrushStyle.OnChange(cbBrushStyle);

  // Pen style
  cbPenStyle.Items.Clear;
  for var PenStyle := Low(TPenStyle) to High(TPenStyle) do
    cbPenStyle.Items.AddObject(GetEnumName(TypeInfo(TPenStyle), Ord(PenStyle)), TObject(PenStyle));
  cbPenStyle.ItemIndex:= 0;
  cbPenStyle.OnChange(cbPenStyle);

end;

procedure TfrmSample.cbShapeTypeChange(Sender: TObject);
begin
  if (Sender as TComboBox).ItemIndex < 0 then
    Exit;
  UpdateShapesType(TShapeType((Sender as TComboBox).Items.Objects[(Sender as TComboBox).ItemIndex]));
end;

procedure TfrmSample.UpdateShapesType(AValue: TShapeType);
begin
  shapeAvg.Shape   := AValue;
  shapeBig.Shape   := AValue;
  shapeSmall1.Shape:= AValue;
  shapeSmall2.Shape:= AValue;
  shapeSmall3.Shape:= AValue;
  shapeSmall4.Shape:= AValue;

  D2DshapeSmall4.Shape:= AValue;
  D2DshapeBig.Shape   := AValue;
  D2DshapeAvg.Shape   := AValue;
  D2DshapeSmall3.Shape:= AValue;
  D2DshapeSmall2.Shape:= AValue;
  D2DshapeSmall1.Shape:= AValue;
end;

procedure TfrmSample.cbBrushStyleChange(Sender: TObject);
begin
  if (Sender as TComboBox).ItemIndex < 0 then
    Exit;
  UpdateBrushStyle(TBrushStyle((Sender as TComboBox).Items.Objects[(Sender as TComboBox).ItemIndex]));
end;

procedure TfrmSample.UpdateBrushStyle(AValue: TBrushStyle);
begin
  shapeAvg.Brush.Style   := AValue;
  shapeBig.Brush.Style   := AValue;
  shapeSmall1.Brush.Style:= AValue;
  shapeSmall2.Brush.Style:= AValue;
  shapeSmall3.Brush.Style:= AValue;
  shapeSmall4.Brush.Style:= AValue;

  D2DshapeSmall4.Brush.Style:= AValue;
  D2DshapeBig.Brush.Style   := AValue;
  D2DshapeAvg.Brush.Style   := AValue;
  D2DshapeSmall3.Brush.Style:= AValue;
  D2DshapeSmall2.Brush.Style:= AValue;
  D2DshapeSmall1.Brush.Style:= AValue;
end;

procedure TfrmSample.lbD2DInfoClick(Sender: TObject);
begin
  ShowMessage('TDirect2DBrush does not render bsHorizontal..bsDiagCross styles! Only bsSolid..bsClear!');
end;

procedure TfrmSample.colorBrushChange(Sender: TObject);
begin
  UpdateBrushColor(colorBrush.Selected);
end;

procedure TfrmSample.UpdateBrushColor(AValue: TColor);
begin
  shapeAvg.Brush.Color   := AValue;
  shapeBig.Brush.Color   := AValue;
  shapeSmall1.Brush.Color:= AValue;
  shapeSmall2.Brush.Color:= AValue;
  shapeSmall3.Brush.Color:= AValue;
  shapeSmall4.Brush.Color:= AValue;

  D2DshapeSmall4.Brush.Color:= AValue;
  D2DshapeBig.Brush.Color   := AValue;
  D2DshapeAvg.Brush.Color   := AValue;
  D2DshapeSmall3.Brush.Color:= AValue;
  D2DshapeSmall2.Brush.Color:= AValue;
  D2DshapeSmall1.Brush.Color:= AValue;
end;

procedure TfrmSample.colorPenChange(Sender: TObject);
begin
  UpdatePenColor(colorPen.Selected);
end;

procedure TfrmSample.UpdatePenColor(AValue: TColor);
begin
  shapeAvg.Pen.Color   := AValue;
  shapeBig.Pen.Color   := AValue;
  shapeSmall1.Pen.Color:= AValue;
  shapeSmall2.Pen.Color:= AValue;
  shapeSmall3.Pen.Color:= AValue;
  shapeSmall4.Pen.Color:= AValue;

  D2DshapeSmall4.Pen.Color:= AValue;
  D2DshapeBig.Pen.Color   := AValue;
  D2DshapeAvg.Pen.Color   := AValue;
  D2DshapeSmall3.Pen.Color:= AValue;
  D2DshapeSmall2.Pen.Color:= AValue;
  D2DshapeSmall1.Pen.Color:= AValue;
end;

procedure TfrmSample.edtPenWidthChange(Sender: TObject);
begin
  UpdatePenWidth((Sender as TSpinEdit).Value);
end;

procedure TfrmSample.UpdatePenWidth(AValue: Integer);
begin
  shapeAvg.Pen.Width   := AValue;
  shapeBig.Pen.Width   := AValue;
  shapeSmall1.Pen.Width:= AValue;
  shapeSmall2.Pen.Width:= AValue;
  shapeSmall3.Pen.Width:= AValue;
  shapeSmall4.Pen.Width:= AValue;

  D2DshapeSmall4.Pen.Width:= AValue;
  D2DshapeBig.Pen.Width   := AValue;
  D2DshapeAvg.Pen.Width   := AValue;
  D2DshapeSmall3.Pen.Width:= AValue;
  D2DshapeSmall2.Pen.Width:= AValue;
  D2DshapeSmall1.Pen.Width:= AValue;
end;

procedure TfrmSample.cbPenStyleChange(Sender: TObject);
begin
  UpdatePenStyle(TPenStyle((Sender as TComboBox).Items.Objects[(Sender as TComboBox).ItemIndex]));
end;

procedure TfrmSample.UpdatePenStyle(AValue: TPenStyle);
begin
  shapeAvg.Pen.Style   := AValue;
  shapeBig.Pen.Style   := AValue;
  shapeSmall1.Pen.Style:= AValue;
  shapeSmall2.Pen.Style:= AValue;
  shapeSmall3.Pen.Style:= AValue;
  shapeSmall4.Pen.Style:= AValue;

  D2DshapeSmall4.Pen.Style:= AValue;
  D2DshapeBig.Pen.Style   := AValue;
  D2DshapeAvg.Pen.Style   := AValue;
  D2DshapeSmall3.Pen.Style:= AValue;
  D2DshapeSmall2.Pen.Style:= AValue;
  D2DshapeSmall1.Pen.Style:= AValue;
end;

end.
