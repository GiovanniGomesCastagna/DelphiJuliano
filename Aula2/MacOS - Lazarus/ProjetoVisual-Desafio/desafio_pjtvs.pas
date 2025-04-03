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
//--------------------------------------------------==============================================-------------------------------
// verificação de campos do cadastro e confirma caso estejam corretos
procedure TForm1.BTNcadastroClick(Sender: TObject);
var
  EmailRegex, TelefoneRegex: TRegExpr;
  telefoneTexto: string;
  opcaoTipoUsuario: Integer;
  escolhaTipoUsuario: string;
  idade: integer;
  i: integer;
begin
  //Verifica se nome do usuário está preenchido;
  if Trim(EDTnomeUsuario.text).isEmpty then
  begin
    MessageDlg('Nome é obrigatório.', mtWarning, [mbOk], 0);
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


  // verificação dos campos de senha
  if Trim(EDTsenha.text).isEmpty then
  begin
    MessageDlg('Campo de senha deve ser preenchido obrigatoriamente.', mtWarning, [mbOk], 0);
    Exit;
  end;

  if Trim(EDTsenhaConfirma.text).isEmpty then
  begin
    MessageDlg('Campo de confirmação de senha deve ser preenchido obrigatoriamente.', mtWarning, [mbOk], 0);
    Exit;
  end;

  if not (EDTsenha.text = EDTsenhaConfirma.text) then
  begin
    MessageDlg('Senhas não conferem! Tente novamente.', mtWarning, [mbOk], 0);
    Exit;
  end;

  //verifica se o campo do tipo de usuário está preenchido
  opcaoTipoUsuario:= RDGRPtipoUsuario.ItemIndex;

  if opcaoTipoUsuario = -1 then
  begin
    MessageDlg('Tipo de usuário deve ser selecionado!', mtWarning, [mbOk], 0);
  end;

  escolhaTipoUsuario:= RDGRPtipoUsuario.Items[opcaoTipoUsuario];


  // procura pela primeira linha vazia
  for i := 1 to STRGRIDusuariosCadastrados.RowCount - 1 do
  begin
    if STRGRIDusuariosCadastrados.Cells[0, i] = '' then
    begin
      FLinha := i;
      Break;
    end;
  end;

  STRGRIDusuariosCadastrados.Cells[0,FLinha] := FCodigo.ToString;
  STRGRIDusuariosCadastrados.Cells[1,FLinha] := EDTnomeUsuario.Text;
  STRGRIDusuariosCadastrados.Cells[2,FLinha] := EDTemail.Text;
  STRGRIDusuariosCadastrados.Cells[3,Flinha] := DateToStr(DATEPICKaniversario.Date);
  STRGRIDusuariosCadastrados.Cells[4,FLinha] := MASKEDTtelefone.Text;
  STRGRIDusuariosCadastrados.Cells[5,FLinha] := escolhaTipoUsuario;

  Inc(FCodigo);
  ShowMessage('Usuário Cadastrado!');

  EDTnomeUsuario.Clear;
  EDTemail.Clear;
  EDTemail.Clear;
  DATEPICKaniversario.Date:= Date;
  MASKEDTtelefone.Clear;
  EDTsenha.Clear;
  EDTsenhaConfirma.Clear;
  escolhaTipoUsuario:= '';
  opcaoTipoUsuario:= -1;

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

