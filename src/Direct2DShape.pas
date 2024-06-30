unit Direct2DShape;

interface

uses
  System.Classes,
  System.SysUtils,
  Vcl.Controls,
  Vcl.Graphics,
  Vcl.ExtCtrls,
  Vcl.Direct2D,
  Winapi.D2D1,
  Winapi.Windows,
  Winapi.Messages;

type
  TDirect2DShape = class(TGraphicControl)
  private
    FPen      : TPen;
    FBrush    : TBrush;
    FShape    : TShapeType;
    FD2DCanvas: TDirect2DCanvas;

    procedure SetBrush(Value: TBrush);
    procedure SetPen(Value: TPen);
    procedure SetShape(Value: TShapeType);

  protected
    procedure ChangeScale(M, D: Integer; isDpiChange: Boolean); override;
    procedure Paint; override;

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

  published
    procedure StyleChanged(Sender: TObject);
    property Align;
    property Anchors;
    property Brush: TBrush read FBrush write SetBrush;
    property DragCursor;
    property DragKind;
    property DragMode;
    property Enabled;
    property Constraints;
    property ParentShowHint;
    property Pen: TPen read FPen write SetPen;
    property Shape: TShapeType read FShape write SetShape default stRectangle;
    property ShowHint;
    property Touch;
    property Visible;
    property OnContextPopup;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDock;
    property OnEndDrag;
    property OnMouseActivate;
    property OnMouseDown;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnMouseMove;
    property OnMouseUp;
    property OnGesture;
    property OnStartDock;
    property OnStartDrag;

  end;

implementation

{ TDirect2DShape }

constructor TDirect2DShape.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle + [csReplicatable];
  Width := 65;
  Height := 65;
  FPen := TPen.Create;
  FPen.OnChange := StyleChanged;
  FBrush := TBrush.Create;
  FBrush.OnChange := StyleChanged;
end;

destructor TDirect2DShape.Destroy;
begin
  FPen.Free;
  FBrush.Free;
  if Assigned(FD2DCanvas) then
    FreeAndNil(FD2DCanvas);
  inherited Destroy;
end;

procedure TDirect2DShape.ChangeScale(M, D: Integer; isDpiChange: Boolean);
begin
  FPen.Width := MulDiv(FPen.Width, M, D);
  inherited;
end;

procedure TDirect2DShape.SetBrush(Value: TBrush);
begin
  FBrush.Assign(Value);
end;

procedure TDirect2DShape.SetPen(Value: TPen);
begin
  FPen.Assign(Value);
end;

procedure TDirect2DShape.SetShape(Value: TShapeType);
begin
  if FShape <> Value then
  begin
    FShape := Value;
    Invalidate;
  end;
end;

procedure TDirect2DShape.Paint;
var
  X, Y, W, H, S: Integer;
begin
  FD2DCanvas := TDirect2DCanvas.Create(Canvas, ClientRect);
  try
    with FD2DCanvas do
    begin
      RenderTarget.SetAntialiasMode(D2D1_ANTIALIAS_MODE_PER_PRIMITIVE);
      RenderTarget.SetTransform(TD2DMatrix3x2F.Identity);
      RenderTarget.BeginDraw;

      Pen.Assign(FPen);
      Brush.Assign(FBrush);

      X := Pen.Width div 2;
      Y := X;
      W := Width - Pen.Width + 1;
      H := Height - Pen.Width + 1;

      if Pen.Width = 0 then
      begin
        Dec(W);
        Dec(H);
      end;
      if W < H then S := W else S := H;

      if FShape in [stSquare, stRoundSquare, stCircle] then
      begin
        Inc(X, (W - S) div 2);
        Inc(Y, (H - S) div 2);
        W := S;
        H := S;
      end;

      case FShape of
        stRectangle, stSquare:
          Rectangle(X, Y, X + W, Y + H);
        stRoundRect, stRoundSquare:
          RoundRect(X, Y, X + W, Y + H, S div 4, S div 4);
        stCircle, stEllipse:
          Ellipse(X, Y, X + W, Y + H);
      end;
    end;
  finally
    FD2DCanvas.RenderTarget.EndDraw;
    FreeAndNil(FD2DCanvas);
  end;
end;

procedure TDirect2DShape.StyleChanged(Sender: TObject);
begin
  Invalidate;
end;

end.
