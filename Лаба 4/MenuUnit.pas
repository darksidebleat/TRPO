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
    Adapter1: Adapters;
  public
    function getMenu(FileName: string): TList<string>;
  end;

implementation

{ Menu }

function Menu.getMenu(FileName: string): TList<string>;
begin
  result := TList<string>.create;
  Adapter1 := AccessAdapter.create(FileName);
  result := Adapter1.getMenu;
end;

end.
