unit unitANAGRAMA;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    PalavraInserida: TPanel;
    PANELbotoes: TPanel;
    PANELjogo: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure BotaoLetraClick(Sender: TObject);

  private
    BotoesUsados: array of TButton;
    LetrasOriginais: array [0..8] of TButton;
    PosicoesOriginais: array [0..8] of TPoint;
    ProximaPosicao: integer;
    procedure AtualizarTexto;
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
  SetLength(BotoesUsados, 0);
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
  i, indice: integer;
  ValorEncontrado: Boolean;
begin
  Botao := TButton(Sender);
  ValorEncontrado:= False;

  if (Botao.Parent = PANELbotoes) then
  begin
    Botao.Parent := PalavraInserida;
    Botao.Left := 500 + (ProximaPosicao * 60);

    SetLength(BotoesUsados, Length(BotoesUsados) + 1);
    BotoesUsados[ProximaPosicao] := Botao;

    Inc(ProximaPosicao);
  end
  else if (Botao.Parent = PalavraInserida) then
  begin
    Botao.Parent := PANELbotoes;
    Botao.Left := 10 + (Botao.Tag * 60);

    for i := 0 to High(BotoesUsados) do
    begin
        if (BotoesUsados[i] = Botao) then
        begin
          indice := i;
          ValorEncontrado := True;
          Break;
        end;
    end;
    if ValorEncontrado then
    begin
      for i := indice to High(BotoesUsados) - 1 do
      begin
          BotoesUsados[i] := BotoesUsados[i + 1];
      end;
    end;
    Dec(ProximaPosicao);
  end;


end;

procedure TForm1.AtualizarTexto;
var
  i: integer;
  palavraFormada: string;
begin
  palavraFormada := '';

  for i := 0 to High(BotoesUsados) do
  begin
    palavraFormada := palavraFormada + BotoesUsados[i].Caption;

  end;
end;

end.

