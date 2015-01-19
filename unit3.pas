unit Unit3;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, INIFiles, sqldb  ;

type

  { TForm3 }

  TForm3 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label3: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    SQLQuery1: TSQLQuery;
    SQLTransaction1: TSQLTransaction;
    TrackBar1: TTrackBar;
    TrackBar10: TTrackBar;
    TrackBar11: TTrackBar;
    TrackBar12: TTrackBar;
    TrackBar13: TTrackBar;
    TrackBar14: TTrackBar;
    TrackBar15: TTrackBar;
    TrackBar16: TTrackBar;
    TrackBar2: TTrackBar;
    TrackBar3: TTrackBar;
    TrackBar4: TTrackBar;
    TrackBar5: TTrackBar;
    TrackBar6: TTrackBar;
    TrackBar7: TTrackBar;
    TrackBar8: TTrackBar;
    TrackBar9: TTrackBar;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TrackBar10Change(Sender: TObject);
    procedure TrackBar11Change(Sender: TObject);
    procedure TrackBar12Change(Sender: TObject);
    procedure TrackBar13Change(Sender: TObject);
    procedure TrackBar14Change(Sender: TObject);
    procedure TrackBar15Change(Sender: TObject);
    procedure TrackBar16Change(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure TrackBar2Change(Sender: TObject);
    procedure TrackBar3Change(Sender: TObject);
    procedure TrackBar4Change(Sender: TObject);
    procedure TrackBar5Change(Sender: TObject);
    procedure TrackBar6Change(Sender: TObject);
    procedure TrackBar7Change(Sender: TObject);
    procedure TrackBar8Change(Sender: TObject);
    Function  naphal (v , z: integer):boolean;
    procedure TrackBar9Change(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form3: TForm3;
  ahc, mleft, mwidth , flastposition1: integer;
  ini: string;
  IniFile  : TIniFile;
  Counter: Integer = 0;   StoredShift: TShiftState;
     ctrl: TButton;
implementation

uses unit1, Unit5;

{$R *.lfm}

{ TForm3 }


Function TForm3.naphal (v ,z : integer):boolean;
var lbl: TLabel;
suger : extended;  ponty ,s : string;
begin
        case v  of
             1  :  s   :=  '48ch0' ;
             2  :  s   :=  '48ch1' ;
             3  :  s   :=  '48ch2' ;
             4  :  s   :=  '48ch3' ;
             5  :  s   :=  '49ch0' ;
             6  :  s   :=  '49ch1' ;
             7  :  s   :=  '49ch2' ;
             8  :  s   :=  '49ch3' ;
             9  :  s   :=  '4bch0' ;
            10  :  s   :=  '4bch1' ;
            11  :  s   :=  '4bch2' ;
            12  :  s   :=  '4bch3' ;
            13  :  s   :=  '50ch0' ;
            14  :  s   :=  '50ch1' ;
            15  :  s   :=  '50ch2' ;
            16  :  s   :=  '50ch3' ;
         end;


       //for i:=1 to 16 do
       //begin
       //    lbl := (FindComponent('Label'+IntToStr(i)) as TLabel);
       //    lbl.Caption := IntToStr(i);
       // end;
 lbl := (FindComponent('Label'+IntToStr(v)) as TLabel);
       DefaultFormatSettings.DecimalSeparator := '.';
       suger:=0.0003 + z /10.01;       //suger:=0.0003 + trackbar16.Position /10.01;
       ponty :=  floattostr(suger);
       Datamodule1.SQLQuery2.SQL.Clear;
       Datamodule1.SQLQuery2.SQL.Add('update adc SET '+s+' = ' +  ponty +'ORDER BY Id DESC  LIMIT 3');
       Datamodule1.SQLQuery2.ExecSQL;
       DefaultFormatSettings.DecimalSeparator := ',';
       lbl.Caption := ponty;        //label16.caption:=ponty;
result:=true;
end;

procedure TForm3.TrackBar9Change(Sender: TObject);
begin
     naphal(9 ,Trackbar9.Position);
end;


procedure TForm3.FormCreate(Sender: TObject);
begin
  ini:=     Form1.inF_ ;
  IniFile:=TINIFile.Create(ini);

end;

procedure TForm3.TrackBar10Change(Sender: TObject);
begin
     naphal(10 ,Trackbar10.Position);
end;

procedure TForm3.TrackBar11Change(Sender: TObject);
begin
     naphal(11 ,Trackbar11.Position);
end;

procedure TForm3.TrackBar12Change(Sender: TObject);
begin
     naphal(12 ,Trackbar12.Position);
end;

procedure TForm3.TrackBar13Change(Sender: TObject);
begin
     naphal(13 ,Trackbar13.Position);
end;

procedure TForm3.TrackBar14Change(Sender: TObject);
begin
     naphal(14 ,Trackbar14.Position);
end;

procedure TForm3.TrackBar15Change(Sender: TObject);
begin
     naphal(15 ,Trackbar15.Position);
end;

procedure TForm3.TrackBar16Change(Sender: TObject);
begin
     naphal(16 ,Trackbar16.Position);
end;

procedure TForm3.Button1Click(Sender: TObject);
begin
  form3.close;
end;

procedure TForm3.Button2Click(Sender: TObject);
begin
   Datamodule1.SQLTransaction1.Rollback;
end;


procedure TForm3.TrackBar1Change(Sender: TObject);
begin
     naphal(1 ,Trackbar1.Position);
End;


procedure TForm3.TrackBar2Change(Sender: TObject);
begin
     naphal(2 ,Trackbar2.Position);
end;

procedure TForm3.TrackBar3Change(Sender: TObject);
begin
     naphal(3 ,Trackbar3.Position);
end;

procedure TForm3.TrackBar4Change(Sender: TObject);
begin
     naphal(4 ,Trackbar4.Position);
end;

procedure TForm3.TrackBar5Change(Sender: TObject);
begin
     naphal(5 ,Trackbar5.Position);
end;

procedure TForm3.TrackBar6Change(Sender: TObject);
begin
     naphal(6 ,Trackbar6.Position);
end;

procedure TForm3.TrackBar7Change(Sender: TObject);
begin
     naphal(7 ,Trackbar7.Position);
end;

procedure TForm3.TrackBar8Change(Sender: TObject);
begin
     naphal(8 ,Trackbar8.Position);
end;



end.

