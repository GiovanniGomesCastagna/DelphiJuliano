program Exercicio_12;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  Classes, SysUtils, CustApp
  { you can add units after this };

procedure listaProdutos();
begin
  WriteLn('----------------------------');
  writeln('|Produtos:                 |');
  writeln('| 1- Refrigerante: R$ 4,00 |');
  writeln('| 2- Agua: R$ 2,50         |');
  writeln('| 3- Cafe: R$ 2,00         |');
  writeln('| 4- Sanduiche: R$ 5,00    |');
  writeln('| 5- Pao de queijo: R$ 3,50|');
  writeln('| 6- Pastel: R$ 4,50       |');
  writeln('----------------------------');
end;

const
  valores: array[0..5] of real = (
  4.00, 2.50, 2.00, 5.00, 3.50, 4.50);
var
  i, quantidadeItens, pedido: integer;
  somaProdutos: real;

begin
  somaProdutos:= 0;
  Writeln('Bem vindo! Escolha seu produto:');
  listaProdutos();
  writeln(slinebreak, 'Insira a quantidade de intens que deseja comprar:');
  readln(quantidadeItens);

  for i:= 0 to quantidadeItens - 1 do
  begin
    writeln(Format('Insira o item numero %d que deseja comprar', [i + 1]));
    readln(pedido);
    somaProdutos:= somaProdutos + valores[pedido - 1];
  end;

  writeln(Format('Finalizado! Seu pedido sera de R$ %.2f. Tenha um bom dia!', [somaProdutos]));
end.
