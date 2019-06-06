unit OneTrueOneFalseUnit;

interface

uses StrategiesUnit,
  System.Generics.Collections;

type
  OneTrueOneFalse = class(TInterfacedObject, Strategies)
      function Answer(resultAnswerTrue: TList<string>;
      resultAnswerFalse:TList<string>):TList<string>;
  end;

implementation

{ OneTrueOneFalse }

function OneTrueOneFalse.Answer(resultAnswerTrue, resultAnswerFalse: TList<string>): TList<string>;
var i:integer;
  AnswerTrue:integer;
  AnswerFalse:integer;
begin
  result:=TList<string>.create;
  if resultAnswerTrue.Count = 1 then
    AnswerTrue:=0
  else
    AnswerTrue:=random(resultAnswerTrue.Count);

if resultAnswerFalse.Count = 1 then
    AnswerFalse:=0
  else
    AnswerFalse:=random(resultAnswerFalse.Count);
  i:=random(2);
  if i=0 then
  begin
    result.Add(resultAnswerTrue.Items[AnswerTrue]);
    result.Add(resultAnswerFalse.Items[AnswerFalse]);
  end
  else
  begin
    result.Add(resultAnswerFalse.Items[AnswerFalse]);
    result.Add(resultAnswerTrue.Items[AnswerTrue]);
  end;
end;

end.
