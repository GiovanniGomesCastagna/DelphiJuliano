program Exercicio_9;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  Classes, SysUtils, CustApp
  { you can add units after this };

var
  idade, maior, menor, soma, contador: integer;
  media: real;

begin
  soma:= 0;
  contador:= 0;
  maior:= 0;
  repeat
    writeln('Insira uma idade ou insira 0 para sair:');
    readln(idade);

    if (idade <> 0) and (contador = 0) then
    begin
      maior:= idade;
      menor:= idade;
    end;

    if (idade <> 0) then
    begin
      soma:= soma + idade;
      if (idade > maior) then
      begin
        maior:= idade;
      end
      else
      begin
        if (idade < menor) then
        begin
          menor:= idade;
        end;
      end;
    end;

    writeln;
    contador:= contador + 1;
  until idade = 0;

  if (contador > 1) then
  begin
    media:= soma / (contador - 1);
  end
  else
  begin
    media:= soma;
  end;

  writeln(Format('A maior idade entre as que voce inseriu e %d.', [maior]));
  writeln(Format('A menor idade que voce inseriu e %d.', [menor]));
  writeln(Format('A media das idades que voce inseriu e %.2f.', [media]));
  Readln;
end.
