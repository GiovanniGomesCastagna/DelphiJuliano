program Exercicio_6;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  Classes, SysUtils, CustApp
  { you can add units after this };

var
  numeroX, numeroY: integer;


begin
  writeln('Insira o primeiro valor:');
  readln(numeroX);

  writeln('Insira o segundo valor:');
  readln(numeroY);

  writeln(Format('O valor de %d + %d = %d', [numeroX, numeroY, numeroX + numeroY]));
writeln(Format('O valor de %d - %d = %d', [numeroX, numeroY, numeroX - numeroY]));
writeln(Format('O valor de %d * %d = %d', [numeroX, numeroY, numeroX * numeroY]));
writeln(Format('O valor de %d / %d = %d', [numeroX, numeroY, numeroX / numeroY]));



end.
