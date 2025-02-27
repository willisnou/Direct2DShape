unit Direct2DShape;

interface

uses
  System.Classes,
  System.SysUtils,
  System.Math,
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
    FShowCaption: Boolean;
    FFont: TFont;
    FCaption: String;
    FRadius: Word;

    procedure SetBrush(Value: TBrush);
    procedure SetPen(Value: TPen);
    procedure SetShape(Value: TShapeType);
    procedure SetShowCaption(const Value: Boolean);
    procedure SetFont(const Value: TFont);
    procedure SetCaption(const Value: String);
    procedure SetRadius(const Value: Word);

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
    property ShowCaption: Boolean read FShowCaption write SetShowCaption default False;
    property Font: TFont read FFont write SetFont;
    property Caption: String read FCaption write SetCaption;
    property Radius: Word read FRadius write SetRadius default 8;

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
  ShowCaption:= False;
  FFont:= TFont.Create;
  Radius:= 8;
end;

destructor TDirect2DShape.Destroy;
begin
  FPen.Free;
  FBrush.Free;
  FFont.Free;
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
  X, Y, W, H, S, LRadius: Integer;
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

      LRadius:= ifthen(FRadius <= 0, S div 4, FRadius);

      case FShape of
        stRectangle, stSquare:
          Rectangle(X, Y, X + W, Y + H);
        stRoundRect, stRoundSquare:
          RoundRect(X, Y, X + W, Y + H, LRadius, LRadius);
        stCircle, stEllipse:
          Ellipse(X, Y, X + W, Y + H);
      end;

      if FShowCaption then
      begin
        FD2DCanvas.Font.Assign(FFont);
        FD2DCanvas.TextOut((Width - FD2DCanvas.TextWidth(FCaption)) div 2, (Height - FD2DCanvas.TextHeight(FCaption)) div 2, FCaption);
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

procedure TDirect2DShape.SetShowCaption(const Value: Boolean);
begin
  if Value <> FShowCaption then
  begin
    FShowCaption := Value;
    Invalidate;
  end;
end;

procedure TDirect2DShape.SetFont(const Value: TFont);
begin
  FFont.Assign(Value);
  Invalidate;
end;

procedure TDirect2DShape.SetCaption(const Value: String);
begin
  if Value.Equals(FCaption) then
    Exit;
  FCaption:= Value;
  if FShowCaption then
    Invalidate;
end;

procedure TDirect2DShape.SetRadius(const Value: Word);
begin
  if Value <> FRadius then
  begin
    FRadius := Value;
    Invalidate;
  end;
end;

end.
