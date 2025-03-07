program Exercicio_3;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  Classes, SysUtils, CustApp
  { you can add units after this };

var
  nomeA, nomeB, nomeC: string;
  idadeA, idadeB, idadeC: integer;
  soma: integer;

begin
  write('Informe o primerio nome: ');
  readln(nomeA);
  write(Format('Informe a idade de %s: ', [nomeA]));
  readln(idadeA);
  write('Informe o segundo nome: ');
  readln(nomeB);
  write(Format('Informe a idade de %s: ', [nomeB]));
  readln(idadeB);
  write('Informe o terceiro nome: ');
  readln(nomeC);
  write(Format('Informe a idade de %s: ', [nomeC]));
  readln(idadeC);

  soma:= idadeA + idadeB + idadeC;

  writeln(Format('%s tem %d anos', [nomeA, idadeA]));
  writeln(Format('%s tem %d anos', [nomeB, idadeB]));
  writeln(Format('%s tem %d anos', [nomeC, idadeC]));
  writeln(Format('%s, %s e %s juntos tem %d anos', [nomeA, nomeB, nomeC, soma]));

end.
