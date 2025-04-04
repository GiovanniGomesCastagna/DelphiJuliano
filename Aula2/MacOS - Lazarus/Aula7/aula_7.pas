unit Aula_7;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Buttons, ExtCtrls,
  Math;

type

  { TForm1 }

  TForm1 = class(TForm)
    Timer: TTimer;
    procedure FormShow(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
  private
    FContador: integer;
    FImagemSelecionada: TImage;
    function SortearImagem: string;
    procedure EventoAoEntrarNaImagem(Sender: TObject);
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }


procedure TForm1.FormShow(Sender: TObject);
const
  QTD_COLUNAS = 10;
  QTD_LINHAS = 10;
  BTN_SIZE = 64;
var
  button: TImage;
  ColIndex: integer;
  LinIndex: integer;
begin
  for ColIndex := 1 to QTD_COLUNAS do
  begin
    for LinIndex := 1 to QTD_LINHAS do
    begin
      button:= TImage.Create(Self);
      button.Parent:= Self;
      button.Height:= BTN_SIZE;
      button.Width:= BTN_SIZE;
      button.Picture.LoadFromFile(SortearImagem);
      button.Left:= (ColIndex - 1) * BTN_SIZE;
      button.Top:= (LinIndex - 1) * BTN_SIZE;
      button.OnMouseEnter:= @EventoAoEntrarNaImagem;
    end;
  end;
end;

procedure TForm1.TimerTimer(Sender: TObject);
var
  Stream: TFileStream;
begin
  if Assigned(FImagemSelecionada) then
  begin
    Stream:= TFileStream.Create(SortearImagem, 0);
    try
      FImagemSelecionada.Picture.LoadFromStream(Stream);
      FImagemSelecionada.Repaint;
    finally
      Stream.Free;
    end;
  end;
end;



function TForm1.SortearImagem: string;
const
  DIR = '/Users/giovannigomescastagna/Documents/Linguagem de Programação I/DelphiJuliano/DelphiJuliano/Aula2/MacOS - Lazarus/Aula7/';
  EXT = '.PNG';
var
  index: integer;
begin
  index:= RandomRange(1, 6);
  Result := DIR + 'Imagem' + index.toString + EXT;
end;

procedure TForm1.EventoAoEntrarNaImagem(Sender: TObject);
var
  Stream : TFileStream;
begin
  Stream := TFileStream.Create(SortearImagem, 0);
  try
    TImage(Sender).Picture.LoadFromStream(Stream);
    TImage(Sender).Repaint;
    FImagemSelecionada := TImage(Sender);
    Inc(FContador);
    Self.Caption:= 'Trocas: ' + FContador.ToString;
  finally
    Stream.Free;
  end;

end;

end.

