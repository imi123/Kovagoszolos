unit Unit1; 

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil,  Forms, Controls,
  Graphics, Dialogs, StdCtrls, ExtCtrls, Buttons, EditBtn, DBGrids,
  IniFiles  , math
  {$ifdef Linux}
  ,Unix
   {$endif}
       ;
  type


  { TForm1 }
                  //result:= FormatFloat('00.00', val);
    //  RH = -6 +125 * ( 3,2 div x)
    //   T = -46,85 +175,72  *  ( 3,2 div x)

  sataarray = array of string;

  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    DBGrid1: TDBGrid;
    ExitButton: TButton;
    Label16: TLabel;
    Label21: TLabel;
    Label20: TLabel;
    Label19: TLabel;
    Label18: TLabel;
    Label17: TLabel;
    Label15: TLabel;
    Label14: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label3: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    Shape10: TShape;
    Shape11: TShape;
    Shape12: TShape;
    Shape13: TShape;
    Shape14: TShape;
    Shape15: TShape;
    Shape16: TShape;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Shape5: TShape;
    Shape6: TShape;
    Shape7: TShape;
    Shape8: TShape;
    Shape9: TShape;
    SpeedButton2: TSpeedButton;
    Timer1: TTimer;
    lista: TstringList;
    kabelsa:TstringList;
        set_type: TstringList;
    Timer2: TTimer;
    naponta: TTimer;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ExitButtonClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image1DblClick(Sender: TObject);
    procedure Label15Click(Sender: TObject);
    procedure Label16DblClick(Sender: TObject);
    procedure Label17Click(Sender: TObject);
    procedure Label17DblClick(Sender: TObject);
    procedure Label21Click(Sender: TObject);
    procedure Label21DblClick(Sender: TObject);
    procedure Label7DblClick(Sender: TObject);
    Function  ParseS(S: string): SataArray;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    Function  GetLabels: boolean;
    Function  F_lux (v: extended): string;
    Function  F_h1 (v: extended): string;
    Function  F_h2 (v: extended): string;
    {$ifdef Windows}
    Function  FpSystem  (s: string): longint;
    {$endif}
    Function  alarm (): boolean;
    Function  F_volt (v: extended): string;
    Function  F_low  (v: extended): string;
    Function  F_high (v: extended): string;
    Function  F_rh   (v: extended): string;
    Function  F_te   (v: extended): string;
    Function  F_flow (z: extended ) : string;
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure napontaTimer(Sender: TObject);
    Function SendSMS( ):boolean;
  private
    { private declarations }
  public
    { public declarations }
     var  inF_  , inF_DB , inF_DB_tmp, Os , Dfile , varch , refcsat: string;
     broad, ir, lux: Extended;
     f_array:array[1..18] of extended;
     p_array:array[1..16] of extended;
     HOST_A , LOCALIP : string;
     ch_error_low  : array[1..16] of boolean;
     ch_error_high : array[1..16] of boolean;
     chlimits_low  : array[1..16] of extended;
     chlimits_high : array[1..16] of extended;
     alert_count:array[1..16] of integer;
     tipusa: integer;
     Ch1,Ch2,Ch3,Ch4, Ch5,Ch6,Ch7,Ch8,Ch9,Ch10,Ch11,
     Ch12,Ch13,Ch14,Ch15,Ch16 : extended;
     sa: sataarray;
     lastrogrek , k , perc_hrom ,ora_sound, he ,wi , pi : integer;
     backgroundImage : TBitmap;         tickjatek: longint;
     kitekett , reszletek : boolean ;
     reflabel: string ; aPic,  piros, kek , zold , thuzott: TPicture;
  end; 

var
  Form1: TForm1;

  //Buffer: array[0..127] of char;
  //ReadCount: Integer;
  //ReadSize: Integer;
  File1: TextFile;
  Str  : String;
  posi : Extended ;
  IniFile  : TIniFile;
  EnableAlarm , enablesound, Futyul , futyul_changed: boolean;
      gReturnCode: longint;
  //BuX : array[0..20] of extended;
  const
  CRLF: string = '' + #13#10;



implementation
uses Unit2, Unit3 , Unit4 , Unit5, Unit7 ;
{$R *.lfm}

{ TForm1 }
function iif(Condition: boolean; T, F: variant): variant;
begin
  if Condition then
    Result := T
  else
    Result := F;
end ;

{$ifdef Windows}
 function Beep(dwFreq, dwDuration: DWORD): BOOLEAN; stdcall; external 'kernel32.dll';
{$endif}


 Function TForm1.ParseS(S: string): SataArray;
var
  n, i: Integer;
begin
  Trim(S);
  i := 0;
  repeat
    SetLength(Result, i+1);
    n := Pos( ',', S);
    if (n = 0) then
      Result[i] := S
    else
      Result[i] :=trim( Copy(S, 1, n-1));
    Delete(S, 1, n);
    Inc(i);
  until (n = 0);

end;


procedure TForm1.SpeedButton1Click(Sender: TObject);
begin

end;



 function _GetTickCount: Cardinal;
 begin
   Result := Cardinal(Trunc(Now * 24 * 60 * 60 * 1000));
 end;
 {$ifdef Windows }
         Function TForm1.FpSystem  (s: string): longint;
         begin
         gReturnCode:=0; result:= gReturnCode;
         end;
 {$endif}
 Function TForm1.F_volt (v: extended): string;
 begin
   result:= FloatToStr(v);
 end;


Function TForm1.SendSMS(  ):boolean;
begin
     //sendSMS//

      Form1.Timer1.Enabled:=false;
      {
        showmessage(ska+ '  megy le');
      {$ifdef Linux}
      gReturnCode := fpsystem('echo "1" > /sys/class/gpio/gpio18/value');
     {$endif}
      sleep(10);
      showmessage(ska+ ' wait ended');
     {$ifdef Linux}
      gReturnCode := fpsystem('echo "0" > /sys/class/gpio/gpio18/value');
     {$endif}
     showmessage(ska+ ' megy fellll');
     }

     form7.ToggleBox1.Checked:=true;
     sleep(700);
     form7.ToggleBox1.Checked:=false;


      Form1.Timer1.Enabled:=true;
 result:=true;
end;




Function sendletter (s: string ):boolean;
var  f: TFileStream;
   Line: string;
begin
     //sendletter//
      f:= TFileStream.Create('msg11.txt', fmCreate);
      Line:= 'To: psuhajda@outlook.hu' + #13#10;
      f.Write(Pointer(Line)^, Length(Line));
      Line:= 'From: alert_system@basevago.hu' + #13#10;
      f.Write(Pointer(Line)^, Length(Line));
      Line:= 'Subject: alert_from_box' + #13#10;
      f.Write(Pointer(Line)^, Length(Line));
      Line:= 'The Env.system is broken on : '+s + #13#10;
      f.Write(Pointer(Line)^, Length(Line));
      f.Free;


     {$ifdef Linux}
      gReturnCode := fpsystem('ssmtp psuhajda@outlook.hu < msg11.txt');
      gReturnCode := fpsystem('cat msg11.txt');
      gReturnCode := fpsystem('rm -r msg11.txt');
     {$endif}

 result:=true;
end;


Function Tform1.F_flow (z: extended ) : string;
var zv: extended ;
begin
  zv:= (power (2.71,1.5995*z)) * 0.142;
  {
  //z:=z+0.35;
if (z<0.5) then zv:=0 else
  begin
    if    (z<0.5)		   then zv:= 0.01;
    if  ( (z>0.5)  AND (z<0.9) )   then zv:= 0.45;
    if  ( (z>0.9)  AND (z<1.22) )  then zv:= 0.60;
    if  ( (z>1.22) AND (z<1.26) )  then zv:= 0.80;
    if  ( (z>1.26) AND (z<1.4) )   then zv:= 1.00;
    if  ( (z>1.4)  AND (z<1.48) )  then zv:= 1.07;
    if  ( (z>1.48) AND (z<1.74))   then zv:= 1.55;

    if  ( (z>1.74) AND (z<1.90))   then zv:= 2.00;
    if  ( (z>1.90) AND (z<2.00))   then zv:= 2.55;

    if  ( (z>2.00) AND (z<2.25) )  then zv:= 3.05;
    // orig if  ( (z>1.74) AND (z<2.25) )  then zv:= 3.05;
    if  ( (z>2.25) AND (z<2.42) )  then zv:= 6.00;
    if  ( (z>2.42) AND (z<2.56) )  then zv:= 8.00;
    if  ( (z>2.56)              )  then zv:= 8.10;
  end;
  }
result:=FormatFloat('00.00',zv);
end;

 Function TForm1.F_low (v : extended ): string;
 begin
   result:=FloatToStr(v) ;
 end;

 Function TForm1.F_high (v: extended): string;
 begin
   result:=FloatToStr(v);
 end;

 Function TForm1.F_rh (v: extended): string;
 begin
              //val := ( 32767.0 / 4.096 )* v ;
             //result:=FloatToStr (round(  ( (-06.00 +125.00)  *  ( val / 65535.0*100)))/100 )  ;
   result:=FormatFloat('00.00', (   (+125.00)  *  ( v / 3.2))  -06.00  ) +' RH %'  ;

 end;
 Function TForm1.F_te (v: extended): string;
 begin
   //val := ( 32767.0 / 4.096 )*v ;
   //result:=FormatFloat('00.00', (round(  ( (-46.85 +175.72)  *  ( val / 65535.0*100)))/100 ))  ;
   result:=FormatFloat('00.00', (   (175.72)  *  ( v / 3.2) )-46.85    ) + ' °C'  ;
 end;

 Function TForm1.F_lux (v: extended): string;
 var li: extended;
 begin
      li:=5000.0 * v;
      result:=FormatFloat('#######', li   );
 end;
  Function TForm1.F_h1 (v: extended): string;
 var li: extended;
 begin
    li:=(255.59 * v) - 255.45 ;
    result:=FormatFloat('####.##', li   );

 end;

 Function TForm1.F_h2 (v: extended): string;
 var li: extended;
 begin
     {
                   if (  v<0.4) then  li:=0.00;
                  if ( (v>=2.0)              )  then li:= ( (v - 2.0) / 0.0115384615384615)+30;
                  if ( (v>1.7)  and (v<2.0)  )  then li:= ( (v - 1.7) / 0.0115384615384615)+4 ;
                  if ( (v>1.65) and (v<1.7)  )  then li:= ( (v - 1.65)/ 0.0125)            +0 ;
                  if ( (v>1.4)  and (v<1.65) )  then li:= -20  +( (v - 1.4) / 0.0125)  ;
                  if ( (v>0.4)  and (v<1.4)  )  then li:= -100 +( (v - 0.4) / 0.0125)  ;
     }
    li:=(80.908 * v) - 132.87 ;
    result:=FormatFloat('####.##', li   );

 end;





 Function TForm1.alarm (): boolean;
  var t   : integer;   today : TDateTime;
  ro ,     limb: extended;
  begin

    for t := 1 to 16 do
    begin
      if ( (ch_error_low [ t]) OR  (ch_error_high [ t])) then inc(alert_count[ t]);
    end;
    today := Now;
    for t := 1 to 16 do
    begin
      if (alert_count[ t]=1)     then  begin //log
                               if    ( ch_error_low  [ t])  then limb:= chlimits_low   [t]   else     limb:= chlimits_high  [t];
                               ro:=  p_array  [t] - limb ;
                               Datamodule1.SQLQuery1.Active:=false;
                               Datamodule1.SQLQuery1.SQL.Clear;
                               DefaultFormatSettings.DecimalSeparator := '.';
                               Datamodule1.SQLQuery1.SQL.Add('insert into test.alertlog (  `Note`,   `ch`, `ch_value`, `limit`, `delta` ) VALUES ( "'+  '' +'" , "' + 'Ch'+inttostr(t)+ '",'+ floattostr(p_array[ t]) +' ,'+  floattostr(limb) +', ' + floattostr(ro)+  ') ');
                               Datamodule1.SQLQuery1.ExecSQL;
                               Datamodule1.SQLTRansaction1.commit;
                               DefaultFormatSettings.DecimalSeparator := ',';

                                              sendletter( 'channel'+ inttostr(t)+' ' +DateToStr(today)+' '+TimeToStr(today) );        SendSMS(); end;
      if (alert_count[ t]=360 )  then  begin  sendletter( 'channel'+ inttostr(t)+' ' +'not repaired yet. Resended message :' +DateToStr(today)+' '+TimeToStr(today));   SendSMS();  alert_count[ t] := 2;  end;
     // if (alert_count[ t]=360)   then  alert_count[ t] := 2;
    end;
    // 6    1 perc        // 360   1   óra
    // 60  10 perc        // 540   1,5 óra
    // 180 30 perc        // 720   2   óra


    for t := 1 to 16 do     // reset ha zöld
    begin
      if ( not(ch_error_low [ t]) AND not(ch_error_high [ t])) then alert_count[ t]:=0;
    end;

     {  }// /egyelöre nem fütyülünk
        Futyul:= false; for t := 1 to 16 do
        begin
         if (ch_error_low [ t] OR ch_error_high [ t]) then Futyul:=true;
        end;
        if (futyul_changed and futyul) then
        begin
          if not(EnableAlarm)  then
          begin
           if (Futyul) then  // gReturnCode := fpsystem('echo "1" > /sys/class/gpio/gpio17/value')
           else
         //    gReturnCode := fpsystem('echo "0" > /sys/class/gpio/gpio17/value');
          end;
        end;
       futyul_changed:=futyul;


   dec(perc_hrom);
   Result := true;
  end;







 function Tform1.GetLabels: boolean;
 var ittenberg: string; j: integer;
 begin
    lista:=tstringlist.create;
      Datamodule1.SQLQuery1.SQL.Clear;
      Datamodule1.SQLQuery1.SQL.Add('show columns from test.adc');
      Datamodule1.SQLQuery1.Active:=true;
      Datamodule1.SQLQuery1.Refresh;
      for j := 1 to 7 do      Datamodule1.SQLQuery1.Next;
      while not Datamodule1.SQLQuery1.Eof do
     begin
          ittenberg:=(  Datamodule1.SQLQuery1.Fields[0].AsString) ;
          lista.Add(ittenberg);
          Datamodule1.SQLQuery1.Next;
     end;
      Datamodule1.SQLTransaction1.commit;
      Datamodule1.SQLQuery1.Close;

   {     ez is oooookkk !!!!
      lista:=tstringlist.create;
      Datamodule1.SQLQuery1.SQL.Clear;
      Datamodule1.SQLQuery1.SQL.Add('select (col2) from adc_fields');
      Datamodule1.SQLQuery1.Active:=true;
      Datamodule1.SQLQuery1.Refresh;
         while not Datamodule1.SQLQuery1.Eof do
     begin
          ittenberg:=(  Datamodule1.SQLQuery1.Fields[0].AsString) ;
          lista.Add(ittenberg);
          Datamodule1.SQLQuery1.Next;
     end;


      //Datamodule1.SQLQuery1.close;
  }

      Datamodule1.SQLQuery2.SQL.Clear;
      Datamodule1.SQLQuery2.SQL.Add('select * from adc ORDER BY Id DESC  LIMIT 1');
      Datamodule1.SQLQuery2.open;
      Datamodule1.SQLQuery2.Active:=true;
      Datamodule1.SQLQuery2.Refresh;
  lastrogrek:=Datamodule1.SQLQuery2.FieldByName('Id').AsInteger;
  if (lastrogrek>0) then
    begin

                     Ch1 :=Datamodule1.SQLQuery2.FieldByName(lista[ 0]).AsFloat ;
                     Ch2 :=Datamodule1.SQLQuery2.FieldByName(lista[ 1]).AsFloat ;
                     Ch3 :=Datamodule1.SQLQuery2.FieldByName(lista[ 2]).AsFloat ;
                     Ch4 :=Datamodule1.SQLQuery2.FieldByName(lista[ 3]).AsFloat ;

                     Ch5 :=Datamodule1.SQLQuery2.FieldByName(lista[ 4]).AsFloat ;
                     Ch6 :=Datamodule1.SQLQuery2.FieldByName(lista[ 5]).AsFloat ;
                     Ch7 :=Datamodule1.SQLQuery2.FieldByName(lista[ 6]).AsFloat ;
                     Ch8 :=Datamodule1.SQLQuery2.FieldByName(lista[ 7]).AsFloat ;

                     Ch9  :=Datamodule1.SQLQuery2.FieldByName(lista[ 8]).AsFloat ;
                     Ch10 :=Datamodule1.SQLQuery2.FieldByName(lista[ 9]).AsFloat ;
                     Ch11 :=Datamodule1.SQLQuery2.FieldByName(lista[10]).AsFloat ;
                     Ch12 :=Datamodule1.SQLQuery2.FieldByName(lista[11]).AsFloat ;

                     Ch13 :=Datamodule1.SQLQuery2.FieldByName(lista[12]).AsFloat ;
                     Ch14 :=Datamodule1.SQLQuery2.FieldByName(lista[13]).AsFloat ;
                     Ch15 :=Datamodule1.SQLQuery2.FieldByName(lista[14]).AsFloat ;
                     Ch16 :=Datamodule1.SQLQuery2.FieldByName(lista[15]).AsFloat ;
                     //infrared, full-spectrum or human-visible
                     broad:=Datamodule1.SQLQuery2.FieldByName('broadband').AsFloat ;
                     ir   :=Datamodule1.SQLQuery2.FieldByName('ir').AsFloat ;
                     lux  :=Datamodule1.SQLQuery2.FieldByName('lux').AsFloat ;



                      Label3.Font.Name := 'sans'; ;Label3.Font.Style := []; Label3.Font.Size  :=  10;
                      Label4.Font.Name := 'sans'; ;Label4.Font.Style := []; Label4.Font.Size  :=  10;
                      Label5.Font.Name := 'sans'; ;Label5.Font.Style := []; Label5.Font.Size  :=  10;
                      Label6.Font.Name := 'sans'; ;Label6.Font.Style := []; Label6.Font.Size  :=  10;
                     Label10.Font.Name := 'sans'; ;Label10.Font.Style := []; Label10.Font.Size  :=  10;
                     Label11.Font.Name := 'sans'; ;Label11.Font.Style := []; Label11.Font.Size  :=  10;
                     Label12.Font.Name := 'sans'; ;Label12.Font.Style := []; Label12.Font.Size  :=  10;
                     Label13.Font.Name := 'sans'; ;Label13.Font.Style := []; Label13.Font.Size  :=  10;
                     Label14.Font.Name := 'sans'; ;Label14.Font.Style := []; Label14.Font.Size  :=  10;
                     Label15.Font.Name := 'sans'; ;Label15.Font.Style := []; Label15.Font.Size  :=  10;
                     Label16.Font.Name := 'sans'; ;Label16.Font.Style := []; Label16.Font.Size  :=  10;
                     Label17.Font.Name := 'sans'; ;Label17.Font.Style := []; Label17.Font.Size  :=  10;
                     Label18.Font.Name := 'sans'; ;Label18.Font.Style := []; Label18.Font.Size  :=  10;
                     Label19.Font.Name := 'sans'; ;Label19.Font.Style := []; Label19.Font.Size  :=  10;
                     Label20.Font.Name := 'sans'; ;Label20.Font.Style := []; Label20.Font.Size  :=  10;
                     Label21.Font.Name := 'sans'; ;Label21.Font.Style := []; Label21.Font.Size  :=  10;


   label3.caption:=kabelsa[0] +CRLF+CRLF+ iif ((ch_error_low [ 1] or ch_error_high [ 1])  , 'Power Fail' , 'Power Ok');
   label4.caption:=kabelsa[1]+CRLF+ F_te(chlimits_low[2])+CRLF+F_te(Ch2)+CRLF+F_te(chlimits_high[2]);
   label5.caption:=kabelsa[2]+CRLF+ F_rh(chlimits_low[3])+CRLF+F_rh(Ch3)+CRLF+F_rh(chlimits_high[3]);
   label6.caption:=kabelsa[3]+CRLF+F_flow(chlimits_low[4])+CRLF+F_flow(Ch4)+CRLF+F_flow(chlimits_high[4]);

    //kakcsolo6.caption:='Height :'+inttostr(he) ;
   //label8.caption:='width  : '+inttostr(wi) ;
   //label9.caption:='pix/inch: '+inttostr(pi) ;
   //kakcsolo6.caption:='full-spectrum : '+Floattostr(broad) ;
   //label8.caption:='infrared : '+Floattostr(ir) ;
   //label9.caption:='human visible : '+Floattostr(lux) + ' lux' ;

   label10.caption:=kabelsa[4]+CRLF+F_lux(chlimits_low[5])+CRLF+F_lux(Ch5)+CRLF+F_lux(chlimits_high[5]);
   label11.caption:=kabelsa[5]+CRLF+F_te(chlimits_low[6])+CRLF+F_te(Ch6)+CRLF+F_te(chlimits_high[6]);
   label12.caption:=kabelsa[6]+CRLF+F_rh(chlimits_low[7])+CRLF+F_rh(Ch7)+CRLF+F_rh(chlimits_high[7]);
   label13.caption:=kabelsa[7]+CRLF+F_flow(chlimits_low[8])+CRLF+F_flow(Ch8)+CRLF+F_flow(chlimits_high[8]);

   label14.caption:=kabelsa[08]+CRLF+F_te(chlimits_low[09]) +CRLF+F_te(Ch9)+CRLF+F_te(chlimits_high[9]);
   label15.caption:=kabelsa[09]+CRLF+F_rh(chlimits_low[10])+CRLF+F_rh(Ch10)+CRLF+F_rh(chlimits_high[10]);
   label16.caption:=kabelsa[10]+CRLF+F_te(chlimits_low[11])+CRLF+F_te(Ch11)+CRLF+F_te(chlimits_high[11]);
   label17.caption:=kabelsa[11]+CRLF+F_rh(chlimits_low[12])+CRLF+F_rh(Ch12)+CRLF+F_rh(chlimits_high[12]);

   label18.caption:=kabelsa[12]+CRLF+F_te(chlimits_low[13])+CRLF+F_te(Ch13)+CRLF+F_te(chlimits_high[13]);
   label19.caption:=kabelsa[13]+CRLF+CRLF+F_h1(Ch14);
   label20.caption:=kabelsa[14]+CRLF+CRLF+F_h2(Ch15);
   label21.caption:=kabelsa[15]+CRLF+CRLF+F_h2(Ch16);
//informativ
 if not(reszletek) then
   begin
   Label3.Font.Name := 'sans';
   Label3.Font.Style := [fsBold ];
   label3.caption:=CRLF+  iif ((ch_error_low [ 1] or ch_error_high [ 1])  , 'Power Fail' , 'Power Ok');

   Label4.Font.Name := 'sans';
   Label4.Font.Style := [fsBold ];
   label4.caption:='      '+copy(kabelsa[1],6,4)+CRLF+CRLF+'  '+F_te(Ch2);

   Label5.Font.Name := 'sans';
   Label5.Font.Style := [fsBold ];
   label5.caption:='     '+copy(kabelsa[2],6,4)+CRLF+CRLF+''+F_rh(Ch3);

   Label6.Font.Name := 'sans';
   Label6.Font.Style := [fsBold ];
   label6.caption:='     '+copy(kabelsa[3],6,4)+CRLF+CRLF+' '+F_flow(Ch4)+' m/s';

   Label10.Font.Name := 'sans';
   Label10.Font.Style := [fsBold ];
   label10.caption:='    '+copy(kabelsa[4],6,4)+CRLF+CRLF+' '+F_lux(Ch5)+ ' lux';

   Label11.Font.Name := 'sans';
   Label11.Font.Style := [fsBold ];
   label11.caption:='    '+copy(kabelsa[5],6,4)+CRLF+CRLF+' '+F_te(Ch6);

   Label12.Font.Name := 'sans';
   Label12.Font.Style := [fsBold ];
   label12.caption:='   '+copy(kabelsa[6],6,4)+CRLF+CRLF+''+F_rh(Ch7);

   Label13.Font.Name := 'sans';
   Label13.Font.Style := [fsBold ];
   label13.caption:='   '+copy(kabelsa[7],6,4)+CRLF+CRLF+''+F_flow(Ch8)+ ' m/s';

   Label14.Font.Name := 'sans';
   Label14.Font.Style := [fsBold ];
   label14.caption:='   '+copy(kabelsa[8],6,4)+CRLF+CRLF+' '+F_te(Ch9);

   Label15.Font.Name := 'sans';
   Label15.Font.Style := [fsBold ];
   label15.caption:='  '+copy(kabelsa[9],7,4)+CRLF+CRLF+''+F_rh(Ch10);

   Label16.Font.Name := 'sans';
   Label16.Font.Style := [fsBold ];
   label16.caption:='    '+copy(kabelsa[10],7,4)+CRLF+CRLF+'  '+F_te(Ch11);

   Label17.Font.Name := 'sans';
   Label17.Font.Style := [fsBold ];
   label17.caption:='   '+copy(kabelsa[11],7,4)+CRLF+CRLF+''+F_rh(Ch12);

   Label18.Font.Name := 'sans';
   Label18.Font.Style := [fsBold ];
   label18.caption:='   '+copy(kabelsa[12],7,4)+CRLF+CRLF+''+F_te(Ch13);

   Label19.Font.Name := 'sans';
   Label19.Font.Style := [fsBold ];
   label19.caption:='    '+copy(kabelsa[13],7,4)+CRLF+CRLF+''+F_h1(Ch14)+ ' °C' ;

   Label20.Font.Name := 'sans';
   Label20.Font.Style := [fsBold ];
   label20.caption:='   '+copy(kabelsa[14],7,6)+CRLF+CRLF+''+F_h2(Ch15)+ ' °C' ;

   Label21.Font.Name := 'sans';
   Label21.Font.Style := [fsBold ];
   label21.caption:='   '+copy(kabelsa[15],7,6)+CRLF+CRLF+''+F_h2(Ch16)+ ' °C' ;
   end;
   // előlapi quick confighoz
      case refcsat  of
              'Ch2'   :  reflabel:=  label4.caption;// ET
              'Ch3'   :  reflabel:=  label5.caption;// ERH
              'Ch6'   :  reflabel:= label11.caption;// MHT
              'Ch7'   :  reflabel:= label12.caption;// MHRH
              'Ch9'   :  reflabel:= label14.caption;// KT
              'Ch10'  :  reflabel:= label15.caption;// KRH
              'Ch11'  :  reflabel:= label16.caption;// MT
              'Ch12'  :  reflabel:= label17.caption;// MRH
              'Ch13'  :  reflabel:= label18.caption;// KOT
              'Ch14'  :  reflabel:= label19.caption;// H1
              'Ch15'  :  reflabel:= label20.caption;// H2
              'Ch16'  :  reflabel:= label21.caption;// H2
      end;
       // test


 end; // van rögz record
  Result := true ;
end;
procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
       Form3.ShowModal;
end;

procedure TForm1.Timer1Timer (Sender: TObject);
var
 i ,j: Integer;
begin
// Timer1.Enabled:=False;
   inc(perc_hrom);
   Getlabels ;




      // Label1.Caption:=Inttostr(perc_hrom);
       Datamodule1.SQLQuery2.Active:=false;
       Datamodule1.SQLQuery2.SQL.Clear;
       //Datamodule1.SQLQuery2.SQL.Add('select * from adc ORDER BY Id DESC  LIMIT 2');
       Datamodule1.SQLQuery2.SQL.Text :=  'select * from adc ORDER BY Id DESC  LIMIT 1';
       Datamodule1.SQLQuery2.Active:=true;
              Datamodule1.SQLQuery2.ExecSQL;
      // Datamodule1.SQLQuery2.Refresh;
   //    ListBox1.Items:=lista;
       i:=lista.count;

     while not Datamodule1.SQLQuery2.Eof do
     begin
        for i := 1 to 16 do
        begin
             f_array[ i] := ( Datamodule1.SQLQuery2.FieldByName (lista[ i-1]).AsFloat);
        end;
        Datamodule1.SQLQuery2.Next;
        for i := 1 to 16 do
        begin
             p_array[ i] := ( Datamodule1.SQLQuery2.FieldByName (lista[ i-1]).AsFloat);
        end;
     end;

        Datamodule1.SQLQuery1.SQL.Clear;
        Datamodule1.SQLQuery1.SQL.Text :=  'select * from test.limits';
        Datamodule1.SQLQuery1.ExecSQL;
        Datamodule1.SQLQuery1.Active:=true;

        i:=1; j:=1; while i<=32 do
        begin
             chlimits_low  [j] := ( Datamodule1.SQLQuery1.Fields[i  ].AsFloat);
             chlimits_high [j] := ( Datamodule1.SQLQuery1.Fields[i+1].AsFloat);


                   inc(i); inc(i);  inc(j);
        end;
        Datamodule1.SQLQuery1.Active:=false;



     i:=0;
    //másik algoritmus a szinezésre. Az utolsó LIMIT 1 rekord

        for i := 1 to 16 do
        begin
          ch_error_low [ i]   :=  (p_array[ i])   < chlimits_low  [i]
        end;
        for i := 1 to 16 do
        begin
          ch_error_high[ i]   :=  (p_array[ i])   > chlimits_high [i]
        end;
           i:=0;
        //kijelzés  villogás

        begin
            if  ( (ch_error_low [ 1]) OR (ch_error_high [ 1]) ) then Shape1.Brush.Color:=clRed else  if ( not (ch_error_low [ 1]) AND not (ch_error_high [ 1]) ) then  Shape1.Brush.Color:=clLime;
            if  ( (ch_error_low [ 2]) OR (ch_error_high [ 2]) ) then Shape2.Brush.Color:=clRed else  if ( not (ch_error_low [ 2]) AND not (ch_error_high [ 2]) ) then  Shape2.Brush.Color:=clLime;
            if  ( (ch_error_low [ 3]) OR (ch_error_high [ 3]) ) then Shape3.Brush.Color:=clRed else  if ( not (ch_error_low [ 3]) AND not (ch_error_high [ 3]) ) then  Shape3.Brush.Color:=clLime;
            if  ( (ch_error_low [ 4]) OR (ch_error_high [ 4]) ) then Shape4.Brush.Color:=clRed else  if ( not (ch_error_low [ 4]) AND not (ch_error_high [ 4]) ) then  Shape4.Brush.Color:=clLime;

            if  ( (ch_error_low [ 5]) OR (ch_error_high [ 5]) ) then Shape5.Brush.Color:=clRed else  if ( not (ch_error_low [ 5]) AND not (ch_error_high [ 5]) ) then  Shape5.Brush.Color:=clLime;
            if  ( (ch_error_low [ 6]) OR (ch_error_high [ 6]) ) then Shape6.Brush.Color:=clRed else  if ( not (ch_error_low [ 6]) AND not (ch_error_high [ 6]) ) then  Shape6.Brush.Color:=clLime;
            if  ( (ch_error_low [ 7]) OR (ch_error_high [ 7]) ) then Shape7.Brush.Color:=clRed else  if ( not (ch_error_low [ 7]) AND not (ch_error_high [ 7]) ) then  Shape7.Brush.Color:=clLime;
            if  ( (ch_error_low [ 8]) OR (ch_error_high [ 8]) ) then Shape8.Brush.Color:=clRed else  if ( not (ch_error_low [ 8]) AND not (ch_error_high [ 8]) ) then  Shape8.Brush.Color:=clLime;

            if  ( (ch_error_low [ 9]) OR (ch_error_high [ 9]) ) then Shape9.Brush.Color:=clRed else  if ( not (ch_error_low [ 9]) AND not (ch_error_high [ 9]) ) then   Shape9.Brush.Color:=clLime;
            if  ( (ch_error_low [10]) OR (ch_error_high [10]) ) then Shape10.Brush.Color:=clRed else  if ( not (ch_error_low [10]) AND not (ch_error_high [10]) ) then  Shape10.Brush.Color:=clLime;
            if  ( (ch_error_low [11]) OR (ch_error_high [11]) ) then Shape11.Brush.Color:=clRed else  if ( not (ch_error_low [11]) AND not (ch_error_high [11]) ) then  Shape11.Brush.Color:=clLime;
            if  ( (ch_error_low [12]) OR (ch_error_high [12]) ) then Shape12.Brush.Color:=clRed else  if ( not (ch_error_low [12]) AND not (ch_error_high [12]) ) then  Shape12.Brush.Color:=clLime;

            if  ( (ch_error_low [13]) OR (ch_error_high [13]) ) then Shape13.Brush.Color:=clRed else  if ( not (ch_error_low [13]) AND not (ch_error_high [13]) ) then  Shape13.Brush.Color:=clLime;
            if  ( (ch_error_low [14]) OR (ch_error_high [14]) ) then Shape14.Brush.Color:=clRed else  if ( not (ch_error_low [14]) AND not (ch_error_high [14]) ) then  Shape14.Brush.Color:=clLime;
            if  ( (ch_error_low [15]) OR (ch_error_high [15]) ) then Shape15.Brush.Color:=clRed else  if ( not (ch_error_low [15]) AND not (ch_error_high [15]) ) then  Shape15.Brush.Color:=clLime;
            if  ( (ch_error_low [16]) OR (ch_error_high [16]) ) then Shape16.Brush.Color:=clRed else  if ( not (ch_error_low [16]) AND not (ch_error_high [16]) ) then  Shape16.Brush.Color:=clLime;

        end;

              //10
 if (perc_hrom>10) then alarm;
  Panel2.Caption:= 'AHC-EF= '  + FormatFloat ( '###.##' ,  strtofloat( F_flow(Ch4)) * 0.30* 3.14 * 3600 / 27.0  ) ;
  Panel3.Caption:= 'AHC-MHF= ' + FormatFloat ( '###.##' ,  strtofloat( F_flow(Ch8)) * 0.36 * 3600 / 190.0 ) ;




  // Timer1.Enabled:=True;
end;

procedure TForm1.Timer2Timer(Sender: TObject);
begin
   if (Shape1.Brush.Color<>clLime) then  if (kitekett) then  Shape1.Brush.Color:=cLWhite  else  Shape1.Brush.Color:=clRed;
   if (Shape2.Brush.Color<>clLime) then  if (kitekett) then  Shape2.Brush.Color:=cLWhite  else  Shape2.Brush.Color:=clRed;
   if (Shape3.Brush.Color<>clLime) then  if (kitekett) then  Shape3.Brush.Color:=cLWhite  else  Shape3.Brush.Color:=clRed;
   if (Shape4.Brush.Color<>clLime) then  if (kitekett) then  Shape4.Brush.Color:=cLWhite  else  Shape4.Brush.Color:=clRed;

   if (Shape5.Brush.Color<>clLime) then  if (kitekett) then  Shape5.Brush.Color:=cLWhite  else  Shape5.Brush.Color:=clRed;
   if (Shape6.Brush.Color<>clLime) then  if (kitekett) then  Shape6.Brush.Color:=cLWhite  else  Shape6.Brush.Color:=clRed;
   if (Shape7.Brush.Color<>clLime) then  if (kitekett) then  Shape7.Brush.Color:=cLWhite  else  Shape7.Brush.Color:=clRed;
   if (Shape8.Brush.Color<>clLime) then  if (kitekett) then  Shape8.Brush.Color:=cLWhite  else  Shape8.Brush.Color:=clRed;

   if (Shape9.Brush.Color<>clLime) then  if (kitekett) then  Shape9.Brush.Color:=cLWhite  else  Shape9.Brush.Color:=clRed;
   if (Shape10.Brush.Color<>clLime) then  if (kitekett) then  Shape10.Brush.Color:=cLWhite  else  Shape10.Brush.Color:=clRed;
   if (Shape11.Brush.Color<>clLime) then  if (kitekett) then  Shape11.Brush.Color:=cLWhite  else  Shape11.Brush.Color:=clRed;
   if (Shape12.Brush.Color<>clLime) then  if (kitekett) then  Shape12.Brush.Color:=cLWhite  else  Shape12.Brush.Color:=clRed;

   if (Shape13.Brush.Color<>clLime) then  if (kitekett) then  Shape13.Brush.Color:=cLWhite  else  Shape13.Brush.Color:=clRed;
   if (Shape14.Brush.Color<>clLime) then  if (kitekett) then  Shape14.Brush.Color:=cLWhite  else  Shape14.Brush.Color:=clRed;
   if (Shape15.Brush.Color<>clLime) then  if (kitekett) then  Shape15.Brush.Color:=cLWhite  else  Shape15.Brush.Color:=clRed;
   if (Shape16.Brush.Color<>clLime) then  if (kitekett) then  Shape16.Brush.Color:=cLWhite  else  Shape16.Brush.Color:=clRed;

   //voice szaggatva
   // if (Shape1.Brush.Color<>clLime) then  if (kitekett) then   gReturnCode := fpsystem('echo "1" > /sys/class/gpio/gpio17/value')  else   gReturnCode := fpsystem('echo "0" > /sys/class/gpio/gpio17/value');


  //if (kitekett) then  BitBtn1.Glyph.Assign(aPic.Bitmap)else   BitBtn1.Glyph.Assign(bPic.Bitmap);
  if (enablealarm) then
    begin  inc(ora_sound);
     if (ora_sound=7200) then
       begin
        ora_sound:=0;
        BitBtn1Click(Self);
        EnableSound:=true;
       end;
    end;









     kitekett:=not kitekett;
end;

procedure TForm1.napontaTimer(Sender: TObject);
begin             //  2 628 000 record 1440 * 365 *5  //timer 1440 000 naponta kettyen
   //heartbeat daily mail here
  if (lastrogrek>2628000) then
    begin
       timer1.Enabled:=false;
       form7.SQLQuery2.SQL.Clear;
       form7.SQLQuery2.SQL.Add('truncate adc');
       form7.SQLQuery2.ExecSQL;
       form7.SQLTransaction2.commit;
       timer1.Enabled:=true;
    end;
end;



procedure TForm1.ExitButtonClick(Sender: TObject);
begin
  application.Terminate   ;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
  gReturnCode := fpsystem('echo "17" > /sys/class/gpio/export');
  gReturnCode := fpsystem('echo "18" > /sys/class/gpio/export');
  gReturnCode := fpsystem('echo "19" > /sys/class/gpio/export');

  gReturnCode := fpsystem('echo "out" > /sys/class/gpio/gpio17/direction');
  gReturnCode := fpsystem('echo "out" > /sys/class/gpio/gpio18/direction');
  gReturnCode := fpsystem('echo "out" > /sys/class/gpio/gpio19/direction');
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Form7.ShowModal;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
   if  not(EnableAlarm) then begin
         aPic.LoadFromFile('img/rha.bmp');    BitBtn1.Glyph.Assign(aPic.Bitmap);
         EnableAlarm:= True;
         ////gReturnCode := fpsystem('echo "1" > /sys/class/gpio/gpio17/value');
  end
   else     begin
         EnableAlarm:= False;
         aPic.LoadFromFile('img/zha.bmp');    BitBtn1.Glyph.Assign(aPic.Bitmap);
         ///gReturnCode := fpsystem('echo "0" > /sys/class/gpio/gpio17/value');
   end;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
  Form2.ShowModal;
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
begin
   if  not(reszletek) then begin
      reszletek:= true;
  end
   else     begin
      reszletek:= False;
   end;
     Timer1.OnTimer(Self);
end;


procedure TForm1.FormDestroy(Sender: TObject);
begin
  gReturnCode := fpsystem('echo "17" > /sys/class/gpio/unexport');
  gReturnCode := fpsystem('echo "18" > /sys/class/gpio/unexport');
  gReturnCode := fpsystem('echo "19" > /sys/class/gpio/unexport');
  backgroundImage.Free;
end;

procedure TForm1.FormPaint(Sender: TObject);
begin
  Canvas.Draw( 0, 0, backgroundImage );
end;

procedure TForm1.FormShow(Sender: TObject);
begin
     Timer1Timer(Self);
end;

procedure TForm1.Image1Click(Sender: TObject);
begin

end;

procedure TForm1.Image1DblClick(Sender: TObject);
begin
  shape13.brush.color:=clBlue;
end;

procedure TForm1.Label15Click(Sender: TObject);
begin

end;

procedure TForm1.Label16DblClick(Sender: TObject);
begin
  button1.visible:=true;
  exitbutton.visible:=true;
end;

procedure TForm1.Label17Click(Sender: TObject);
begin
   button1.visible:=true;
  exitbutton.visible:=true;
end;


procedure TForm1.Label17DblClick(Sender: TObject);
begin
    button1.visible:=true;
    exitbutton.visible:=true;
end;



procedure TForm1.Label21DblClick(Sender: TObject);
begin
      button1.visible:=false;
    exitbutton.visible:=false;
end;



procedure TForm1.Label21Click(Sender: TObject);
begin
    button1.visible:=false;
  exitbutton.visible:=false;
end;


procedure TForm1.Label7DblClick(Sender: TObject);
begin

end;




procedure TForm1.FormCreate(Sender: TObject);
var z   :integer;
begin
 perc_hrom:=0; ora_sound:=0;
   ///piros:=TPicture.Create;  kek:=TPicture.Create;
   ///zold:=TPicture.Create; thuzott:=TPicture.Create;
// piros.LoadFromFile('img/bha.bmp');
// kek.LoadFromFile('img/buri.bmp');
 aPic:=TPicture.Create;
 aPic.LoadFromFile('img/zha.bmp');           BitBtn1.Glyph.Assign(aPic.Bitmap);
 aPic.LoadFromFile('img/greensetup.bmp');    BitBtn2.Glyph.Assign(aPic.Bitmap);
 aPic.LoadFromFile('img/info.bmp');          BitBtn3.Glyph.Assign(aPic.Bitmap);

 button1.visible:=False;
 exitbutton.visible:=false;

 he := Screen.Height ;
 wi := Screen.Width   ;
 pi := Screen.PixelsPerInch ;
  //backgroundImage := TBitmap.Create;
  //backgroundImage.LoadFromFile(ExtractFilePath(Application.ExeName)+'background.bmp');

  EnableAlarm:= true;
  reszletek:=false;


 // Form1.CloseButton.Visible := False;
 // EnableMenuItem( GetSystemMenu( handle, False ),SC_CLOSE, MF_BYCOMMAND or MF_GRAYED );
      Os:=   GetEnvironmentVariable('HOME') ;
      if (Os='') then   Os:='Win' else Os:='Lin';
                           //    'kairbp.ini';
  if (Os='Win') then inF_:=   'kairbp.ini'; //  'x:/media/DATA/projects/.config/airbp.ini';
  if (Os='Lin')   then inF_:=    '/media/DATA/projects/.config/airbp.ini';

  IniFile:=TINIFile.Create(inF_);
    //DecimalSeparator
    DefaultFormatSettings.DecimalSeparator := ',';
    HOST_A:=IniFile.ReadString('HOST','LOCALIP' ,'');
    Datamodule1.MySQL55Connection1.HostName:=HOST_A;

    kabelsa:=TstringList.Create;   set_type:= TstringList.Create;
          for z := 1 to 16 do
          begin
                kabelsa.add(  IniFile.ReadString('LABELSA','ch'+inttostr(z) ,''));
                set_type.add( (IniFile.ReadString('ch_type','t'+inttostr(z) ,'')) );
          end;
          //listbox1.items:=kabelsa;

  {
    if (Os='Win')   then inF_DB :=  'x:/media/dev/daily.db';
    if (Os='Lin')   then inF_DB :=    '/media/dev/daily.db';

    SQLite3Connection1.DatabaseName:=inF_DB;
    SQLite3Connection1.Open;
    SQLite3Connection1.Connected := True;


    SQLQuery1.SQL.Add('select * from daily');
    SQLQuery1.ExecSQL;
    SQLQuery1.Open;
    SQLTransaction1.CommitRetaining;

    if (Os='Win')   then inF_DB_tmp :=  'x:/media/dev/fing/store.dat';
    if (Os='Lin')   then inF_DB_tmp :=  '/media/dev/fing/store.dat';

    SQLQuery1.FileName:=   inF_DB_tmp ;
    SQLQuery1.Close;
    SQLite3Connection1.Connected:=false;
    }
//    label3.caption:='Hight'+CRLF+Floattostr(Ch1) ;

    tickjatek:=      _GetTickCount();
    Getlabels;
    EnableAlarm:= false;
     //Timer1Timer(Self);
end;


    // multioser sqlite3
    //http://forum.lazarus.freepascal.org/index.php/topic,17759.msg98683.html#msg98683
    //http://forum.lazarus.freepascal.org/index.php?topic=17907.0
end.
