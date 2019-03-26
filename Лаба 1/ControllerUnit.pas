unit ControllerUnit;

interface

uses
  FMX.Controls,
  FMX.Forms,
  ControllersUnit;

type
  Controller = class(TInterfacedObject, Controllers)
  private
  Panel1:TPanel;
  public
    constructor create(AOwner: TForm);
  end;

implementation

constructor Controller.create(AOwner: TForm);
begin
  AOwner.Caption := 'Открытая физика';
  panel1 := TPanel.create(AOwner);
  panel1.Parent := AOwner;
end;

end.
