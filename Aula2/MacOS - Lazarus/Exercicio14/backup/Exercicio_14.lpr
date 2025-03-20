program Exercicio_14;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  Classes, SysUtils, CustApp , fgl, Generics.Collections
  { you can add units after this };

//
// algumas notas do porque fiz alguns comentarios e outros pontos:
// 1. O lazarus é feio, entao as faixas azuis (comentários) me ajudam bastante a me localizar;
// 2. Algumas partes são meio bobas, mas como disse, é uma maneira muito criativa de me localizar e entender o código se eu pegar ele dps de um tempo;
// 3. O Free Pascal difere em algumas partes, como na declaração de TDictionary, então pode ser meio confuso. Se tiver alguma dúvida em relação -
//    à sintaxe, você pode visitar o site "https://wiki.freepascal.org/TDictionary", lá tem as declarações e explicações.
//

// declaracao do dicionario =================================/=======================
type
  TProduto = Record
    Codigo: integer;
    Descricao: string;
    Valor: double;
  end;

  TDicionario = specialize TDictionary<Integer, TProduto>; //sinceramente nao sei pq declarei ele assim

//======================================/======================================/=

var
  EstoqueProd: TDicionario;
  codigoProd: integer;
  produto: TProduto;
  opcao: integer;

// ===========/ Declaracao de Procedures (dane-se as boas praticas) /=================

procedure cadastroProduto;
  begin
    writeln('Cadastro de Produtos');
    writeln('Insira o codigo do produto abaixo:');
    readln(produto.Codigo);

    if EstoqueProd.ContainsKey(produto.Codigo) then
    begin
      writeln('Codigo ja existente no sistema.');
      exit;
    end;

    writeln('Insira abaixo a descricao/nome do produto:');
    readln(produto.Descricao);

    writeln('Insira abaixo o valor do produto:');
    readln(produto.Valor);

    EstoqueProd.Add(produto.Codigo, produto);
    writeln('. . .');
    writeln;
    writeln('Produto cadastrado com sucesso!');
end;

procedure deletaProduto;
begin
  writeln('Excluir Produto');
  writeln('Insira abaixo o codigo do produto que deseja excluir:');
  readln(codigoProd);

  if EstoqueProd.ContainsKey(codigoProd) then
  begin
    EstoqueProd.Remove(codigoProd);
    writeln('Produto excluido com sucesso.');
  end
  else
  writeln('Produto nao encontrado no cadastro.');
  end;

procedure listarProdutos;
var
  itens: TProduto;
  codigo: integer;
begin
  if (EstoqueProd.Count = 0) then
  begin
    writeln('Nenhum produto foi cadastrado.');
    exit;
  end;
    itens:= EstoqueProd.Items[codigo]: integer;
    for codigo in EstoqueProd.Keys do
    writeln(Format('Codigo: %d -|- Descricao: %s -|- Valor: R$ %.2f ', [itens.Codigo, itens.Descricao, itens.Valor]));

end;

procedure pesquisaProduto;
var
  itens: TProduto;
  codigo: integer;
begin
  writeln('Insira o codigo do produto para procura-lo:');
  read(codigo);

  if EstoqueProd.ContainsKey(codigo) then
  begin
    itens:= EstoqueProd.Items[codigo];
    writeln(Format('Codigo: %d -|- Descricao: %s -|- Valor: R$ %.2f ', [itens.Codigo, itens.Descricao, itens.Valor]));
  end
  else
  begin
    writeln('Produto nao encontrado / nao existe no estoque.');
  end;
end;

// inicio do codigo /===================================================
begin
  EstoqueProd := TDicionario.Create;
  repeat
    writeln('Escolha uma opcao: ');
    writeln('======================================');
    writeln('| 1- Cadastrar um novo produto       |');
    writeln('| 2- Listar produtos cadastrados     |');
    writeln('| 3- Pesquisar produto pelo codigo   |');
    writeln('| 4- Excluir um produto              |');
    writeln('| 5- Sair do sistema                 |');
    writeln('======================================');
    readln(opcao);

    case (opcao) of
    1: cadastroProduto;
    2: listarProdutos;
    3: pesquisaProduto;
    4: deletaProduto;
    5: writeln('Saindo do sistema . . .');
    end;

    until opcao = 5;


  Readln;
  EstoqueProd.Free;
end.
