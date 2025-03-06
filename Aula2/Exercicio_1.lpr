program Exercicio_1;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  Classes, SysUtils, CustApp
  { you can add units after this };

var
  valor1, valor2, valor3: Real;
  media: Real;

begin

  Writeln('Insira tres valores reais, que a media entre elas sera calculada');
  Readln(valor1, valor2, valor3);
  media:= (valor1 + valor2 + valor3) / 3;
  Writeln(Format('a media dos valores eh igual a %.4f', [media]));

end.
