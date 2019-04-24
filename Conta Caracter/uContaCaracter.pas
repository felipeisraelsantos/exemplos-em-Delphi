unit uContaCaracter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, StrUtils;

type
  TForm1 = class(TForm)
    edt1: TEdit;
    lbl1: TLabel;
    btn1: TButton;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btn1Click(Sender: TObject);
begin
     lbl1.Caption :=  IntToStr(Length(edt1.Text));
   //  lbl4.Caption := Copy(edt1.Text, 1, Pos('-', edt1.Text));
     lbl4.Caption :=   IntToStr(Pos(' ',edt1.Text));
end;

end.
