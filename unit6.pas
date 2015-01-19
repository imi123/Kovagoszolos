unit Unit6;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, mysql55conn, FileUtil, Forms, Controls, Graphics,
  Dialogs, StdCtrls, ActnList;

type

  { TForm6 }

  TForm6 = class(TForm)
    Button1: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    Button17: TButton;
    Button18: TButton;
    Button19: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    MySQL55Connection1: TMySQL55Connection;
    ScrollBar1: TScrollBar;
    SQLQuery1: TSQLQuery;
    SQLQuery2: TSQLQuery;
    SQLTransaction1: TSQLTransaction;
    SQLTransaction2: TSQLTransaction;
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure Button19Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);

    procedure FormPaint(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    Function  Login ():boolean;
    procedure ScrollBar1Change(Sender: TObject);
    Function  showlabels ():boolean;
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form6: TForm6;
  listb: Tstringlist;
  chp: integer;     LGin: string;  LHcount , k : integer;
  pset_array:array[1..34] of extended;
  //listlimits: tstringlist;
  l2 : integer;
implementation

uses unit1;
{$R *.lfm}

{ TForm6 }

Function TForm6.Login ():boolean;
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


    //Form1.Limitch0low:= vv ;
 end
 else
 LGin:='';

  result:=true;


end;

procedure TForm6.ScrollBar1Change(Sender: TObject);
begin
 label6.Caption := inttostr(scrollbar1.Position);
end;


 Function TForm6.showlabels ():boolean;
 var s,d ,f  : extended;
  begin
   case Label3.Caption  of
              'Ch1'  :  s   := pset_array[ 1] ;
              'Ch2'  :  s   := pset_array[ 3] ;
              'Ch3'  :  s   := pset_array[ 5] ;
              'Ch4'  :  s   := pset_array[ 7] ;
              'Ch5'  :  s   := pset_array[ 9] ;
              'Ch6'  :  s   := pset_array[11] ;
              'Ch7'  :  s   := pset_array[13] ;
              'Ch8'  :  s   := pset_array[15] ;
              'Ch9'  :  s   := pset_array[17] ;
              'Ch10' :  s   := pset_array[19] ;
              'Ch11' :  s   := pset_array[21] ;
              'Ch12' :  s   := pset_array[23] ;
              'Ch13' :  s   := pset_array[25] ;
              'Ch14' :  s   := pset_array[27] ;
              'Ch15' :  s   := pset_array[29] ;
              'Ch16' :  s   := pset_array[31] ;
         end;
            case Label3.Caption  of
              'Ch1'  :  d   := pset_array[ 2] ;
              'Ch2'  :  d   := pset_array[ 4] ;
              'Ch3'  :  d   := pset_array[ 6] ;
              'Ch4'  :  d   := pset_array[ 8] ;
              'Ch5'  :  d   := pset_array[10] ;
              'Ch6'  :  d   := pset_array[12] ;
              'Ch7'  :  d   := pset_array[14] ;
              'Ch8'  :  d   := pset_array[16] ;
              'Ch9'  :  d   := pset_array[18] ;
              'Ch10' :  d   := pset_array[20] ;
              'Ch11' :  d   := pset_array[22] ;
              'Ch12' :  d   := pset_array[24] ;
              'Ch13' :  d   := pset_array[26] ;
              'Ch14' :  d   := pset_array[28] ;
              'Ch15' :  d   := pset_array[30] ;
              'Ch16' :  d   := pset_array[32] ;
         end;
         case Label3.Caption  of
              'Ch1'  :  f   := Form1.Ch1  ;
              'Ch2'  :  f   := Form1.Ch2  ;
              'Ch3'  :  f   := Form1.Ch3  ;
              'Ch4'  :  f   := Form1.Ch4  ;
              'Ch5'  :  f   := Form1.Ch5  ;
              'Ch6'  :  f   := Form1.Ch6  ;
              'Ch7'  :  f   := Form1.Ch7  ;
              'Ch8'  :  f   := Form1.Ch8  ;
              'Ch9'  :  f   := Form1.Ch9  ;
              'Ch10' :  f   := Form1.Ch10 ;
              'Ch11' :  f   := Form1.Ch11 ;
              'Ch12' :  f   := Form1.Ch12 ;
              'Ch13' :  f   := Form1.Ch13 ;
              'Ch14' :  f   := Form1.Ch14 ;
              'Ch15' :  f   := Form1.Ch15 ;
              'Ch16' :  f   := Form1.Ch16 ;
         end;

   label1.Caption:=floattostr(s) ;
   label2.Caption:=floattostr(d) ;
   label4.Caption:=floattostr(f) ;

     // b := ( 32767.0 / 4.096 )*v ;
     //  b:= ( (-46.85 +175.72)  *  ( val / 65535.0*100)))/100   ;

      //button16.caption:= floattostr (round(strtofloat(Form1.F_te(d)))) ;


      label5.Caption:=Form1.F_te(s);
   label6.Caption:=Form1.F_te(d);
   label7.Caption:=Form1.F_te(f);
   result:=true;
 end;

procedure TForm6.Label1Click(Sender: TObject);
begin
      LGin:= label1.caption; LHcount:=1;
end;

procedure TForm6.Label2Click(Sender: TObject);
begin
 LGin:= label2.caption;    LHcount:=2;
end;

procedure TForm6.Button13Click(Sender: TObject);
begin
 if (chp=0) then inc(chp);
    inc(chp);   if (chp=17) then chp:=1;
    Label3.Caption:=Listb.Strings[chp-1];
    showlabels;
end;

procedure TForm6.Button10Click(Sender: TObject);
begin
   LGin:=LGin+',';   Login();
end;

procedure TForm6.Button11Click(Sender: TObject);
begin
   LGin:=LGin+'0';   Login();
end;

procedure TForm6.Button12Click(Sender: TObject);
begin
  LGin:='' ;  Login();  ;
end;

procedure TForm6.Button14Click(Sender: TObject);
begin
  dec(chp);     if (chp=0) then chp:=16;
   Label3.Caption:=Listb.Strings[chp-1];
   showlabels;
end;

procedure TForm6.Button15Click(Sender: TObject);
var upd   : string;
begin
  //if ( (LHcount=1) OR (LHcount=2) ) then
  case Label3.Caption  of
              'Ch1'  :   pset_array[ 1] := strtofloat(Label1.Caption);
              'Ch2'  :   pset_array[ 3] := strtofloat(Label1.Caption);
              'Ch3'  :   pset_array[ 5] := strtofloat(Label1.Caption);
              'Ch4'  :   pset_array[ 7] := strtofloat(Label1.Caption);
              'Ch5'  :   pset_array[ 9] := strtofloat(Label1.Caption);
              'Ch6'  :   pset_array[11] := strtofloat(Label1.Caption);
              'Ch7'  :   pset_array[13] := strtofloat(Label1.Caption);
              'Ch8'  :   pset_array[15] := strtofloat(Label1.Caption);
              'Ch9'  :   pset_array[17] := strtofloat(Label1.Caption);
              'Ch10' :   pset_array[19] := strtofloat(Label1.Caption);
              'Ch11' :   pset_array[21] := strtofloat(Label1.Caption);
              'Ch12' :   pset_array[23] := strtofloat(Label1.Caption);
              'Ch13' :   pset_array[25] := strtofloat(Label1.Caption);
              'Ch14' :   pset_array[27] := strtofloat(Label1.Caption);
              'Ch15' :   pset_array[29] := strtofloat(Label1.Caption);
              'Ch16' :   pset_array[31] := strtofloat(Label1.Caption);
         end;
        // if ( (LHcount=1) OR (LHcount=2) ) then
         case Label3.Caption  of
              'Ch1'  :    pset_array[ 2] := strtofloat(Label2.Caption);
              'Ch2'  :    pset_array[ 4] := strtofloat(Label2.Caption);
              'Ch3'  :    pset_array[ 6] := strtofloat(Label2.Caption);
              'Ch4'  :    pset_array[ 8] := strtofloat(Label2.Caption);
              'Ch5'  :    pset_array[10] := strtofloat(Label2.Caption);
              'Ch6'  :    pset_array[12] := strtofloat(Label2.Caption);
              'Ch7'  :    pset_array[14] := strtofloat(Label2.Caption);
              'Ch8'  :    pset_array[16] := strtofloat(Label2.Caption);
              'Ch9'  :    pset_array[18] := strtofloat(Label2.Caption);
              'Ch10' :    pset_array[20] := strtofloat(Label2.Caption);
              'Ch11' :    pset_array[22] := strtofloat(Label2.Caption);
              'Ch12' :    pset_array[24] := strtofloat(Label2.Caption);
              'Ch13' :    pset_array[26] := strtofloat(Label2.Caption);
              'Ch14' :    pset_array[28] := strtofloat(Label2.Caption);
              'Ch15' :    pset_array[30] := strtofloat(Label2.Caption);
              'Ch16' :    pset_array[32] := strtofloat(Label2.Caption);
         end;



  DefaultFormatSettings.DecimalSeparator := '.';
    upd:=  'UPDATE limits SET '+
         '  `48ch0_low` = '+floattostr(pset_array [ 1]) +' , '+
         '  `48ch0_high`= '+floattostr(pset_array [ 2]) +' , '+
         '  `48ch1_low` = '+floattostr(pset_array [ 3]) +' , '+
         '  `48ch1_high`= '+floattostr(pset_array [ 4]) +' , '+
         '  `48ch2_low` = '+floattostr(pset_array [ 5]) +' , '+
         '  `48ch2_high`= '+floattostr(pset_array [ 6]) +' , '+
         '  `48ch3_low` = '+floattostr(pset_array [ 7]) +' , '+
         '  `48ch3_high`= '+floattostr(pset_array [ 8]) +' , '+
         '  `49ch0_low` = '+floattostr(pset_array [ 9]) +' , '+
         '  `49ch0_high`= '+floattostr(pset_array [10]) +' , '+
         '  `49ch1_low` = '+floattostr(pset_array [11]) +' , '+
         '  `49ch1_high`= '+floattostr(pset_array [12]) +' , '+
         '  `49ch2_low` = '+floattostr(pset_array [13]) +' , '+
         '  `49ch2_high`= '+floattostr(pset_array [14]) +' , '+
         '  `49ch3_low` = '+floattostr(pset_array [15]) +' , '+
         '  `49ch3_high`= '+floattostr(pset_array [16]) +' , '+
         '  `4ach0_low` = '+floattostr(pset_array [17]) +' , '+
         '  `4ach0_high`= '+floattostr(pset_array [18]) +' , '+
         '  `4ach1_low` = '+floattostr(pset_array [19]) +' , '+
         '  `4ach1_high`= '+floattostr(pset_array [20]) +' , '+
         '  `4ach2_low` = '+floattostr(pset_array [21]) +' , '+
         '  `4ach2_high`= '+floattostr(pset_array [22]) +' , '+
         '  `4ach3_low` = '+floattostr(pset_array [23]) +' , '+
         '  `4ach3_high`= '+floattostr(pset_array [24]) +' , '+
         '  `4bch0_low` = '+floattostr(pset_array [25]) +' , '+
         '  `4bch0_high`= '+floattostr(pset_array [26]) +' , '+
         '  `4bch1_low` = '+floattostr(pset_array [27]) +' , '+
         '  `4bch1_high`= '+floattostr(pset_array [28]) +' , '+
         '  `4bch2_low` = '+floattostr(pset_array [29]) +' , '+
         '  `4bch2_high`= '+floattostr(pset_array [30]) +' , '+
         '  `4bch3_low` = '+floattostr(pset_array [31]) +' , '+
         '  `4bch3_high`= '+floattostr(pset_array [32]) +' where id=1 ;'
         ;


      DefaultFormatSettings.DecimalSeparator := ',';


        //SQLQuery2.Active:=true    ;
       SQLQuery2.SQL.Clear;
       SQLQuery2.SQL.Add(upd);
        //SQLQuery2.Active:=true;
       SQLQuery2.ExecSQL;
      // SQLQuery2.ApplyUpdates();

       SQLTransaction2.commit;
       MySQL55Connection1.CloseDataSets;
       MySQL55Connection1.CloseTransactions;


       showlabels;
end;

procedure TForm6.Button16Click(Sender: TObject);
var b_ , b , val : extended;
begin
  b_ := strtofloat(label6.caption);
  b_ := int (b_)+1;
         b_   :=  4.096 / 32767.0;  // egy step volt - ban
         //val  :=  (-46.85 +175.72) / 25 * 65535.0; // steppek száma
         val :=  scrollbar1.position * 65535.0 /  (-46.85 +175.72) ;
         b:=  b_ * val   ;
  label2.Caption:=floattostr(b);
  Button16.Caption := floattostr (b);
end;

procedure TForm6.Button17Click(Sender: TObject);
begin
  form6.close;
end;

procedure TForm6.Button18Click(Sender: TObject);
begin
    LGin:= label1.caption;   LHcount:=1;
end;

procedure TForm6.Button19Click(Sender: TObject);
begin
    LGin:= label2.caption;   LHcount:=2;
end;

procedure TForm6.Button1Click(Sender: TObject);
begin
  LGin:=LGin+'1';   Login();
end;

procedure TForm6.Button2Click(Sender: TObject);
begin
   LGin:=LGin+'2';   Login();
end;

procedure TForm6.Button3Click(Sender: TObject);
begin
   LGin:=LGin+'3';   Login();
end;

procedure TForm6.Button4Click(Sender: TObject);
begin
   LGin:=LGin+'4';   Login();
end;

procedure TForm6.Button5Click(Sender: TObject);
begin
   LGin:=LGin+'5';   Login();
end;

procedure TForm6.Button6Click(Sender: TObject);
begin
   LGin:=LGin+'6';   Login();
end;

procedure TForm6.Button7Click(Sender: TObject);
begin
   LGin:=LGin+'7';   Login();
end;

procedure TForm6.Button8Click(Sender: TObject);
begin
   LGin:=LGin+'8';   Login();
end;

procedure TForm6.Button9Click(Sender: TObject);
begin
   LGin:=LGin+'9';   Login();
end;

procedure TForm6.FormCreate(Sender: TObject);
begin
    MySQL55Connection1.HostName:=Form1.HOST_A;
end;




procedure TForm6.FormPaint(Sender: TObject);

begin


end;

procedure TForm6.FormShow(Sender: TObject);
var i: integer;
begin
    Listb:=Tstringlist.Create;
    Listb.add('Ch1');      Listb.add('Ch2');      Listb.add('Ch3');    Listb.add('Ch4');
    Listb.add('Ch5');      Listb.add('Ch6');      Listb.add('Ch7');    Listb.add('Ch8');
    Listb.add('Ch9');      Listb.add('Ch10');     Listb.add('Ch11');   Listb.add('Ch12');
    Listb.add('Ch13');     Listb.add('Ch14');     Listb.add('Ch15');   Listb.add('Ch16');
    if (label3.Caption='Label3') then     Label3.Caption:='Ch1';

    SQLQuery1.SQL.Text :=  'select * from test.limits LIMIT 1';
    SQLQuery1.ExecSQL;
    SQLQuery1.open;
    for i := 1 to 32 do
    begin
         pset_array [ i] :=      SQLQuery1.Fields[ i].AsFloat;
    end;
   Label1.Caption:=floattostr(pset_array[ 1]) ;
   Label2.Caption:=floattostr(pset_array[ 2]) ;
   showlabels;
   Scrollbar1.Position:=20;
end;


end.

