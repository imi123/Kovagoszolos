program project1;

{$mode objfpc}{$H+}

uses

  Interfaces, // this includes the LCL widgetset
  Forms,  unit1, unit2, Unit5, unit7, Unit9;

{$R *.res}

begin
  RequireDerivedFormResource := True;
  Application.Initialize;
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm7, Form7);
  Application.CreateForm(TForm9, Form9);
//   Application.CreateForm(TFormInfo, FormInfo);
  Application.Run;
end.

