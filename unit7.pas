unit Unit7;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, mysql55conn, FileUtil, Forms, Controls, Graphics,
  Dialogs, StdCtrls, ActnList, Spin, ExtCtrls, Buttons
     {$ifdef Linux}
  ,Unix
   {$endif}
  ;

type

  { TForm7 }

  TForm7 = class(TForm)
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
    Button20: TButton;
    Button21: TButton;
    Button22: TButton;
    Button23: TButton;
    Button24: TButton;
    Button25: TButton;
    Button26: TButton;
    Button27: TButton;
    Button28: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Listbox1 :Tstringlist;
    FloatSpinEdit1: TFloatSpinEdit;
    FloatSpinEdit2: TFloatSpinEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    MySQL55Connection1: TMySQL55Connection;
    Panel1: TPanel;
    SQLQuery1: TSQLQuery;
    SQLQuery2: TSQLQuery;
    SQLTransaction1: TSQLTransaction;
    SQLTransaction2: TSQLTransaction;
    ToggleBox1: TToggleBox;
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
    procedure Button20Click(Sender: TObject);
    procedure Button21Click(Sender: TObject);
    procedure Button22Click(Sender: TObject);
    procedure Button23Click(Sender: TObject);
    procedure Button24Click(Sender: TObject);
    procedure Button25Click(Sender: TObject);
    procedure Button26Click(Sender: TObject);
    procedure Button27Click(Sender: TObject);
    procedure Button28Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
    Function  showbuttons (b: boolean):boolean;
    procedure FormShow(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    Function  Login ():boolean;
    Function  showlabels ():boolean;
    procedure ToggleBox1Change(Sender: TObject);
    Function  update_limits ():boolean;
  private
    { private declarations }
  public
    { public declarations }
    var
   //pset_array_type:array[1..16] of integer;
   tli , thi ,rli ,rhi : extended;
  end;

var
  Form7: TForm7;
  listb: Tstringlist;
  chp: integer;     LGin: string;  LHcount , k : integer;
  pset_array:array[1..34] of extended;

  //listlimits: tstringlist;
  l2 : integer;
  Buttonok: boolean=true ;
implementation

uses unit1;
{$R *.lfm}

{ TForm6 }

Function TForm7.Login ():boolean;
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


procedure TForm7.Panel1Click(Sender: TObject);
begin
  if  not(EnableAlarm) then begin
         Panel1.Caption:='stop sound Alert';
         Panel1.Color:=clRed;
         EnableAlarm:= True;
        {$ifdef Linux}
          gReturnCode := fpsystem('echo "1" > /sys/class/gpio/gpio17/value');
        {$endif}
  end
   else     begin
          EnableAlarm:= False;
          Panel1.Caption:='check alarm voice';
          Panel1.Color:=clLime;
          {$ifdef Linux}
          gReturnCode := fpsystem('echo "0" > /sys/class/gpio/gpio17/value');
          {$endif}
   end;

end;

Function TForm7.showbuttons (b: boolean):boolean;
begin
    button1.visible:=b;    button2.visible:=b;     button3.visible:=b;
    button4.visible:=b;    button5.visible:=b;     button6.visible:=b;
    button7.visible:=b;    button8.visible:=b;     button9.visible:=b;
    button10.visible:=b;   button11.visible:=b;    button12.visible:=b;
    result:=true;
end;

 Function TForm7.showlabels ():boolean;
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
         {
         case Label3.Caption  of
              'Ch1'  :  g   := strtoint (Form1.set_type[ 1]   );
              'Ch2'  :  g   := strtoint (Form1.set_type[ 2]   );
              'Ch3'  :  g   := strtoint (Form1.set_type[ 3]   );
              'Ch4'  :  g   := strtoint (Form1.set_type[ 4]   );
              'Ch5'  :  g   := strtoint (Form1.set_type[ 5]   );
              'Ch6'  :  g   := strtoint (Form1.set_type[ 6]   );
              'Ch7'  :  g   := strtoint (Form1.set_type[ 7]   );
              'Ch8'  :  g   := strtoint (Form1.set_type[ 8]   );
              'Ch9'  :  g   := strtoint (Form1.set_type[ 9]   );
              'Ch10' :  g   := strtoint (Form1.set_type[10]   );
              'Ch11' :  g   := strtoint (Form1.set_type[11]   );
              'Ch12' :  g   := strtoint (Form1.set_type[12]   );
              'Ch13' :  g   := strtoint (Form1.set_type[13]   );
              'Ch14' :  g   := strtoint (Form1.set_type[14]   );
              'Ch15' :  g   := strtoint (Form1.set_type[15]   );
              'Ch16' :  g   := strtoint (Form1.set_type[16]   );
         end;
         }
   //ComboBox1.ItemIndex:=g;
   label1.Caption:=floattostr(s) ;
   label2.Caption:=floattostr(d) ;
   label4.Caption:=floattostr(f) ;

     // b := ( 32767.0 / 4.096 )*v ;
     //  b:= ( (-46.85 +175.72)  *  ( val / 65535.0*100)))/100   ;

      //button16.caption:= floattostr (round(strtofloat(Form1.F_te(d)))) ;


      //label5.Caption:=Form1.F_te(s);
      //label6.Caption:=Form1.F_te(d);
     //label7.Caption:=Form1.F_te(f);
   result:=true;
 end;

procedure TForm7.ToggleBox1Change(Sender: TObject);
begin
  if ToggleBox1.Checked then
  begin
     {$ifdef Linux}
    gReturnCode := fpsystem('echo "1" > /sys/class/gpio/gpio18/value');
     {$endif}
  end
  else
  begin
     {$ifdef Linux}
    gReturnCode := fpsystem('echo "0" > /sys/class/gpio/gpio18/value');
    {$endif}
  end;
end;

procedure TForm7.Label1Click(Sender: TObject);
begin
      LGin:= label1.caption; LHcount:=1;
end;

procedure TForm7.Label2Click(Sender: TObject);
begin
 LGin:= label2.caption;    LHcount:=2;
end;

procedure TForm7.Button13Click(Sender: TObject);
begin
 if (chp=0) then inc(chp);
    inc(chp);   if (chp=17) then chp:=1;
    Label3.Caption:=Listb.Strings[chp-1];

    showlabels;
end;

procedure TForm7.Button10Click(Sender: TObject);
begin
   LGin:=LGin+',';   Login();
end;

procedure TForm7.Button11Click(Sender: TObject);
begin
   LGin:=LGin+'0';   Login();
end;

procedure TForm7.Button12Click(Sender: TObject);
begin
  LGin:='' ;  Login();  ;
end;

procedure TForm7.Button14Click(Sender: TObject);
begin
  if (chp>1) then dec(chp);
  if (chp=0) then chp:=16;
   Label3.Caption:=Listb.Strings[chp-1];
   showlabels;
end;

 //=============
 Function TForm7.update_limits ():boolean;
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
       result:=true;
 end;


//==============




procedure TForm7.Button15Click(Sender: TObject);
begin
      update_limits;
      form1.Timer1.OnTimer(Self);
      sleep(100);
      Form1.Timer1.OnTimer(Self);
      showlabels;
end;

procedure TForm7.Button16Click(Sender: TObject);
begin
  tli:=tli+1.0;
  label5.caption:=formatfloat('##',tli);
  label1.caption:=formatfloat('##.############' , (3.2*((tli) +46.85) )/175.72);
end;



procedure TForm7.Button17Click(Sender: TObject);
begin
  form7.close;
end;

procedure TForm7.Button18Click(Sender: TObject);
begin
    LGin:= label1.caption;   LHcount:=1;
    Floatspinedit1.Value:= strtofloat(label1.caption);
end;

procedure TForm7.Button19Click(Sender: TObject);
begin
    LGin:= label2.caption;   LHcount:=2;
    FloatSpinEdit2.Value:=strtofloat(LGin);
end;

procedure TForm7.Button1Click(Sender: TObject);
begin
  LGin:=LGin+'1';   Login();
end;

procedure TForm7.Button20Click(Sender: TObject);
begin
  tli:=tli-1.0;
  label5.caption:=formatfloat('##',tli);
  label1.caption:=formatfloat('##.############' , (3.2*((tli) +46.85) )/175.72);
end;



procedure TForm7.Button21Click(Sender: TObject);
begin
  label1.caption:=floattostr(FloatSpinedit1.Value);
end;

procedure TForm7.Button22Click(Sender: TObject);
begin
  label2.caption:=floattostr(FloatSpinedit2.Value);
end;

procedure TForm7.Button23Click(Sender: TObject);
begin
  thi:=thi+1.0;
  label6.caption:=formatfloat('##',thi);
  label2.caption:=formatfloat('##.############' , (3.2*((thi) +46.85) )/175.72);
end;

procedure TForm7.Button24Click(Sender: TObject);
begin
   thi:=thi-1.0;
  label6.caption:=formatfloat('##',thi);
  label2.caption:=formatfloat('##.############' , (3.2*((thi) +46.85) )/175.72);
end;

procedure TForm7.Button25Click(Sender: TObject);
begin
   rli:=rli+1.0;
  label7.caption:=formatfloat('##',rli);
  label1.caption:=formatfloat('##.############' , (3.2*((rli) +6.0) )/125.00);

end;

procedure TForm7.Button26Click(Sender: TObject);
begin
    rli:=rli-1.0;
  label7.caption:=formatfloat('##',rli);
  label1.caption:=formatfloat('##.############' , (3.2*((rli) +6.0) )/125.00);

end;


procedure TForm7.Button27Click(Sender: TObject);
begin
     rhi:=rhi+1.0;
  label8.caption:=formatfloat('##',rhi);
  label2.caption:=formatfloat('##.############' , (3.2*((rhi) +6.0) )/125.00);
end;

procedure TForm7.Button28Click(Sender: TObject);
begin
          rhi:=rhi-1.0;
  label8.caption:=formatfloat('##',rhi);
  label2.caption:=formatfloat('##.############' , (3.2*((rhi) +6.0) )/125.00);
end;





procedure TForm7.Button2Click(Sender: TObject);
begin
   LGin:=LGin+'2';   Login();
end;

procedure TForm7.Button3Click(Sender: TObject);
begin
   LGin:=LGin+'3';   Login();
end;

procedure TForm7.Button4Click(Sender: TObject);
begin
   LGin:=LGin+'4';   Login();
end;

procedure TForm7.Button5Click(Sender: TObject);
begin
   LGin:=LGin+'5';   Login();
end;

procedure TForm7.Button6Click(Sender: TObject);
begin
   LGin:=LGin+'6';   Login();
end;
procedure TForm7.Button7Click(Sender: TObject);
begin
   LGin:=LGin+'7';   Login();
end;

procedure TForm7.Button8Click(Sender: TObject);
begin
   LGin:=LGin+'8';   Login();
end;

procedure TForm7.Button9Click(Sender: TObject);
begin
   LGin:=LGin+'9';   Login();
end;



procedure TForm7.FormCreate(Sender: TObject);
begin
  MySQL55Connection1.HostName:=Form1.HOST_A;

end;



procedure TForm7.FormShow(Sender: TObject);
var i: integer;
begin

    Listb:=Tstringlist.Create;
    Listb.add('Ch1');      Listb.add('Ch2');      Listb.add('Ch3');    Listb.add('Ch4');
    Listb.add('Ch5');      Listb.add('Ch6');      Listb.add('Ch7');    Listb.add('Ch8');
    Listb.add('Ch9');      Listb.add('Ch10');     Listb.add('Ch11');   Listb.add('Ch12');
    Listb.add('Ch13');     Listb.add('Ch14');     Listb.add('Ch15');   Listb.add('Ch16');
    if (label3.Caption='Label3') then     Label3.Caption:='Ch1';

    FloatSpinedit1.value:=0;
    FloatSpinedit2.value:=0;


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
  // Scrollbar1.Position:=20;
   ShowButtons(true);

end;


end.

