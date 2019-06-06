unit TestsUnit;

interface

uses
  System.Generics.Collections {TDictionary};

type
  Tests = interface
    procedure saveResult(answerCaption, questCaption:string; checked:boolean);
    function getFIO: string;
    procedure FIO(FIO: string);
    function start: boolean;
    function getQuestCaption: string;
    procedure setTest(caption: string);
    function getListAnswer: TList<string>;
    function resultListAnswer: TList<string>;
    function resultListQuest: TList<string>;
  end;

implementation

end.
