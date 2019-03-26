unit AccessAdapterUnit;

interface

uses
  SysUtils,
  Data.DB,
  Data.Win.ADODB,
  System.Generics.Collections,
  AdaptersUnit;

type
  AccessAdapter = class(TInterfacedObject, Adapters)
  private
    caption: string;
    ADOConnection: TADOConnection;
  public
    function getMenu: TList<string>;
    procedure setTest(caption: string);
    function getQuest: TList<string>;
    function getAnswer: TList<string>;
    function getCorrect: TDictionary<integer, integer>;
  published
    constructor create;
  end;

implementation

{ AccessAdapter }

constructor AccessAdapter.create;
begin
  ADOConnection := TADOConnection.create(nil);
  with (ADOConnection) do
  begin
    Provider := 'Microsoft.ACE.OLEDB.12.0';
    Mode := cmShareDenyNone;
    LoginPrompt := False;
    ConnectionString := 'Provider=Microsoft.ACE.OLEDB.12.0;' +
      'Data Source=Phisics.accdb;' + 'Persist Security Info=False';
    Connected := true;
  end;
end;

function AccessAdapter.getAnswer: TList<string>;
var
  ADOQuery: TADOQuery;
  answer: string;
begin
  result := TList<string>.create;
  ADOQuery := TADOQuery.create(nil);
  with (ADOQuery) do
  begin
    Connection := ADOConnection;
    Close;
    SQL.Clear;
    SQL.Add('SELECT answer FROM Main WHERE caption="' + Self.caption + '";');
    Open;
    Active := true;
  end;
  ADOQuery.First;
  answer := ADOQuery.FieldByName('answer').AsString;
  with (ADOQuery) do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT caption FROM ' + answer + ';');
    Open;
    Active := true;
  end;
  while not ADOQuery.Eof do
  begin
    result.Add(ADOQuery.FieldByName('caption').AsString);
    ADOQuery.Next;
  end;
  ADOQuery.Free;
end;

function AccessAdapter.getCorrect: TDictionary<integer, integer>;
var
  ADOQuery: TADOQuery;
  correct: string;
begin
  result := TDictionary<integer, integer>.create;
  ADOQuery := TADOQuery.create(nil);
  with (ADOQuery) do
  begin
    Connection := ADOConnection;
    Close;
    SQL.Clear;
    SQL.Add('SELECT correct FROM Main WHERE caption="' + Self.caption + '";');
    Open;
    Active := true;
  end;
  ADOQuery.First;
  correct := ADOQuery.FieldByName('correct').AsString;
  with (ADOQuery) do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT quest_id, answer_id FROM ' + correct + ';');
    Open;
    Active := true;
  end;
  while not ADOQuery.Eof do
  begin
    result.Add(StrToInt(ADOQuery.FieldByName('quest_id').AsString),
      StrToInt(ADOQuery.FieldByName('answer_id').AsString));
    ADOQuery.Next;
  end;
  ADOQuery.Free;
end;

function AccessAdapter.getMenu: TList<string>;
var
  ADOQuery: TADOQuery;
  DataSource: TDataSource;
begin
  result := TList<string>.create;
  ADOQuery := TADOQuery.create(nil);
  with (ADOQuery) do
  begin
    Connection := ADOConnection;
    Close;
    SQL.Clear;
    SQL.Add('SELECT caption FROM Main;');
    Open;
    Active := true;
  end;
  ADOQuery.First;
  while not ADOQuery.Eof do
  begin
    result.Add(ADOQuery.FieldByName('caption').AsString);
    ADOQuery.Next;
  end;
  ADOQuery.Free;
end;

function AccessAdapter.getQuest: TList<string>;
var
  ADOQuery: TADOQuery;
  quest: string;
begin
  result := TList<string>.create;
  ADOQuery := TADOQuery.create(nil);
  with (ADOQuery) do
  begin
    Connection := ADOConnection;
    Close;
    SQL.Clear;
    SQL.Add('SELECT quest FROM Main WHERE caption="' + Self.caption + '";');
    Open;
    Active := true;
  end;
  ADOQuery.First;
  quest := ADOQuery.FieldByName('quest').AsString;
  with (ADOQuery) do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT caption FROM ' + quest + ';');
    Open;
    Active := true;
  end;
  while not ADOQuery.Eof do
  begin
    result.Add(ADOQuery.FieldByName('caption').AsString);
    ADOQuery.Next;
  end;
  ADOQuery.Free;
end;

procedure AccessAdapter.setTest(caption: string);
begin
  Self.caption := caption;
end;

end.
