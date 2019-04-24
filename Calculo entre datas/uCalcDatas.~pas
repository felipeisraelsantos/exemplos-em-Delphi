unit uCalcDatas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DateUtils;

type
  TForm1 = class(TForm)
    dt1: TDateTimePicker;
    dt2: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    edDias: TEdit;
    edMes: TEdit;
    edAno: TEdit;
    Button1: TButton;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  edDias.Text := IntToStr(DaysBetween(dt1.Date,
    dt2.Date));
  edMes.Text := IntToStr(MonthsBetween(dt1.Date,
    dt2.Date));
  edAno.Text := IntToStr(YearsBetween(dt1.Date,
    dt2.Date));
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  edDias.Text := DateToStr(IncDay(dt1.Date, 10));
  edmes.Text := DateToStr(IncMonth(dt1.Date, 10));
  edano.Text := DateToStr(IncYear(dt1.Date, 10));
end;

end.
