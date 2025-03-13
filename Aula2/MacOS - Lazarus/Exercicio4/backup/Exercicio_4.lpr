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
  classificacao: string;

begin
  write('Insira a sua idade: ');
  readln(idadeJogador);

  case idadeJogador of
  5..7:
    begin
    classificacao:= 'Infantil A';
    end;
  8..10:
    begin
    classificacao:= 'Infantil B';
    end;
  11..13:
    begin
      classificacao:= 'Juvenil A';
    end;
  14..17:
    begin
      classificacao:= 'Juvenil B';
    end;
  18..High(Integer):
    begin
      classificacao:= 'Adulto';
    end;
  end;
  writeln(Format('Jogador ira jogar na classificacao %s .', [classificacao]));
end.
