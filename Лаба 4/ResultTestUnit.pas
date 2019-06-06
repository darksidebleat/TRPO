unit ResultTestUnit;

interface

uses
  System.Generics.Collections,
  AdaptersUnit,
  ResultsUnit;

type
  ResultTest = class(TInterfacedObject, Results)
  private
    fio1: string;
    listAnswerQuest: TDictionary<string, string>;
  public
    function resultListQuest:TList<string>;
    function resultListAnswer: TList<string>;
    procedure addListAnswerQuest(answerCaption:string; questCaption:string);
    procedure createListAnswerQuest;
    function getFIO: string;
    procedure FIO(FIO: string);
  end;

implementation

{ ResultTest }

procedure ResultTest.addListAnswerQuest(answerCaption, questCaption: string);
begin

end;

procedure ResultTest.createListAnswerQuest;
begin
  listAnswerQuest:=TDictionary<string, string>.create;
end;

procedure ResultTest.FIO(FIO: string);
begin
  self.fio1:= FIO;
end;

function ResultTest.getFIO: string;
begin
   result:=self.fio1;
end;

function ResultTest.resultListAnswer: TList<string>;
var s:string;
begin
  result:=TList<string>.create;
  for s in  listAnswerQuest.Keys do
    result.Add(s);
end;

function ResultTest.resultListQuest: TList<string>;
var s:string;
begin
  result:=TList<string>.create;
  for s in listAnswerQuest.Values do
    result.Add(s);
end;

end.
