unit Unit4;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Buttons,  INIFiles ;
  //, LCLMessageGlue   virtual klaviatura
type

  { TForm4 }

  TForm4 = class(TForm)
    Button1: TButton;
    Button10: TButton;
    Button12: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    saveBtn: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    clearBtn: TButton;
    cancBtn: TButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure Button10Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure cancBtnClick(Sender: TObject);
    procedure clearBtnClick(Sender: TObject);

    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    Function Login ():boolean;
    procedure saveBtnClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  var    selectedch: string;
  end;

var
  Form4: TForm4;
   LGin: string;
   LHcount , k : integer;
   IniFile  : TIniFile;

implementation

uses unit1;
{$R *.lfm}

{ TForm4 }
Function TForm4.Login ():boolean;
var vv : extended ;

 begin
   if ( TryStrToFloat(LGin , vv)  or (LGin='')  ) then
 begin
    if (vv > 3.5) then
    LGin := '';

    if(LHcount=1) then
    Label1.Caption := LGin  ;

    if(LHcount=2) then
    Label2.Caption := LGin  ;



 end
 else
 LGin:='';

  result:=true;


end;

procedure TForm4.saveBtnClick(Sender: TObject);
begin
    IniFile:=TINIFile.Create(Form1.Inf_);
    IniFile.writeString('HOST','LIMIT_ch_0_low',  (Label1.Caption ));
    IniFile.writeString('HOST','LIMIT_ch_0_high', (Label2.Caption ));



    sleep(1000);
    Form4.close;
end;

procedure TForm4.SpeedButton1Click(Sender: TObject);
begin
  LGin:= label1.caption;   LHcount:=1;
end;

procedure TForm4.SpeedButton2Click(Sender: TObject);
begin
      LGin:= label2.caption;    LHcount:=2;
end;


procedure TForm4.Button1Click(Sender: TObject);
begin
      LGin:=LGin+'1';   Login();
end;

procedure TForm4.Button2Click(Sender: TObject);
begin
         LGin:=LGin+'2';   Login();
end;

procedure TForm4.Button3Click(Sender: TObject);
begin
  LGin:=LGin+'3';   Login();
end;

procedure TForm4.Button4Click(Sender: TObject);
begin
  LGin:=LGin+'4';   Login();
end;

procedure TForm4.Button5Click(Sender: TObject);
begin
  LGin:=LGin+'5';   Login();
end;

procedure TForm4.Button6Click(Sender: TObject);
begin
  LGin:=LGin+'6';   Login();
end;

procedure TForm4.Button7Click(Sender: TObject);
begin
  LGin:=LGin+'7';   Login();
end;

procedure TForm4.Button8Click(Sender: TObject);
begin
  LGin:=LGin+'8';   Login();
end;

procedure TForm4.Button9Click(Sender: TObject);
begin
  LGin:=LGin+'9';   Login();
end;

procedure TForm4.cancBtnClick(Sender: TObject);
begin
  form4.close
end;


procedure TForm4.clearBtnClick(Sender: TObject);
begin
  LGin:='' ;  Login();  ;
end;



procedure TForm4.FormCreate(Sender: TObject);
begin
    IniFile:=TINIFile.Create(Form1.inF_);

  DefaultFormatSettings.DecimalSeparator := ',';
  Label1.Caption := (  IniFile.ReadString('HOST','LIMIT_ch_0_low',''));
  Label2.Caption := (  IniFile.ReadString('HOST','LIMIT_ch_0_high',''));

  //updown1.min:=10;
   {
  ComboBox1.Items.Add('none');
    ComboBox1.Items.Add('Ch1');
     ComboBox1.Items.Add('Ch2');
      ComboBox1.Items.Add('Ch3');
       ComboBox1.Items.Add('Ch4');
        ComboBox1.Items.Add('Ch5');
     ComboBox1.Items.Add('Ch6');
      ComboBox1.Items.Add('Ch7');
       ComboBox1.Items.Add('Ch8');

    ComboBox1.Items.Add('Ch9');
     ComboBox1.Items.Add('Ch10');
      ComboBox1.Items.Add('Ch11');
       ComboBox1.Items.Add('Ch12');
        ComboBox1.Items.Add('Ch13');
     ComboBox1.Items.Add('Ch14');
      ComboBox1.Items.Add('Ch15');
       ComboBox1.Items.Add('Ch16');

       ComboBox1.ItemIndex :=1;
       }


end;

procedure TForm4.FormPaint(Sender: TObject);
var s: extended;
begin
  form4.Color:=clScrollBar;
    Label4.Caption:=form1.varch;
         case form1.varch of
              'Ch1'  :  s   := form1.f_array[ 1] ;
              'Ch2'  :  s   := form1.f_array[ 2] ;
              'Ch3'  :  s   := form1.f_array[ 3] ;
              'Ch4'  :  s   := form1.f_array[ 4] ;
              'Ch5'  :  s   := form1.f_array[ 5] ;
              'Ch6'  :  s   := form1.f_array[ 6] ;
              'Ch7'  :  s   := form1.f_array[ 7] ;
              'Ch8'  :  s   := form1.f_array[ 8] ;
              'Ch9'  :  s   := form1.f_array[ 9] ;
              'Ch10' :  s   := form1.f_array[10] ;
              'Ch11' :  s   := form1.f_array[11] ;
              'Ch12' :  s   := form1.f_array[12] ;
              'Ch13' :  s   := form1.f_array[13] ;
              'Ch14' :  s   := form1.f_array[14] ;
              'Ch15' :  s   := form1.f_array[15] ;
              'Ch16' :  s   := form1.f_array[16] ;
         end;
         label6.Caption:=floattostr(s);

end;


procedure TForm4.Button12Click(Sender: TObject);
begin
     LGin:=LGin+',';   Login();
end;

procedure TForm4.Button10Click(Sender: TObject);
begin
  LGin:=LGin+'0';   Login();
end;

end.

