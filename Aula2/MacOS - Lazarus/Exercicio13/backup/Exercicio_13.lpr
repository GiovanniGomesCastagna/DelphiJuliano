program Exercicio_13;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  Classes, SysUtils, CustApp
  { you can add units after this };

var
  numeroProdutos, i: integer;
  producao, venda: array of real;
  totalProducao, totalVenda: real;
  lucro: real;

begin
  writeln('Insira a quantidade de produtos a serem calculados: ');
  readln(numeroProdutos);

  setlength(producao, numeroProdutos);
  setlength(venda, numeroProdutos);
  totalProducao:= 0;
  totalVenda:= 0;

  for i := 0 to numeroProdutos - 1 do
  begin
    writeln(Format('Insira o valor de custo do produto numero %d:', [i]));
    readln(producao[i]);
    totalProducao:= (totalProducao + producao[i]);

    writeln(Format('Insira o valor de venda do produto numero %d:', [i]));
    readln(venda[i]);
    totalVenda:= (totalVenda + venda[i]);
   end;

  writeln(Format('A media do preco de custo dos produtos foi de R$ %.2f', [totalProducao / numeroProdutos]));
  writeln(Format('A media do preco de venda dos produtos foi de R$ %.2f', [totalVenda / numeroProdutos]));
  lucro:= totalVenda - totalProducao;
  if (lucro < 0) or (lucro = 0) then
  begin
    writeln(Format('A empresa nao obteve lucro com as vendas, finalizando com um saldo de R$ %.2f.', [lucro]));
  end
  else
  begin
    writeln(Format('A emrpesa obteve lucro com as vendas, finalizando com um saldo de R$ %.2f.', [lucro]));
  end;


end.
