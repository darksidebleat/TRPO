unit ResultTestUnit;

interface

uses AdaptersUnit, ResultsUnit;

type
  ResultTest = class(TInterfacedObject, Results)
  private
    fio1: string;
    /// <link>aggregation</link>
    Adpater1: adapters;
  public
    function getFIO: string;
    procedure FIO(FIO: string);
  end;

implementation

{ ResultTest }

procedure ResultTest.FIO(FIO: string);
begin
  self.fio1:= FIO;
end;

function ResultTest.getFIO: string;
begin
   result:=self.fio1;
end;

end.
