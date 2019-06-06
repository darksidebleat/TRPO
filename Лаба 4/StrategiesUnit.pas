unit StrategiesUnit;

interface

uses
  System.Generics.Collections;

type
  Strategies = interface
    function Answer(resultAnswerTrue: TList<string>;
      resultAnswerFalse:TList<string>):TList<string>;
  end;

implementation

end.
