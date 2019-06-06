unit ControllersUnit;

interface

uses
  System.Generics.Collections {TDictionary};

type
  Controllers = interface
    procedure saveResult(answerCaption, questCaption:string; checked:boolean);
    procedure FIO(fio: string);
    procedure setTest(caption: string);
    function resultListAnswer:Tlist<string>;
    function getFIO: string;
    function start: boolean;
    function getMenu(FileName: string): TList<string>;
    function getQuestCaption: string;
    function getListAnswer: TList<string>;
    function resultListQuest: TList<string>;
  end;

implementation

end.
