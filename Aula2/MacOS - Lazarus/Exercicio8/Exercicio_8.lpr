program Exercicio_8;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  Classes, SysUtils, CustApp
  { you can add units after this };

var
  tamanhoVetor, i, j, tempor, maior, menor: integer;
  vetor: array of integer;
begin
  writeln('Insira abaixo quantos numeros deseja inserir:');
  readln(tamanhoVetor);

  setlength(vetor, tamanhoVetor);

  writeln('Insira abaixo os valores do seu vetor');
  for i := 0 to tamanhoVetor - 1 do
  begin
    readln(vetor[i]);
  end;

  for i := 0 to tamanhoVetor - 2 do
  begin
    for j := 0 to tamanhoVetor - i - 2 do
    begin
      if (vetor[j] > vetor[j + 1]) then
      begin
        tempor:= vetor[j];
        vetor[j]:= vetor[j + 1];
        vetor[j + 1]:= tempor;
      end;
    end;
  end;

  maior:= vetor[tamanhoVetor - 1];
  menor:= vetor[0];

  writeln(Format('O maior valor da lista e %d', [maior]));
  writeln(Format('O menor valor da lista e %d', [menor]));
end.
