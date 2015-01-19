unit Unit9;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls;

type

  { TForm9 }
  gataarray = array of string;
  TForm9 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Label1: TLabel;
    Shape14: TShape;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    Function  ParseX(S: string): gataarray;
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form9: TForm9;

implementation

uses Unit1 , Unit7 ;

{$R *.lfm}

{ TForm9 }


Function TForm9.ParseX(S: string): gataarray;
var
 n, i: Integer;
begin
 Trim(S);
 i := 0;
 repeat
   SetLength(Result, i+1);
   n := Pos( #13 , S);
   if (n = 0) then
     Result[i] := S
   else
     Result[i] :=trim( Copy(S, 1, n-1));
   Delete(S, 1, n);
   Inc(i);
 until (n = 0);

end;
procedure TForm9.FormPaint(Sender: TObject);
begin
 // label1.caption:= form1.label18.Caption;

   label1.caption:= form1.reflabel;


end;

procedure TForm9.Button1Click(Sender: TObject);
var   kek : array  of String ;
begin
  kek := ParseX(Form1.reflabel);

  if (form1.tipusa=1) then
  begin
      Form7.FormShow(sender);
      form7.tli:=   strtofloat(kek[1]);
      Form7.Button16Click(sender);        //+
      Form7.thi:=   strtofloat(kek[3])-1;
      Form7.Button23Click(sender);
      form7.Label3.Caption:=form1.refcsat;
      Form7.Button15Click(sender);
  end;
    if (form1.tipusa=2) then
  begin
      Form7.FormShow(sender);
      form7.rli:=   strtofloat(kek[1]);
      Form7.Button25Click(sender);        //+
      Form7.rhi:=   strtofloat(kek[3])-1;
      Form7.Button27Click(sender);
      form7.Label3.Caption:=form1.refcsat;
      Form7.Button15Click(sender);
  end;
end;

procedure TForm9.Button2Click(Sender: TObject);
var   kek : array  of String ;
begin
  kek := ParseX(Form1.reflabel);
  if (form1.tipusa=1) then
  begin
      Form7.FormShow(sender);
      form7.tli:=   strtofloat(kek[1]);
      Form7.Button20Click(sender);      //-
      Form7.thi:=   strtofloat(kek[3])-1;
      Form7.Button23Click(sender);
      form7.Label3.Caption:=form1.refcsat;
      Form7.Button15Click(sender);
  end;
       if (form1.tipusa=2) then
  begin
      Form7.FormShow(sender);
      form7.rli:=   strtofloat(kek[1]);
      Form7.Button26Click(sender);        //+
      Form7.rhi:=   strtofloat(kek[3])-1;
      Form7.Button27Click(sender);
      form7.Label3.Caption:=form1.refcsat;
      Form7.Button15Click(sender);
  end;



end;

procedure TForm9.Button3Click(Sender: TObject);
var   kek : array  of String ;
begin
 kek := ParseX(Form1.reflabel);
  if (form1.tipusa=1) then
  begin
      Form7.FormShow(sender);
      form7.thi:=   strtofloat(kek[3]);
      Form7.Button23Click(sender);        //+
      Form7.tli:=   strtofloat(kek[1])-1;
      Form7.Button16Click(sender);
      form7.Label3.Caption:=form1.refcsat;
      Form7.Button15Click(sender);
  end;
  if (form1.tipusa=2) then
  begin
      Form7.FormShow(sender);
      form7.rhi:=   strtofloat(kek[3]);
      Form7.Button27Click(sender);        //+
      Form7.rli:=   strtofloat(kek[1])-1;
      Form7.Button25Click(sender);
      form7.Label3.Caption:=form1.refcsat;
      Form7.Button15Click(sender);
  end;
end;

procedure TForm9.Button4Click(Sender: TObject);
var   kek : array  of String ;
begin
 kek := ParseX(Form1.reflabel);
        Form7.FormShow(sender);
  if (form1.tipusa=1) then
  begin
      //Form7.FormShow(sender);
      form7.thi:=   strtofloat(kek[3]);
      Form7.Button24Click(sender);
      Form7.tli:=   strtofloat(kek[1])-1;
      Form7.Button16Click(sender);
      form7.Label3.Caption:=form1.refcsat;
      Form7.Button15Click(sender);
  end;
    if (form1.tipusa=2) then
  begin
      //Form7.FormShow(sender);
      form7.rhi:=   strtofloat(kek[3]);
      Form7.Button28Click(sender);        //+
      Form7.rli:=   strtofloat(kek[1])-1;
      Form7.Button25Click(sender);
      form7.Label3.Caption:=form1.refcsat;
      Form7.Button15Click(sender);
  end;
end;

procedure TForm9.Button5Click(Sender: TObject);
begin
  form9.close;
end;


end.

