program Exercicio_9;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  Classes, SysUtils, CustApp
  { you can add units after this };

var
  idade, maior, menor, soma: integer;
  media: real;

begin
  soma:= 0;
  writeln('Insira uma idade ou insira 0 para sair:');
  readln(idade);

  if (idade <> 0) then
  begin
    soma:= soma + idade;
  end;
  until idade = 0;



end.
