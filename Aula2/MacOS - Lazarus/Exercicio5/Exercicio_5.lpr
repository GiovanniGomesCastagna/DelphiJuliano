program Exercicio_5;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  Classes, SysUtils, CustApp
  { you can add units after this };

var
  pesoIdeal: real;
  genero: char;
  altura: integer;

begin
  writeln('Insira seu genero (M para homem e F para mulher)');
  readln(genero);
  writeln('Insira sua altura em centimetros (multiplique sua altura em metros por 100');
  readln(altura);

  case genero of
    'M', 'm':
      begin
        pesoIdeal:= (72.7 * (altura / 100)) - 58;
      end;
    'F', 'f':
      begin
        pesoIdeal:= (62.1 * (altura / 100)) - 44.7;
      end;
  end;
  Writeln(Format('Seu peso ideal e de aproximadamente %2.f Kg', [pesoIdeal]));
end.
