unit unitANAGRAMA;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    PalavraInseridaEDT: TEdit;
    PANELbotoes: TPanel;
    PANELjogo: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure BotaoLetraClick(Sender: TObject);

  private
    LetrasOriginais: array [0..8] of TButton;
    PosicoesOriginais: array [0..8] of TPoint;
    ProximaPosicao: integer;

  public

  end;
const
  Letras: array[0..8] of Char = ('C', 'C', 'G', 'I', 'I', 'O', 'R', 'R', 'U');
var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
var
  i: integer;
  btn: TButton;
begin
  ProximaPosicao := 0;

  for i := 0 to High(Letras) do
  begin
      btn := TButton.Create(Self);
      btn.Parent:= PANELbotoes;
      btn.Caption:= Letras[i];
      btn.Width := 50;
      btn.Height := 50;
      btn.Left := 10 + (i * 60);
      btn.Top := 7;
      btn.Tag := i;
      btn.OnClick := @BotaoLetraClick;

      LetrasOriginais[i] := btn;
      PosicoesOriginais[i] := Point(btn.Left, btn.Top);
  end;

end;

procedure TForm1.BotaoLetraClick(Sender: TObject);
var
  Botao: TButton;
begin
  Botao := TButton(Sender);

  if (Botao.Parent = PANELbotoes) then
  begin
    PalavraInseridaEDT.Text := PalavraInseridaEDT.Text + Botao.Caption;
    Botao.Parent := PalavraInseridaEDT;
    Botao.Left := 10 + (ProximaPosicao * 60);
    Inc(ProximaPosicao);
  end
  else if (Botao.Parent = PalavraInseridaEDT) then
  begin
    PalavraInseridaEDT.Text := PalavraInseridaEDT.Text + Botao.Caption;
    Botao.Parent := PANELbotoes;
    Botao.Left := 10 + (Botao.Tag * 60);
  end;

end;

end.

