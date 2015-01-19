unit Unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, Buttons ;

type

  { TForm2 }

  TForm2 = class(TForm)
    Button1: TButton;
    Button9: TButton;
    Button8: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button6: TButton;
    Button7: TButton;
    clearBtn: TButton;
    Button10: TButton;
    Btn1: TButton;
    Button5: TButton;
    cancelBtn1: TButton;
    Label1: TLabel;
    Panel1: TPanel;

    procedure Btn1Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure cancelBtn1Click(Sender: TObject);
    procedure clearBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    Function  Login ():boolean;

  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form2: TForm2;
  LGin  : string;
  LHcount: integer;
  backgroundImage : TBitmap;
implementation

{$R *.lfm}

{ TForm2 }
  uses unit1 , unit7;

Function TForm2.Login ():boolean;
begin
    if (LHcount>2) then
    begin
         showmessage('Too much attempt !!!. Reboot');
    end;
 //  if ( (Length(LGin)=4)  and ( (LGin<>'1111') or (LGin<>'5358') or (LGin<>'7118')) ) then
 if ( (Length(LGin)=4)  and not( (LGin='1111') or (LGin='5358') or (LGin='7118')) ) then
 begin
        LHcount:=LHcount+1;
        Label1.Caption:='No!!';
        clearBtn.visible:=true;
   end;
  if ( (LGin='1111') or (LGin='5358') or (LGin='7118') ) then
  begin

           Form7.ShowModal;
           form2.Close;
           LGin:='';
           result:=true;


     end;
  end;


procedure TForm2.Btn1Click(Sender: TObject);
begin
     LGin:=LGin+'1';   Login();
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
     LGin:=LGin+'3';   Login();
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
     LGin:=LGin+'2';   Login();
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
    LGin:=LGin+'3';   Login();
end;

procedure TForm2.Button4Click(Sender: TObject);
begin
    LGin:=LGin+'4';   Login();
end;

procedure TForm2.Button5Click(Sender: TObject);
begin
    LGin:=LGin+'5';   Login();
end;

procedure TForm2.Button6Click(Sender: TObject);
begin
    LGin:=LGin+'6';   Login();
end;

procedure TForm2.Button7Click(Sender: TObject);
begin
    LGin:=LGin+'7';   Login();
end;

procedure TForm2.Button8Click(Sender: TObject);
begin
    LGin:=LGin+'8';   Login();
end;

procedure TForm2.Button9Click(Sender: TObject);
begin
    LGin:=LGin+'9';   Login();
end;

procedure TForm2.cancelBtn1Click(Sender: TObject);
begin
  form2.Close;
end;



procedure TForm2.clearBtnClick(Sender: TObject);
begin
  LGin:='';
  Label1.caption:='Enter Your PIN :';
  clearBtn.visible:=false;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
    //backgroundImage := TBitmap.Create;
    //backgroundImage.LoadFromFile(ExtractFilePath(Application.ExeName)+'background.bmp');
    clearBtn.visible:=false;
    Label1.caption:='Enter Your PIN :';
end;

procedure TForm2.FormDestroy(Sender: TObject);
begin
  backgroundImage.Free;
end;

procedure TForm2.FormPaint(Sender: TObject);
begin
  Canvas.Draw( 0, 0, backgroundImage );
end;

procedure TForm2.Label1Click(Sender: TObject);
begin
   clearBtn.visible:=true;
   LGin:='';
  Label1.caption:='Enter Your PIN :';
  LHcount:=0;
end;

procedure TForm2.Button10Click(Sender: TObject);
begin
  LGin:=LGin+'0';   Login();
end;

end.

