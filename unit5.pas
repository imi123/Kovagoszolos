unit Unit5;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, mysql55conn, sqldb,  FileUtil, ExtCtrls;

type

  { TDataModule1 }

  TDataModule1 = class(TDataModule)
    MySQL55Connection1: TMySQL55Connection;
    SQLQuery1: TSQLQuery;
    SQLQuery2: TSQLQuery;
    SQLTransaction1: TSQLTransaction;

  private
    { private declarations }
  public
    { public declarations }

  end;

var
  DataModule1: TDataModule1;

implementation

{$R *.lfm}

{ TDataModule1 }



end.

