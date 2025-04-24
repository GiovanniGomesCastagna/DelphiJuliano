unit unitLazarus;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls, LCLType, Generics.Collections, LazUTF8, LazUtils, StrUtils;

type

  { TForm1 }

  TForm1 = class(TForm)
    edtPesquisa: TEdit;
    Contador: TLabel;
    panelGeral: TPanel;
    panelPesquisa: TPanel;
    procedure edtPesquisaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    FPaises: TStringList;
    FPontuacao: Integer;
    procedure CriarObjetosPaises;
    function CriptografarPalavras(APalavra: string): string;
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.CriarObjetosPaises;
const
  PALAVRAS_POR_PANEL = 25;
var
  Panel: TPanel;
  Pais: TLabel;
  i: integer;
begin
  for i := FPaises.Count - 1 downto 0 do
  begin
    if (i = FPaises.Count - 1) or ((i + 1) mod PALAVRAS_POR_PANEL = 0) then
    begin
      Panel := TPanel.Create(Self);
      Panel.Parent := panelGeral;
      Panel.Align := alLeft;
      Panel.Width := 280;
    end;

    Pais := TLabel.Create(Self);
    Pais.Parent := Panel;
    Pais.Align := alTop;
    Pais.Alignment := taCenter;
    Pais.Font.Size := 8;
    Pais.Caption := CriptografarPalavras(FPaises[i]);
    Pais.Name := 'LabelPais' + IntToStr(i);
  end;
end;


function RemoverAcentos(const Texto: string): string;
const
  Acentos = 'áàãâäéèêëíìîïóòõôöúùûüçÁÀÃÂÄÉÈÊËÍÌÎÏÓÒÕÔÖÚÙÛÜÇ';
  SemAcentos = 'aaaaaeeeeiiiiooooouuuucAAAAAEEEEIIIIOOOOOUUUUC';
var
  i, j: Integer;
  c: Char;
begin
  Result := Texto;
  for i := 1 to Length(Result) do
  begin
    c := Result[i];
    j := Pos(c, Acentos);
    if j > 0 then
      Result[i] := SemAcentos[j];
  end;
end;


function TForm1.CriptografarPalavras(APalavra: string): string;
var
  ConjuntoPalavras: array of string;
  Palavra, PalavraCriptografada: string;
begin
  Result := '';
  ConjuntoPalavras := APalavra.Trim.Split([' ', '-']);

  for Palavra in ConjuntoPalavras do
  begin

    if Palavra = '' then Continue;

    PalavraCriptografada := UpperCase(Palavra[1]) + string.Empty.PadLeft(Palavra.Length - 1, '?');

    if Result.IsEmpty then
      Result := PalavraCriptografada
    else
      Result := Result + ' ' + PalavraCriptografada;
    end;
end;

procedure CarregarListaUTF8(Arquivo: string; Lista: TStrings);
var
  Stream: TFileStream;
  SS: TStringStream;
begin
  Stream := TFileStream.Create(Arquivo, fmOpenRead or fmShareDenyWrite);
  try
    SS := TStringStream.Create('', TEncoding.UTF8);
    try
      SS.CopyFrom(Stream, Stream.Size);
      SS.Position := 0;
      Lista.Text := SS.DataString;
    finally
      SS.Free;
    end;
  finally
    Stream.Free;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  ListaPaises: TStringList;
begin
  ListaPaises := TStringList.Create;
  try

    ListaPaises.LoadFromFile('C:\Users\Giovanni\Documents\ProjetoTrivia_Lazarus\Paises.txt', TEncoding.UTF8);
    FPontuacao := 0;
    Contador.Caption := 'Pontuação: ' + IntToStr(FPontuacao);

    FPaises := TStringList.Create;
    FPaises.Assign(ListaPaises);

    CriarObjetosPaises;
  finally
    ListaPaises.Free;
  end;
end;


procedure TForm1.edtPesquisaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  i: integer;
  TextoPesquisa, PaisNormalizado: string;
  LabelPais: TLabel;
  Componente: TComponent;
  PaisEncontrado: Boolean;
  NomeLabel: string;
begin
  if Key = VK_RETURN then
  begin
    TextoPesquisa := Trim(edtPesquisa.Text);
    PaisEncontrado := False;

    for i := 0 to FPaises.Count - 1 do
    begin
      PaisNormalizado := Trim(FPaises[i]);


      if UpperCase(AnsiReplaceStr(RemoverAcentos(PaisNormalizado), ' ', '')) =
         UpperCase(AnsiReplaceStr(RemoverAcentos(TextoPesquisa), ' ', '')) then
      begin
        NomeLabel := 'LabelPais' + IntToStr(i);
        Componente := FindComponent(NomeLabel);

        if (Componente <> nil) and (Componente is TLabel) then
        begin
          LabelPais := TLabel(Componente);
          LabelPais.Caption := FPaises[i];
          LabelPais.Font.Style := [fsUnderline];
          LabelPais.Font.Color := clBlue;

          Inc(FPontuacao);
          Contador.Caption := 'Pontuação: ' + IntToStr(FPontuacao);


          edtPesquisa.Clear;
          PaisEncontrado := True;
          Break;
        end
        else
        begin
          ShowMessage('Label "' + NomeLabel + '" não encontrado ou não é um TLabel.');
        end;
      end;
    end;

    if not PaisEncontrado then
    begin
      ShowMessage('País não encontrado na lista.');
    end;
  end;
end;




end.

