unit Unit8;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls ;

type

  { TForm8 }

  TForm8 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form8: TForm8;
  enableProgram: boolean;

implementation

uses Unit1 , Unit7 ;

{$R *.lfm}

{ TForm8 }

procedure TForm8.Button1Click(Sender: TObject);
begin
    if  not(enableProgram) then begin
         Button1.Caption:='stop programming pager device';
         enableProgram:= True;
  end
   else     begin

          Button1.Caption:='Program Pager Device';
          enableProgram:= False;
   end;
end;

procedure TForm8.Button2Click(Sender: TObject);
begin
   form1.simplesetup:=true;
   form8.close;
  //form9.showmodal;
end;

procedure TForm8.Button3Click(Sender: TObject);
begin
     form7.showmodal;
     form8.close;
end;

end.

