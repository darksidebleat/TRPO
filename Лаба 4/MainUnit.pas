unit MainUnit;

interface

uses
  System.Generics.Collections {TDictionary};

type
  Main = interface
    function getMenu(FileName: string): Tlist<string>;
  end;

implementation

end.
