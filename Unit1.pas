unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Math,Buttons;

type
  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    Edit7: TEdit;
    Edit8: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    Edit9: TEdit;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Label11: TLabel;
    Label12: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
   procedure Edit1DblClick(Sender: TObject);
    procedure Edit2DblClick(Sender: TObject);
    procedure Edit3DblClick(Sender: TObject);

  private
    { Private declarations }
  public
     P:array[1..1100]of real;      {����������� ������ ����� 1}
     M: array[1..1100]of real;      {����������� ������ ����� 2}
     ygol:array[1..1100]of  real;
     T:Real;
    { Public declarations }
  end;

var
  Form1: TForm1;
  m1,m2,J1,J2,G1,G2,L:Real;   {������}
  S,S1,S2,F,F1,F2:Real;       {���������� ������� ����}
  i,j,Ad:Integer;                  {�������}
  x,K,w:Real;                   {���������� ������� ����}

implementation

uses Unit2, unit3;

{$R *.DFM}

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
    {���� ������}

    with form2.stringgrid1 do
        for j := 1 to colcount-1 do

          for i:=1  to rowcount-1 do
          rows[i].clear;
   Form2.StringGrid1.RowCount:=1;
   m1:=StrToFloat(Edit1.Text); m1:=Int(m1); {����� 1 �����}
   m2:=StrToFloat(Edit2.Text); m2:=(Int(m2*100))/100; {����� 1 �����}
   J1:=StrToFloat(Edit3.Text); J1:=(Int(J1*100))/100; {������ ������� 1 �����}
   J2:=StrToFloat(Edit4.Text); J2:=(Int(J2*100))/100; {������ ������� 2 �����}
   G1:=StrToFloat(Edit5.Text); G1:=(Int(G1*100))/100; {��������� ����}
   G2:=StrToFloat(Edit6.Text); G2:=(Int(G2*100))/100; {�������� ����}
   L:=StrToFloat(Edit7.Text); L:=(Int(L*100))/100;    {����� �����}
   T:=StrToFloat(Edit8.Text); T:=(Int(T*100))/100;    {������ ��������}
   Ad:=StrToInt(edit9.Text) ;
    {��������� ����� ������}
                           x:=0;
K:=2*pi*(G1+(G2-G1))/360;
               {������ ���������� ����������� ��������}
For i:=1 To Ad do Begin
  P[i]:=0;
    M[i]:=0;
    F1:=0;
    F:=0;
    F2:=0;
    S:=0;
    S1:=0;
    S2:=0;
  x:=x+T/Ad;
     IF form1.CheckBox1.checked then Begin
 {����� F,F1,F2 (���� �������� ����� 2, ������� ��������, ������� ���������)}
 {���� ������������������ �����!}
  F:=(3.14/6*(3.14/3-3.14/6))+(x/T-1/(2*3.14)*sin((2*3.14*x)/T)); {���� ������ �������� F(��)}
  F1:=(3.14/3-3.14/6)*(1-cos(2*3.14*x/T))*1/T;                    {���� ������ �������� F(��) � ����� ������}
  F2:=2*3.14*(3.14/3-3.14/6)*sin(2*3.14*x/T)*1/sqr(T);            {���� ������ �������� F(��) � ����� �������}
End;
IF form1.CheckBox2.checked then Begin
  {���� ������������� �����!}
  F:=(3.14/3)*((10*power(x,3))-(15*power(x,4))+(6*power(x,5)));     {���� ������ �������� F(��)}
  F1:=(3.14/3)*((30*power(x,2))-(60*power(x,3))+(30*power(x,4)));   {���� ������ �������� F(��) � ����� ������}
  F2:=(3.14/3)*((60*power(x,1))-(180*power(x,2))+(120*power(x,3))); {���� ������ �������� F(��) � ����� �������}
End;
    {����������� S(���� �������� ����� 1) �� F (���� �������� ����� 2)}

{1} S:=2*L/cos(F)*(1-sin(F));                           {���� ������ �������� S  }
     S1:=2*L*F1/(cos(F)*cos(F))*(sin(F)-1);             {���� ������ �������� S � ����� ������ }
     S2:=2*L/cos(F)*(sqr(F1)+(sin(F)-1)/cos(F)*(2*sqr(F1)*sin(F)/cos(F)+F2));   {���� ������ �������� S � ����� ������� }

{2}    IF form1.CheckBox1.checked then Begin
  ygol[i]:=(G1+(G2-G1))*(x/T-(1/(3.14*2))*sin(2*3.14*x/T));  {�� �������}
End;
IF form1.CheckBox2.checked then Begin
  ygol[i]:=((G1+(G2-G1))*(10-15*x/T+6*sqr(x)/sqr(T))*sqr(x)*x/(sqr(T)*T));  {�� �������}
End;
  {���������������� ����������}
  {���� ������ ������� �} M[i]:=(J1+J2)*F2+2*m1*S*S1*F1+m1*(sqr(L)+sqr(S))*F2+m1*L*S2;
  {���� ������ ������� M} P[i]:=m1*F2*L-m1*sqr(F1)*S;



  Form2.StringGrid1.cells[0,i]:=inttostr(i);
  Form2.StringGrid1.cells[1,i]:=floattostr(Round(x*1000)/1000);
  Form2.StringGrid1.cells[2,i]:=floattostr(Round(P[i]*100)/100) ;
  Form2.StringGrid1.cells[3,i]:=floattostr(Round(M[i]*100)/100 ) ;
  Form2.StringGrid1.cells[4,i]:=floattostr(Round(ygol[i]*100)/100 ) ;
  Form2.StringGrid1.RowCount:=Form2.StringGrid1.RowCount+1;
  End;

     Form2.Show;    End;


procedure TForm1.BitBtn2Click(Sender: TObject);
begin
Form2.Show;
end;



procedure TForm1.Edit1DblClick(Sender: TObject);
begin
edit1.clear;
end;

procedure TForm1.Edit2DblClick(Sender: TObject);
begin
edit2.clear;
end;

procedure TForm1.Edit3DblClick(Sender: TObject);
begin
edit3.clear;
end;



end.
