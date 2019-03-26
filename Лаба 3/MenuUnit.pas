unit MenuUnit;

interface

uses
  ResultTestUnit,
  ResultsUnit,
  AccessAdapterUnit,
  AdaptersUnit,
  System.Generics.Collections {TDictionary} ,
  MainUnit;

type
  Menu = class(TInterfacedObject, Main)
  private
    /// <link>aggregation</link>
    result1: Results;
    /// <link>aggregation</link>
    Adapter1: Adapters;
    function getMenu(FileName: string): TList<string>;
  public
    function getFIO: string;
    procedure FIO(FIO: string);
  end;

implementation

{ Menu }

procedure Menu.FIO(FIO: string);
begin
  result1:=ResultTest.Create;
  result1.FIO(FIO);
end;

function Menu.getFIO: string;
begin
  result:=result1.getFIO;
end;

function Menu.getMenu(FileName: string): TList<string>;
begin
  result := TList<string>.create;
  Adapter1 := AccessAdapter.create(FileName);
  result := Adapter1.getMenu;
end;

end.
