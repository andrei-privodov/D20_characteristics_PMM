unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Vcl.Grids, VclTee.TeeGDIPlus, Data.DB, VCLTee.TeEngine,
  VCLTee.TeeFunci, VCLTee.Series, VCLTee.DBChart, Vcl.ExtCtrls, VCLTee.TeeProcs,
  VCLTee.Chart;

type
  TForm2 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    StringGrid1: TStringGrid;
    DBChart2: TDBChart;
    Series2: TLineSeries;
    Button1: TButton;
    Chart2: TChart;
    Series4: TLineSeries;
    Chart1: TChart;
    Series1: TLineSeries;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);



  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses Unit1, Unit3;

{$R *.DFM}

procedure TForm2.BitBtn1Click(Sender: TObject);
var i:integer;
      var n:integer;
begin

                 with series1 do
for n:=1 to Form2.StringGrid1.RowCount-1 do
Series1.AddXY(strtofloat(form2.StringGrid1.Cells[1,n]),
              strtofloat(form2.StringGrid1.Cells[2,n]),'',clRed);

                               with series2 do
for n:=1 to Form2.StringGrid1.RowCount-1 do
Series2.AddXY(strtofloat(form2.StringGrid1.Cells[1,n]),
              strtofloat(form2.StringGrid1.Cells[3,n]),'',clRed);

                                             with series4 do
for n:=1 to Form2.StringGrid1.RowCount-1 do
Series4.AddXY(strtofloat(form2.StringGrid1.Cells[1,n]),
              strtofloat(form2.StringGrid1.Cells[4,n]),'',clRed);


end;

procedure TForm2.BitBtn2Click(Sender: TObject);
      var i,j:integer;
begin
    For i:=1 To Ad do Begin
      form1.P[i]:=0;
      form1.M[i]:=0;
    End;
    with stringgrid1 do
        for j := 1 to colcount-1 do

 for i:=1 to rowcount-1 do
   cells[j,i]:=' ';
series1.Clear;
series2.Clear    ;
series4.Clear;
Form2.Close;

end;


procedure TForm2.Button1Click(Sender: TObject);
 var i,j:integer;
begin
    For i:=1 To Ad do Begin
      form1.P[i]:=0;
      form1.M[i]:=0;
    End;
    with stringgrid1 do
        for j := 1 to colcount-1 do

 for i:=1 to rowcount-1 do
   cells[j,i]:=' ';
series1.Clear;
series2.Clear    ;
series4.Clear;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
       StringGrid1.cells[0,0]:='¹';
  StringGrid1.cells[1,0]:='Ò';
  StringGrid1.cells[2,0]:='P';
  StringGrid1.cells[3,0]:='Ì';
  StringGrid1.cells[4,0]:=' ';


end;


end.
