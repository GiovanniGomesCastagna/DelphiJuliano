program Exercicio_10;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  Classes, SysUtils, CustApp
  { you can add units after this };

Var
  valorA, valorB: real;
  opcao: integer;

Begin
  writeln('Insira o primeiro valor real:');
  readln(valorA);
  writeln('Insira o segundo valor real:');
  readln(valorB);

  writeln('--------------------------------------');
  writeln('| Escolha uma das operacoes a seguir |');
  writeln('| 1- Subtraia valor B de A (A - B)   |');
  writeln('| 2- Some A com B          (A + B)   |');
  writeln('| 3- Multiplicar A com B   (A * B)   |');
  writeln('| 4- Descubra o maior valor dos dois |');
  writeln('--------------------------------------');

  readln(opcao);
  case opcao of
  1:
    begin
      writeln(Format('Resultado da subtracao eh: %.2f.', [valorA - valorB]))
    end;
  2:
    begin
      writeln(Format('Resultado da adicao eh: %.2f.', [valorA + valorB]))
    end;
  3:
    begin
      writeln(Format('Resultado da multiplicacao eh: %.2f.', [valorA * valorB]))
    end;
  4:
    begin
      if (valorA > valorB) then
      begin
        writeln(Format('O maior valor entre os dois inseridos eh: %.2f', [valorA]));
      end
      else
      begin
        if (valorB > valorA) or (valorB = valorA) then
        begin
          writeln(Format('O maior valor entre os dois inseridos eh: %.2f', [valorB]));
        end;
      end;
  end;
  end;

  readln;


end.

