program Exercicio_4;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  Classes, SysUtils, CustApp
  { you can add units after this };

var
  idadeJogador: integer;

begin
  write('Insira a sua idade: ');
  readln(idadeJogador);
end.
