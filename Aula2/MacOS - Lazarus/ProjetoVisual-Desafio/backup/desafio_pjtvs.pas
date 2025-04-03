unit Desafio_PjtVS;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, MaskEdit,
  StdCtrls, Grids, DateTimePicker, DateUtils, RegExpr;

type

  { TForm1 }
  // Declaracao do formulario e itens dele
  TForm1 = class(TForm)
    BTNcadastro: TButton;
    DATEPICKaniversario: TDateTimePicker;
    EDTsenha: TEdit;
    EDTnomeUsuario: TEdit;
    EDTemail: TEdit;
    EDTsenhaConfirma: TEdit;
    Label1: TLabel;
    MASKEDTtelefone: TMaskEdit;
    PainelCadastro: TPanel;
    RDGRPtipoUsuario: TRadioGroup;
    STRGRIDusuariosCadastrados: TStringGrid;
    procedure BTNcadastroClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure PainelCadastroClick(Sender: TObject);
  private
    FCodigo: Integer;
    FLinha: Integer;
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Edit1Change(Sender: TObject);
begin

end;

procedure TForm1.FormClick(Sender: TObject);
begin

end;

// verificação de campos do cadastro e confirma caso estejam corretos
procedure TForm1.BTNcadastroClick(Sender: TObject);
var
  EmailRegex, TelefoneRegex: TRegExpr;
  telefoneTexto: string;
begin
  //Verifica se nome do usuário está preenchido;
  if Trim(EDTnomeUsuario.text).isEmpty then
  begin
    MessageDlg('Nome é obrigatório.', mtWarning, [mbOk], 0);
    exit;
  end;

  // verifica se o campo e-mail está vazio
  if Trim(EDTemail.text) = '' then
  begin
    MessageDlg('O campo de e-mail é obrigatório. Preencha-o, por favor.', mtWarning, [mbOk], 0);
    Exit;
  end;

  //verifica se está de acordo com o regex
  EmailRegex:= TRegExpr.Create('^[\w.-]+@[\w.-]+\.[a-zA-Z]{2,}$');
  if not EmailRegex.Exec(EDTemail.text) then
  begin
    MessageDlg('O e-mail não é valido, por favor insira-o novamente ou utilize outro.', mtWarning, [mbOk], 0);
    Exit;
  end;

  // verifica se idade se encaixa no mínimo requerido.
  if YearOf(now) - YearOf(DATEPICKaniversario.DateTime) < 16 then
  begin
    MessageDlg('Voce deve ter pelo menos 16 anos para se cadastrar.', mtWarning, [mbOk], 0);
    Exit;
  end;

  // verifica se o campo do telefone está vazio
  if Trim(MASKEDTtelefone.text) = '' then
  begin
    MessageDlg('O campo de telefone é obrigatório! Por favor preencha-o.', mtWarning, [mbOk], 0);
    Exit;
  end;

  // verifica se o telefone inserido é válido. Se sim, verifica se tem 10 números e adiciona o 9 na frente.
  telefoneTexto:= MASKEDTtelefone.text;
  TelefoneRegex:= TRegExpr.Create('^\(?\d{2}\)?[-.\s]?\d{4,5}[-.\s]?\d{4}$');
  if TelefoneRegex.Exec(MASKEDTtelefone.text) then
  begin
    if length(MASKEDTtelefone.text) = 10 then
    begin
      telefoneTexto:= Copy(telefoneTexto, 1, 2) + '9' + Copy(telefoneTexto, 3, Length(telefoneTexto));
      ShowMessage(Format('Telefone alterado: %s', [telefoneTexto]));
    end
    else
    begin
      MessageDlg('Número inválido! Tente novamente.', mtWarning, [mbOk], 0);
    end;
  end;


  Inc(FCodigo);
  ShowMessage('Usuário Cadastrado!');
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Fcodigo := 0;
  STRGRIDusuariosCadastrados.Cells[0,0] := 'Codigo';
  STRGRIDusuariosCadastrados.Cells[1,0] := 'Nome';
  STRGRIDusuariosCadastrados.Cells[2,0] := 'Email';
  STRGRIDusuariosCadastrados.Cells[3,0] := 'Aniversario';
  STRGRIDusuariosCadastrados.Cells[4,0] := 'Telefone';
  STRGRIDusuariosCadastrados.Cells[5,0] := 'Tipo';
end;

procedure TForm1.Label1Click(Sender: TObject);
begin

end;

procedure TForm1.PainelCadastroClick(Sender: TObject);
begin

end;


end.

