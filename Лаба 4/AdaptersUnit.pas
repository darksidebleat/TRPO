unit AdaptersUnit;

interface

uses
  System.Generics.Collections {TDictionary};

type
  adapters = interface
    function getMenu: TList<string>;
    procedure setTest(caption: string);
    function getQuest: TList<string>;
    function getAnswerFalse: TDictionary<string, integer>;
    function getAnswerTrue: TDictionary<string, integer>;
  end;

implementation

end.
