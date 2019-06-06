program Project1;

uses
  FMX.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  ControllersUnit in 'ControllersUnit.pas',
  PhisicsControllerUnit in 'PhisicsControllerUnit.pas',
  MenuUnit in 'MenuUnit.pas',
  MainUnit in 'MainUnit.pas',
  AdaptersUnit in 'AdaptersUnit.pas',
  AccessAdapterUnit in 'AccessAdapterUnit.pas',
  TestsUnit in 'TestsUnit.pas',
  Test1Unit in 'Test1Unit.pas',
  ResultsUnit in 'ResultsUnit.pas',
  ResultTestUnit in 'ResultTestUnit.pas',
  StrategiesUnit in 'StrategiesUnit.pas',
  OneTrueOneFalseUnit in 'OneTrueOneFalseUnit.pas';

{$R *.res}

begin
  Application.Initialize;
  Form1:=TForm1.Create(Application);
  Form1.UpdateStyle;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
