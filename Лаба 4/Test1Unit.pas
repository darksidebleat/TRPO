unit Test1Unit;

interface

uses
  OneTrueOneFalseUnit,
  StrategiesUnit,
  Resultsunit,
  Resulttestunit,
  AccessAdapterUnit,
  TestsUnit,
  System.Generics.Collections {TDictionary} ,
  AdaptersUnit;

type
  Test1 = class(TInterfacedObject, Tests)
  private
    /// <link>aggregation</link>
    Strategy: Strategies;
    countQuest: integer;
    /// <link>aggregation</link>
    Adapter: Adapters;
    Quest: TList<string>;
    AnswerTrue: TDictionary<string, integer>;
    AnswerFalse: TDictionary<string, integer>;
    /// <link>aggregation</link>
    result1: Results;
    function NextQuest: string;
    function NextAnswer: TList<string>;
  public
    procedure saveResult(answerCaption, questCaption:string; checked:boolean);
    procedure setTest(caption: string);
    function getQuestCaption: string;
    function getListAnswer: TList<string>;
    function start: boolean;
    function getFIO: string;
    function resultListQuest:Tlist<string>;
    procedure FIO(FIO: string);
  published
    constructor create(FileName: string);
  end;

implementation

{ Test1 }

constructor Test1.create(FileName: string);
begin
  Adapter := AccessAdapter.create(FileName);
  result1:=ResultTest.Create;
  result1.createListAnswerQuest;
end;

function Test1.getListAnswer: TList<string>;
begin
  result:=TList<string>.create;
  result:=result1.resultListAnswer;
end;

function Test1.getQuestCaption: string;
begin
  result := NextQuest;
end;

function Test1.NextAnswer: TList<string>;
var
  key:string;
  value:integer;
  resultAnswerTrue:TList<string>;
  resultAnswerFalse:TList<string>;
begin
  result:=TList<string>.create;
  resultAnswerTrue:=TList<string>.create;
  for key in AnswerTrue.Keys do begin
    if AnswerTrue.Items[key] = countQuest then
    resultAnswerTrue.Add(key);
  end;
  resultAnswerFalse:=TList<string>.create;
  for key in  AnswerFalse.Keys do begin
    if AnswerFalse.Items[key]=countQuest then
    resultAnswerFalse.Add(key);
  end;
  Strategy:=OneTrueOneFalse.create;
  result:=Strategy.Answer(resultAnswerTrue, resultAnswerFalse);
end;

function Test1.NextQuest: string;
begin
  result := Quest.Items[countQuest];
  countQuest := countQuest - 1;
end;

function Test1.resultListQuest: Tlist<string>;
begin

end;

procedure Test1.saveResult(answerCaption, questCaption: string;
  checked: boolean);
begin
  //result1.
end;

procedure Test1.setTest(caption: string);
begin
  Adapter.setTest(caption);
  Quest := Adapter.getQuest;
  AnswerTrue := Adapter.getAnswerTrue;
  AnswerFalse := Adapter.getAnswerFalse;
  countQuest:=0;
end;

function Test1.start: boolean;
begin
  if Quest.Count=countQuest then
    result:=false
  else
    result:= true;
end;

procedure Test1.FIO(FIO: string);
begin
  result1.FIO(FIO);
end;

function Test1.getFIO: string;
begin
  result:=result1.getFIO;
end;

end.
