unit MainUnit;

interface

uses
  System.Generics.Collections {TDictionary};

type
  Main = interface
    function getFIO: string;
    procedure FIO(FIO: string);
    function getMenu(FileName: string): Tlist<string>;
  end;

implementation

end.
