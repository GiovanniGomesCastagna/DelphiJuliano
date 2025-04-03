unit uTesteBrabo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Samples.Spin, Vcl.CheckLst, Vcl.FileCtrl, Vcl.ComCtrls, Vcl.WinXCtrls,
  Vcl.Mask, Vcl.Imaging.jpeg;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    RadioGroup1: TRadioGroup;
    Panel2: TPanel;
    CheckBox1: TCheckBox;
    Label1: TLabel;
    MeuEdit: TEdit;
    ComboBox3: TComboBox;
    GroupBox1: TGroupBox;
    Memo: TMemo;
    DateTimePicker1: TDateTimePicker;
    MonthCalendar1: TMonthCalendar;
    DriveComboBox1: TDriveComboBox;
    CheckListBox1: TCheckListBox;
    GroupBox: TGroupBox;
    SpinEdit1: TSpinEdit;
    ColorBox1: TColorBox;
    MaskEdit1: TMaskEdit;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    ToggleSwitch1: TToggleSwitch;
    RichEdit: TRichEdit;
    ComboBox1: TComboBox;
    CheckBox2: TCheckBox;
    Button1: TButton;
    Button2: TButton;
    ColorListBox1: TColorListBox;
    Image1: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

end.
