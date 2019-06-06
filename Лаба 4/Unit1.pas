unit Unit1;

interface

uses
  System.Generics.Collections {TDictionary} ,
  PhisicsControllerUnit {PhisicsController} ,
  ControllersUnit {Controllers} ,
  System.SysUtils, System.Types, System.UITypes, System.Rtti, System.Classes,
  System.Variants, FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.Menus, FMX.Edit;

type
  TForm1 = class(TForm)
    OpenDialog1: TOpenDialog;
    MainMenu1: TMainMenu;
    Файл: TMenuItem;
    MenuItem1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
  private
    AnswerQuest: TList<TLabel>;
    ResultQuest:Tlist<Tlabel>;
    NextButton:TButton;
    //CheckBox1: TCheckBox;
    Edit1: TEdit;
    Button1: TButton;
    FileName: string;
    Buttons: TList<TButton>;
    list: TList<string>;
    listAnswer: TList<string>;
    CheckBoxsAnswer: TList<TCheckBox>;
    /// <link>aggregation</link>
    Controller1: Controllers;
    procedure createResultAnswerAndUserCheckAndTrue(Answer:string; i:integer);
    procedure createResultQuest(Quest:string; i:integer);
    procedure createResult;
    procedure start(Sender: TObject);
    procedure startButton;
    procedure destroyStartButton;
    procedure startQuest;
    procedure open;
    procedure createListAnswer;
    procedure createQuestCaption;
    procedure getQuest(Sender: TObject);
    procedure destroyButtons;
    procedure createButtons(list: TList<string>);
    procedure createNextAnswer;
    procedure destroyCheckBoxsAnswer;  //CheckBox1: TCheckBox;
    procedure createCheckBoxsAnswer(list: TList<string>);     // CheckBox1: CheckBox;
  public
    procedure onButtonClick1(Sender: TObject);
    procedure onButtonAnswerClick1(Sender: TObject);
    procedure onCheckBoxAnswerClick1(Sender: TObject);
    procedure createNextButton(Sender: TObject);
    procedure destroyNextButton;
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.createButtons(list: TList<string>);
var
  i: integer;
  s: string;
begin
  i := 0;
  Buttons := TList<TButton>.Create;
  self.list := TList<string>.Create;
  self.list := list;
  for s in list do
  begin
    Buttons.Add(TButton.Create(self));
    with Buttons.Last do
    begin
      Parent := self;
      Position.Y := i * 41;
      Text := s;
      Width := 300;
      OnClick := onButtonClick1;
    end;
    i := i + 1;
  end;
end;

procedure TForm1.createCheckBoxsAnswer(list: TList<string>);
var i:integer;
s:string;
begin
  i:=0;
  CheckBoxsAnswer:= Tlist<TCheckBox>.Create;
  self.listAnswer:=TList<string>.create;
  self.listAnswer:=list;
  for s in listAnswer do
    begin
      CheckBoxsAnswer.Add(TCheckBox.Create(self));
      with CheckBoxsAnswer.Last do
      begin
        Parent:= self;
        Position.Y:=41+i*41;
        Text:=s;
        Width:=500;
        OnClick:=OnCheckBoxAnswerClick1;  //OnButtonAnswerClick1
      end;
      i:=i+1;
    end;
    if Controller1.start then
      createNextButton(nil);
end;

procedure TForm1.createListAnswer;
begin
  createNextAnswer;
end;

procedure TForm1.createNextAnswer;
begin
  createCheckBoxsAnswer(Controller1.getListAnswer);
end;

procedure TForm1.createNextButton(Sender: TObject);
begin
  if assigned(NextButton) then
    NextButton.Parent:=nil;
  NextButton:=TButton.Create(self);
  with NextButton do
  begin
    Parent:=Self;
    Text:='следующий вопрос';
    Width:=150;
    OnClick:=onButtonAnswerClick1;
  end;
end;

procedure TForm1.createQuestCaption;
begin
  self.Caption := Controller1.getQuestCaption;
end;

procedure TForm1.createResult;
var s1,s2: string;
  i:integer;
begin
  i:=0;j:=0;
  Self.Caption:='Результат - ' + Controller1.getFIO;
  destroyNextButton;
  //ListQuest
  //ListAnswer UserCheck TrueCheck
  resultQuest:=TList<TLabel>.create;
  AnswerQuest:=TList<TLabel>.create;
  for s1 in Controller1.resultListQuest do
  begin
    createResultQuest(s1,i);
    i:=i+1;
  end;
    for s2 in Controller1.resultListAnswer do begin
      createResultAnswerAndUserCheckAndTrue(s2, j);
      j:=j+1;
  end;
end;

procedure TForm1.createResultAnswerAndUserCheckAndTrue(Answer: string;
  i: integer);
begin
  AnswerQuest.add(TLabel.Create(nil));
  with AnswerQuest.Last do begin
    parent:=self;
    position.y:=i*41;
    position.x:=300;
    height:=41;
    width:=300;
    text:=answer;
  end;
end;

procedure TForm1.createResultQuest(Quest: string; i:integer);
var resultQuest1:Tlabel;
begin
  ResultQuest.add(TLabel.Create(nil));
  with ResultQuest.Last do begin
    parent:=self;
    position.y:=i*41;
    height:=41;
    width:=300;
    text:=quest;
  end;
end;

procedure TForm1.destroyButtons;
var
  b: TButton;
begin
  for b in Buttons do
  begin
    b.Parent := nil;
  end;
  Buttons.DeleteRange(0, Buttons.Count - 1);
end;

procedure TForm1.destroyCheckBoxsAnswer;
var
  //b: TButton;
  c: TCheckBox;
begin
  //for b in ButtonsAnswer do
  for c in CheckBoxsAnswer do
  begin
    //b.Parent := nil;
    c.Parent := nil;
  end;
  CheckBoxsAnswer.DeleteRange(0, CheckBoxsAnswer.Count - 1);
end;

procedure TForm1.destroyNextButton;
begin
NextButton.Parent:=nil;
NextButton.Free;
end;

procedure TForm1.destroyStartButton;
begin
  if assigned(Button1) then
  begin
    Button1.Parent:=nil;
    Button1.Free;
  end;
  if assigned(Edit1) then
  begin
    Edit1.Parent:= nil;
    Edit1.Free;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  //open;

end;

procedure TForm1.getQuest(Sender: TObject);
begin
  if Controller1.start then
  begin
    createQuestCaption;
    createListAnswer;
//    Controller1.FIO(Self.Edit1.Text);
  end
  else createResult;
  {begin
    self.Caption:= 'Результат - '+ Controller1.getFIO;
    destroyNextButton;
  end;}
end;

procedure TForm1.MenuItem1Click(Sender: TObject);
begin
  if openDialog1.Execute then
  begin
    FileName:=openDialog1.FileName;
    open;
  end
  else ShowMessage('Open file was cancelled');
end;

procedure TForm1.onButtonAnswerClick1(Sender: TObject);
begin
  destroyCheckBoxsAnswer;
  startQuest;
end;

procedure TForm1.onButtonClick1(Sender: TObject);
begin
  Controller1.setTest((Sender as TButton).Text);
  destroyButtons;
  startButton;
end;

procedure TForm1.onCheckBoxAnswerClick1(Sender: TObject);
begin
  //save CheckBox to result in model
  with (Sender as TCheckBox) do
    Controller1.saveResult(Text, Self.Caption, IsChecked);
end;

procedure TForm1.open;
var list:TList<string>;
begin
  Controller1 := PhisicsController.Create;
  list := TList<string>.Create;
  list := Controller1.getMenu(FileName);
  createButtons(list);
end;

procedure TForm1.start(Sender: TObject);
begin
  Controller1.FIO(Self.Edit1.Text);
  destroyStartButton;
  getQuest(nil);
end;

procedure TForm1.startButton;
var w, h:integer;
begin
  Button1:= TButton.Create(self);
  h:= self.ClientHeight;
  w:= self.ClientWidth;
  with Button1 do
  begin
    Parent:=self;
    Position.Y:=100;
    Position.X:=100;
    Text:='Начать';
    OnCLick:=start;
  end;
  Edit1:= TEdit.Create(Self);
  with Edit1 do
  begin
    Parent:= Self;
    Position.Y:=50;
    Position.X:=50;
    Text:= 'ФИО, №группы';
    Width:=500;
  end;
end;

procedure TForm1.startQuest;
begin
  startButton;
end;

end.
