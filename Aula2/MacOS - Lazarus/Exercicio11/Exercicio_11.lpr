program Exercicio_11;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  Classes, SysUtils, CustApp
  { you can add units after this };

const
  estados: array[0..26] of string =
    (
    'Acre - Rio Branco', 'Alagoas - Maceio', 'Amapa - Macapa', 'Amazonas - Manaus', 'Bahia - Salvador',
    'Ceara - Fortaleza','Distrito Federal - Brasilia', 'Espirito Santo - Vitoria', 'Goias - Goiania', 'Maranhao - Sao Luis', 'Mato Grosso - Cuiaba',
    'Mato Grosso do Sul - Campo Grande', 'Minas Gerais - Belo Horizonte', 'Para - Belem', 'Paraiba - Joao Pessoa',
    'Parana - Curitiba',  'Pernambuco - Recife', 'Piaui - Teresina', 'Rio de Janeiro - Rio de Janeiro',
    'Rio Grande do Norte - Natal', 'Rio Grande do Sul - Porto Alegre', 'Rondonia - Porto Velho', 'Roraima - Boa Vista',
    'Santa Catarina - Florianopolis', 'Sao Paulo - Sao Paulo', 'Sergipe - Aracaju', 'Tocantins - Palmas'
    );
   siglas: array[0..26] of string =
     (
     'AC', 'AL', 'AP', 'AM', 'BH', 'CE', 'DF', 'ES', 'GO', 'MA', 'MT', 'MS', 'MG', 'PA', 'PB', 'PR', 'PE', 'PI', 'RJ',
     'RN', 'RS', 'RO', 'RR', 'SC', 'SP', 'SE', 'TO'
     );
var
  sigla: string;
  i : integer;

begin


  writeln('Insira a sigla de um estado:');
  readln(sigla);

  sigla:= UpperCase(sigla);
  for i:= 0 to 26 do
  begin
    if (sigla = siglas[i]) then
    begin
      writeln(Format('%s', [estados[i]]));
      break;
    end;
  end;
  Readln;


end.
