program Exercicio_14;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  Classes, SysUtils, CustApp , fgl, Generics.Collections
  { you can add units after this };

type
  TProduto = Record
    Descricao: string;
    Valor: double;
  end;
  TDicionario = specialize TDictionary<Integer, TProduto>;

var
  ListaProdutos: TDicionario;
  Produto: TProduto;

begin
  ListaProdutos := TDicionario.Create;

  Produto.Descricao:= 'Mochila';
  Produto.Valor:= 100.0;

  ListaProdutos.Add(1, Produto);

  Readln;
end.
