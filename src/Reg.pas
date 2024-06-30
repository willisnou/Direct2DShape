unit Reg;

interface

uses
  System.Classes,
  Direct2DShape;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Custom', [TDirect2DShape]);
end;

end.
