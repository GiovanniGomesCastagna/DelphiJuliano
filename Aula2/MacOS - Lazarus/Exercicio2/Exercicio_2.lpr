program Exercicio_2;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  Classes, SysUtils, CustApp;

var
  Nome: string;
  Idade: integer;

begin
  write('Insira seu nome: ');
  readln(Nome);
  write('Insira sua idade: ');
  readln(Idade);

  write(Format('“Olá %s. Atualmente você possui %d anos. Daqui a 5 anos você terá %d anos', [Nome, Idade, Idade + 5]));

end.
