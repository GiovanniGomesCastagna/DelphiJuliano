unit unitANAGRAMA;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls, Generics.Collections;

type

  { TForm1 }

  TForm1 = class(TForm)
    RANDOMIZEbotao: TButton;
    DELETEbutton: TButton;
    PalavraInserida: TPanel;
    PANELpalavras: TPanel;
    PANELbotoes: TPanel;
    PANELjogo: TPanel;
    procedure DELETEbuttonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BotaoLetraClick(Sender: TObject);
    procedure RANDOMIZEbotaoClick(Sender: TObject);

  private
    BotoesUsados: array of TButton;
    LetrasOriginais: array [0..8] of TButton;
    PosicoesOriginais: array [0..8] of TPoint;
    ListaLabel: array of TLabel;
    PalavraFormada: string;
    FPalavras: TStringList;
    ProximaPosicao: integer;
    procedure AtualizarTexto;
    procedure RealocarBotoes;
    procedure AtribuirLista;
    procedure CriarPanelsPalavras;
    procedure VerificarPalavras;
    procedure DeletarLetras;
    procedure RandomizarLetras;

  public

  end;
const
  QUANTIDADE_ELEMENTOS = 9;
  LetrasOrdenadas: array[0..8] of Char = ('C', 'C', 'G', 'I', 'I', 'O', 'R', 'R', 'U');
var
  Form1: TForm1;
  Letras: array of string;


implementation

// ------------------------VV Funções e Procedures VV --------------------------
{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
var
  i: integer;
  btn: TButton;

begin
  SetLength(Letras, QUANTIDADE_ELEMENTOS);
  SetLength(BotoesUsados, 0);
  ProximaPosicao := 0;

  for i := 0 to High(Letras) do
    Letras[i] := LetrasOrdenadas[i];

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
      PANELbotoes.Width := PANELbotoes.Width + 60;
      LetrasOriginais[i] := btn;
      PosicoesOriginais[i] := Point(btn.Left, btn.Top);
  end;

  AtribuirLista;

end;

procedure TForm1.DELETEbuttonClick(Sender: TObject);
begin
  DeletarLetras;
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
    PalavraInserida.Width := PalavraInserida.Width + 60;
    Botao.Parent := PalavraInserida;
    Botao.Left := 10 + (ProximaPosicao * 60);

    SetLength(BotoesUsados, Length(BotoesUsados) + 1);
    BotoesUsados[ProximaPosicao] := Botao;

    Inc(ProximaPosicao);

    AtualizarTexto;
    VerificarPalavras;
  end
  else if (Botao.Parent = PalavraInserida) then
  begin
    PalavraInserida.Width := PalavraInserida.Width - 60;
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
      SetLength(BotoesUsados, Length(BotoesUsados) - 1);
      Dec(ProximaPosicao);

      AtualizarTexto;
      VerificarPalavras;
      RealocarBotoes;
    end;

  end;


end;

procedure TForm1.RANDOMIZEbotaoClick(Sender: TObject);
begin
  RandomizarLetras;
end;

procedure TForm1.AtualizarTexto;
var
  i: integer;

begin
  PalavraFormada := '';

  for i := 0 to High(BotoesUsados) do
  begin
    PalavraFormada := palavraFormada + BotoesUsados[i].Caption;

  end;
end;

procedure TForm1.RealocarBotoes;
var
  i: integer;
begin
  for i:= 0 to High(BotoesUsados) do
  begin
    BotoesUsados[i].Left := 10 + (i * 60);
  end;
end;

procedure TForm1.AtribuirLista;
var
  ListaPalavras: TStringList;
begin
  ListaPalavras:= TStringList.Create;
  try
    ListaPalavras.LoadFromFile('lista.txt', TEncoding.UTF8);

    FPalavras := TStringList.Create;
    FPalavras.Assign(ListaPalavras);

    CriarPanelsPalavras;
  finally
    ListaPalavras.Free;
  end;

end;

procedure TForm1.CriarPanelsPalavras;
const
  PALAVRAS_POR_PANEL = 15;
var
  Panel: TPanel;
  Palavra: TLabel;
  i: integer;
begin
  SetLength(ListaLabel, FPalavras.Count);

  for i := FPalavras.Count - 1 downto 0 do
  begin
    if (i = FPalavras.Count - 1) or ((i + 1) mod PALAVRAS_POR_PANEL = 0) then
    begin
      Panel := TPanel.Create(Self);
      Panel.Parent := PANELpalavras;
      Panel.Align := alLeft;
      Panel.Top := 200;
      Panel.Height := 300;
      Panel.Width := 280;
      Panel.BevelOuter := bvNone;
      Panel.BevelInner := bvNone;
    end;

    ListaLabel[i] := TLabel.Create(Self);
    ListaLabel[i].Parent := Panel;
    ListaLabel[i].Align := alTop;
    ListaLabel[i].Top := 20;
    ListaLabel[i].Alignment := taCenter;
    ListaLabel[i].Font.Size := 10;
    ListaLabel[i].Caption := StringOfChar('*', Length(FPalavras[i]));
  end;
end;

procedure TForm1.VerificarPalavras;
var
  i: integer;
begin
  for i := 0 to FPalavras.Count - 1 do
  begin
    if (PalavraFormada = FPalavras[i]) then
    begin
      ListaLabel[i].Caption := FPalavras[i];

      ListaLabel[i].Font.Color := clGreen;
      ListaLabel[i].Font.Style := [fsBold, fsUnderline];

      FPalavras.Delete(i);
      DeletarLetras;
      Exit;
    end;
  end;
end;

procedure TForm1.DeletarLetras;
var
  i: integer;
  Botao: TButton;
begin
  for i := 0 to High(BotoesUsados) do
  begin
    Botao := BotoesUsados[i];
    Botao.Parent := PANELbotoes;
    Botao.Left := 10 + (Botao.Tag * 60);
  end;

  PalavraFormada:= '';
  SetLength(BotoesUsados, 0);
  ProximaPosicao := 0;
  PalavraInserida.Width := 10;
end;

procedure TForm1.RandomizarLetras;
var
  iIndex: array of integer;
  i, j, k: integer;
begin
  Randomize;

  SetLength(Letras, QUANTIDADE_ELEMENTOS);

  SetLength(iIndex, QUANTIDADE_ELEMENTOS);
  for i := 0 to Pred(QUANTIDADE_ELEMENTOS) do
    iIndex[i] := i;

  for i := 0 to High(Letras) do
  begin
    j := Random(Length(iIndex));
    Letras[i] := LetrasOrdenadas[iIndex[j]];

    for k := j to High(iIndex) - 1 do
      iIndex[k] := iIndex[k + 1];

    SetLength(iIndex, Length(iIndex) - 1);
  end;

  for i := 0 to High(LetrasOriginais) do
  begin
    LetrasOriginais[i].Caption := Letras[i];
  end;

  DeletarLetras;
end;

end.

