unit ControllerUnit;

interface

uses
  Test1Unit,
  TestsUnit,
  FMX.Controls,
  FMX.Forms,
  MenuUnit,
  MainUnit,
  System.Generics.Collections,
  ControllersUnit;

type
  Controller = class(TInterfacedObject, Controllers)
  private
    /// <link>aggregation</link>
    Test: Tests;
    Menu1: Main;
    Panel1: TPanel;
  public
    procedure setTest(caption: string);
    function getMenu: TList<string>;
    constructor create(AOwner: TForm);
    function getQuest: TList<string>;
    function getAnswer: TList<string>;
    function getCorrect: TDictionary<integer, integer>;
  end;

implementation

constructor Controller.create(AOwner: TForm);
begin
  AOwner.caption := 'Открытая физика';
  Panel1 := TPanel.create(AOwner);
  Panel1.Parent := AOwner;
end;

function Controller.getAnswer: TList<string>;
begin
  result:=TList<string>.create;
  result:=Test.getAnswer;
end;

function Controller.getCorrect: TDictionary<integer, integer>;
begin
  result:=TDictionary<integer, integer>.create;
  result:=Test.getCorrect;
  end;

function Controller.getMenu: TList<string>;
begin
  result := TList<string>.create;
  Menu1 := Menu.create;
  result := Menu1.getMenu;
end;

function Controller.getQuest: TList<string>;
begin
  result:=TList<string>.create;
  result:=Test.getQuest;
end;

procedure Controller.setTest(caption: string);
begin
  Test := Test1.create;
  Test.setTest(caption);
end;

end.
