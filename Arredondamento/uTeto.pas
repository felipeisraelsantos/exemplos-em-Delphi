unit uTeto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    edt1: TEdit;
    lbl1: TLabel;
    btn1: TButton;
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Math;

{$R *.dfm}

procedure TForm1.btn1Click(Sender: TObject);
var
  i : Double;
begin
  i := RoundTo(StrToFloat(edt1.Text),-2);

  lbl1.Caption := FloatToStr(i);

end;

end.
