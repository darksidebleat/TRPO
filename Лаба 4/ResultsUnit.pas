unit ResultsUnit;

interface

uses
  System.Generics.Collections;

  type
  Results = interface
    function resultListQuest: TList<string>;
    function getFIO: string;
    procedure FIO(FIO: string);
    procedure addListAnswerQuest(answerCaption:string; questCaption:string);
    procedure createListAnswerQuest;
    function resultListAnswer: TList<string>;
  end;

implementation

end.
