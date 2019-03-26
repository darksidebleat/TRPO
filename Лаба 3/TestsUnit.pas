unit TestsUnit;

interface

uses
  System.Generics.Collections {TDictionary};

type
  Tests = interface
    function start: boolean;
    function getQuestCaption: string;
    procedure setTest(caption: string);
    function getListAnswer: TList<string>;
  end;

implementation

end.
