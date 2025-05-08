unit unitTDE;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  TPosicao = record
    Capacete: string;
    Nome: string;
    Idade: string;
    Idolo: string;
    Carro: string;
    Equipe: string;
  end;

  { TKartForm }

  TKartForm = class(TForm)
    capacete2: TComboBox;
    capacete3: TComboBox;
    capacete4: TComboBox;
    capacete5: TComboBox;
    carro2: TComboBox;
    carro3: TComboBox;
    carro4: TComboBox;
    carro5: TComboBox;
    col2GPB: TGroupBox;
    col3GPB: TGroupBox;
    col4GPB: TGroupBox;
    col5GPB: TGroupBox;
    cond10: TLabel;
    cond11: TLabel;
    cond12: TLabel;
    cond13: TLabel;
    cond14: TLabel;
    cond15: TLabel;
    cond16: TLabel;
    cond17: TLabel;
    cond18: TLabel;
    cond19: TLabel;
    cond2: TLabel;
    cond20: TLabel;
    cond21: TLabel;
    cond22: TLabel;
    cond3: TLabel;
    cond4: TLabel;
    cond5: TLabel;
    cond6: TLabel;
    cond7: TLabel;
    cond8: TLabel;
    cond9: TLabel;
    equipe2: TComboBox;
    equipe3: TComboBox;
    equipe4: TComboBox;
    equipe5: TComboBox;
    idade2: TComboBox;
    idade3: TComboBox;
    idade4: TComboBox;
    idade5: TComboBox;
    idolo2: TComboBox;
    idolo3: TComboBox;
    idolo4: TComboBox;
    idolo5: TComboBox;
    Image1: TImage;
    label1: TLabel;
    label2: TLabel;
    label3: TLabel;
    label4: TLabel;
    label5: TLabel;
    label6: TLabel;
    cond1: TLabel;
    nome1: TComboBox;
    idade1: TComboBox;
    idolo1: TComboBox;
    carro1: TComboBox;
    equipe1: TComboBox;
    col1GPB: TGroupBox;
    capacete1: TComboBox;
    nome2: TComboBox;
    nome3: TComboBox;
    colPNL: TPanel;
    nome4: TComboBox;
    nome5: TComboBox;
    legendasPNL: TPanel;
    condicoesPanel1: TPanel;
    condicoesPanel2: TPanel;
    procedure ComboBoxGeralChange(Sender: TObject);
  private
    procedure MudarCorDoGroupBox(GroupBox: TGroupBox; CorNome: string);
    procedure VerificaCondicionais;
    procedure LerCaixasParaPosicoes;
    function CorTextoParaTColor(const NomeCor: string): TColor;
    function CertificaDeQueEstaCerto: Boolean;
    function Condicional1: Boolean;
    function Condicional2: Boolean;
    function Condicional3: Boolean;
    function Condicional4: Boolean;
    function Condicional5: Boolean;
    function Condicional6: Boolean;
    function Condicional7: Boolean;
    function Condicional8: Boolean;
    function Condicional9: Boolean;
    function Condicional10: Boolean;
    function Condicional11: Boolean;
    function Condicional12: Boolean;
    function Condicional13: Boolean;
    function Condicional14: Boolean;
    function Condicional15: Boolean;
    function Condicional16: Boolean;
    function Condicional17: Boolean;
    function Condicional18: Boolean;
    function Condicional19: Boolean;
    function Condicional20: Boolean;
    function Condicional21: Boolean;
    function Condicional22: Boolean;
  public

  end;

var
  KartForm: TKartForm;
  Posicao: array [1..5] of TPosicao;

implementation

{$R *.lfm}

{ TKartForm }


procedure TKartForm.ComboBoxGeralChange(Sender: TObject);
var
  Combo: TComboBox;
begin
  LerCaixasParaPosicoes;
  VerificaCondicionais;

    if Sender is TComboBox then
  begin
    Combo := TComboBox(Sender);

    if Combo = capacete1 then MudarCorDoGroupBox(col1GPB, Combo.Text);
    if Combo = capacete2 then MudarCorDoGroupBox(col2GPB, Combo.Text);
    if Combo = capacete3 then MudarCorDoGroupBox(col3GPB, Combo.Text);
    if Combo = capacete4 then MudarCorDoGroupBox(col4GPB, Combo.Text);
    if Combo = capacete5 then MudarCorDoGroupBox(col5GPB, Combo.Text);
  end;

  if (CertificaDeQueEstaCerto) then
  begin
    MessageDlg('Parabéns! Você acertou tudo!', mtInformation, [mbOK], 0);
  end;
end;

procedure TKartForm.MudarCorDoGroupBox(GroupBox: TGroupBox; CorNome: string);
begin
  GroupBox.ControlStyle := GroupBox.ControlStyle + [csOpaque];
  GroupBox.ParentColor := False;
  GroupBox.Color := CorTextoParaTColor(CorNome);
end;


procedure TKartForm.VerificaCondicionais;
begin
  Condicional1;
  Condicional2;
  Condicional3;
  Condicional4;
  Condicional5;
  Condicional6;
  Condicional7;
  Condicional8;
  Condicional9;
  Condicional10;
  Condicional11;
  Condicional12;
  Condicional13;
  Condicional14;
  Condicional15;
  Condicional16;
  Condicional17;
  Condicional18;
  Condicional19;
  Condicional20;
  Condicional21;
  Condicional22;
end;

procedure TKartForm.LerCaixasParaPosicoes;
begin
  Posicao[1].Capacete := capacete1.Text;
  Posicao[1].Nome := nome1.Text;
  Posicao[1].Idade := idade1.Text;
  Posicao[1].Idolo := idolo1.Text;
  Posicao[1].Carro := carro1.Text;
  Posicao[1].Equipe := equipe1.Text;

  Posicao[2].Capacete := capacete2.Text;
  Posicao[2].Nome := nome2.Text;
  Posicao[2].Idade := idade2.Text;
  Posicao[2].Idolo := idolo2.Text;
  Posicao[2].Carro := carro2.Text;
  Posicao[2].Equipe := equipe2.Text;

  Posicao[3].Capacete := capacete3.Text;
  Posicao[3].Nome := nome3.Text;
  Posicao[3].Idade := idade3.Text;
  Posicao[3].Idolo := idolo3.Text;
  Posicao[3].Carro := carro3.Text;
  Posicao[3].Equipe := equipe3.Text;

  Posicao[4].Capacete := capacete4.Text;
  Posicao[4].Nome := nome4.Text;
  Posicao[4].Idade := idade4.Text;
  Posicao[4].Idolo := idolo4.Text;
  Posicao[4].Carro := carro4.Text;
  Posicao[4].Equipe := equipe4.Text;

  Posicao[5].Capacete := capacete5.Text;
  Posicao[5].Nome := nome5.Text;
  Posicao[5].Idade := idade5.Text;
  Posicao[5].Idolo := idolo5.Text;
  Posicao[5].Carro := carro5.Text;
  Posicao[5].Equipe := equipe5.Text;
end;

function TKartForm.CorTextoParaTColor(const NomeCor: string): TColor;
begin
  if NomeCor = 'vermelho' then
    Result := clRed
  else if NomeCor = 'azul' then
    Result := clBlue
  else if NomeCor = 'verde' then
    Result := clGreen
  else if NomeCor = 'amarelo' then
    Result := clYellow
  else if NomeCor = 'branco' then
    Result := clWhite
  else
    Result := $00C8E6F5;
end;

function TKartForm.CertificaDeQueEstaCerto: Boolean;
begin
  if (Condicional1) and (Condicional2)
  and (Condicional3) and (Condicional4)
  and (Condicional5) and (Condicional6)
  and (Condicional7) and (Condicional8)
  and (Condicional9) and (Condicional10)
  and (Condicional11) and (Condicional12)
  and (Condicional13) and (Condicional14)
  and (Condicional15) and (Condicional16)
  and (Condicional17) and (Condicional18)
  and (Condicional19) and (Condicional20)
  and (Condicional21) and (Condicional22) then
  begin
    Result:= True;
  end
  else
  begin
    Result:= False;
  end;
end;

function TKartForm.Condicional1: Boolean;
var
  iProst, iFerrari, iWilliams: Integer;
  i, certo: Integer;
begin
  Result:= False;
  certo:= 999;
  iProst:= -1;
  iFerrari:= -1;
  iWilliams:= -1;

  for i := 1 to 5 do
  begin
    if Posicao[i].Idolo = 'A. Prost' then
       iProst:= i;
    if Posicao[i].Equipe = 'Ferrari' then
       iFerrari:= i;
    if Posicao[i].Equipe = 'Williams' then
       iWilliams:= i;
  end;

  if (iProst <> -1) and (iFerrari <> -1) and (iWilliams <> -1) then
  begin
    if (iProst < iFerrari) and (iFerrari < iWilliams) then
    begin
       Result:= True;
       certo:= 1
    end
    else if (iProst > iFerrari) and (iFerrari < iWilliams) or (iProst < iFerrari) and (iFerrari > iWilliams) then
    begin
      Result:= False;
      certo:= 0;
    end;
  end;

  if (certo = 1) then
  begin
    cond1.Font.Color:= clGreen;
    cond1.Font.Style:= cond1.Font.Style + [fsStrikeOut];
  end;
  if (certo = 0) then
  begin
    cond1.Font.Color:= clRed;
    cond1.Font.Style:= cond1.Font.Style - [fsStrikeOut];
  end
  else if (certo <> 0) and (certo <> 1) then
  begin
    cond1.Font.Color:= clBlack;
    cond1.Font.Style:= cond1.Font.Style - [fsStrikeOut];
  end;
end;

function TKartForm.Condicional2: Boolean;
var
  iRBR, iMcLaren, iFerrari: Integer;
  i: Integer;
  certo: integer;
begin
  Result:= False;
  certo:= 999;
   iRBR:= -1;
   iMcLaren:= -1;
   iFerrari:= -1;

   for i := 1 to 5 do
   begin
   if Posicao[i].Equipe = 'RBR' then
       iRBR:= i;
   if Posicao[i].Equipe = 'McLaren' then
       iMcLaren:= i;
   if Posicao[i].Equipe = 'Ferrari' then
       iFerrari:= i;

   if (iRBR <> -1) and (iMcLaren <> -1) and (iFerrari <> -1) then
   begin
     if (iMcLaren < iRBR) and (iRBR < iFerrari) then
     begin
        Result:= True;
        certo:= 1;
     end
     else if (iMcLaren > iRBR) and (iRBR < iFerrari) or (iMcLaren < iRBR) and (iRBR > iFerrari) then
     begin
        Result:= False;
        certo:= 0;
     end;
   end;

   end;

  if (certo = 1) then
  begin
    cond2.Font.Color:= clGreen;
    cond2.Font.Style:= cond2.Font.Style + [fsStrikeOut];
  end;
  if (certo = 0) then
  begin
    cond2.Font.Color:= clRed;
    cond2.Font.Style:= cond2.Font.Style - [fsStrikeOut];
  end
  else if (certo <> 0) and (certo <> 1) then
  begin
    cond2.Font.Color:= clBlack;
    cond2.Font.Style:= cond2.Font.Style - [fsStrikeOut];
  end;
end;

function TKartForm.Condicional3: Boolean;
var
  i, certo: integer;
begin
  Result:= False;
  certo:= 999;
  for i := 1 to 5 do
  begin
    if (Posicao[i].Carro <> '') and (Posicao[i].Equipe <> '') then
    begin
      if (Posicao[i].Carro = 'sedan') and (Posicao[i].Equipe = 'Ferrari') then
      begin
        Result:= True;
        certo:= 1;
      end
      else if (Posicao[i].Carro = 'sedan') and (Posicao[i].Equipe <> 'Ferrari') or (Posicao[i].Carro <> 'sedan') and (Posicao[i].Equipe = 'Ferrari') then
      begin
        Result:= False;
        certo:= 0;
      end;
    end;
  end;

  if (certo = 1) then
  begin
    cond3.Font.Color:= clGreen;
    cond3.Font.Style:= cond3.Font.Style + [fsStrikeOut];
  end;
  if (certo = 0) then
  begin
    cond3.Font.Color:= clRed;
    cond3.Font.Style:= cond3.Font.Style - [fsStrikeOut];
  end
  else if (certo <> 0) and (certo <> 1) then
  begin
    cond3.Font.Color:= clBlack;
    cond3.Font.Style:= cond3.Font.Style - [fsStrikeOut];
  end;;
end;

function TKartForm.Condicional4: Boolean;
var
  i: integer;
  certo: integer;
begin
  Result:= False;
  certo:= 999;
  for i := 1 to 5 do
  begin
    if (Posicao[i].Equipe <> '') then
    begin
      if (Posicao[i].Equipe = 'McLaren') and (i = 2) then
      begin
        Result:= True;
        certo:= 1;
      end
      else if (Posicao[i].Equipe = 'McLaren') and ( i <> 2) or (Posicao[i].Equipe <> 'McLaren') and (i = 2) then
      begin
        Result:= False;
        certo:= 0;
      end;
    end;
  end;

  if (certo = 1) then
  begin
    cond4.Font.Color:= clGreen;
    cond4.Font.Style:= cond4.Font.Style + [fsStrikeOut];
  end;
  if (certo = 0) then
  begin
    cond4.Font.Color:= clRed;
    cond4.Font.Style:= cond4.Font.Style - [fsStrikeOut];
  end
  else if (certo <> 0) and (certo <> 1) then
  begin
    cond4.Font.Color:= clBlack;
    cond4.Font.Style:= cond4.Font.Style - [fsStrikeOut];
  end;
end;

function TKartForm.Condicional5: Boolean;
var
  i: integer;
  certo: integer;
begin
  Result:= False;
  certo:= 999;
  for i := 1 to 5 do
  begin
    if (Posicao[i].Carro <> '') and (Posicao[i].Equipe <> '') then
    begin
      if (Posicao[i].Carro = 'crossover') and (Posicao[i].Equipe = 'RBR') then
      begin
        Result:= True;
        certo:= 1;
      end
      else if (Posicao[i].Carro = 'crossover') and (Posicao[i].Equipe <> 'RBR') or (Posicao[i].Carro <> 'crossover') and (Posicao[i].Equipe = 'RBR') then
      begin
      Result:= False;
      certo:= 0;
      end;
    end;
  end;

  if (certo = 1) then
  begin
    cond5.Font.Color:= clGreen;
    cond5.Font.Style:= cond5.Font.Style + [fsStrikeOut];
  end;
  if (certo = 0) then
  begin
    cond5.Font.Color:= clRed;
    cond5.Font.Style:= cond5.Font.Style - [fsStrikeOut];
  end
  else if (certo <> 0) and (certo <> 1) then
  begin
    cond5.Font.Color:= clBlack;
    cond5.Font.Style:= cond5.Font.Style - [fsStrikeOut];
  end;
end;

function TKartForm.Condicional6: Boolean;
var
  i: integer;
  certo: integer;
begin
  Result:= False;
  certo:= 999;
  for i := 1 to 5 do
  begin
    if (Posicao[i].Carro <> '') then
    begin
      if (Posicao[i].Carro = 'pickup') and (i = 1) or (Posicao[i].Carro = 'pickup') and (i = 5) then
      begin
        Result:= True;
        certo:= 1;
      end
      else if (Posicao[1].Carro <> 'pickup') and (Posicao[5].Carro <> 'pickup')
      and (Posicao[1].Carro <> '') and (Posicao[5].Carro <> '') then
      begin
        Result:= False;
        certo:= 0;
      end;
    end;
  end;

  if (certo = 1) then
  begin
    cond6.Font.Color:= clGreen;
    cond6.Font.Style:= cond6.Font.Style + [fsStrikeOut];
  end;
  if (certo = 0) then
  begin
    cond6.Font.Color:= clRed;
    cond6.Font.Style:= cond6.Font.Style - [fsStrikeOut];
  end
  else if (certo <> 0) and (certo <> 1) then
  begin
    cond6.Font.Color:= clBlack;
    cond6.Font.Style:= cond6.Font.Style - [fsStrikeOut];
  end;
end;

function TKartForm.Condicional7: Boolean;
var
  iAmarelo, iSUV, iRBR: Integer;
  i, certo: Integer;
begin
  Result:= False;
  certo:= 999;
  iAmarelo:= -1;
  iSUV:= -1;
  iRBR:= -1;

  for i := 1 to 5 do
  begin
    if Posicao[i].Capacete = 'amarelo' then
       iAmarelo:= i;
    if Posicao[i].Carro = 'SUV' then
       iSUV:= i;
    if Posicao[i].Equipe = 'RBR' then
       iRBR:= i;
  end;

  if (iAmarelo <> -1) and (iSUV <> -1) and (iRBR <> -1) then
  begin
    if (iSUV < iAmarelo) and (iAmarelo < iRBR) then
    begin
       Result:= True;
       certo:= 1;
    end
    else if (iSUV > iAmarelo) and (iAmarelo < iRBR) or (iSUV < iAmarelo) and (iAmarelo > iRBR) then
    begin
       Result:= False;
       certo:= 0;
    end;
  end;

  if (certo = 1) then
  begin
    cond7.Font.Color:= clGreen;
    cond7.Font.Style:= cond7.Font.Style + [fsStrikeOut];
  end;
  if (certo = 0) then
  begin
    cond7.Font.Color:= clRed;
    cond7.Font.Style:= cond7.Font.Style - [fsStrikeOut];
  end
  else if (certo <> 0) and (certo <> 1) then
  begin
    cond7.Font.Color:= clBlack;
    cond7.Font.Style:= cond7.Font.Style - [fsStrikeOut];
  end;
end;

function TKartForm.Condicional8: Boolean;
var
  i, certo: integer;
begin
  Result:= False;
  certo:= 999;
  for i := 1 to 5 do
  begin

    if ((Posicao[i].Idolo <> '') and (Posicao[i].Carro <> '')) then
    begin
      if (Posicao[i].Idolo = 'K. Räikkönen') and (Posicao[i].Carro = 'pickup') then
      begin
        Result:= True;
        certo:= 1;
      end;
      if (Posicao[i].Idolo = 'K. Räikkönen') and ((Posicao[i].Carro <> 'pickup') and (Posicao[i].Carro <> '')) then
      begin
        Result:= False;
        certo:= 0;
      end
      else if (Posicao[i].Idolo <> 'K. Räikkönen') and ((Posicao[i].Carro = 'pickup') and (Posicao[i].Idolo <> '')) then
      begin
        Result:= False;
        certo:= 0;
      end;
    end;
  end;

  if (certo = 1) then
  begin
    cond8.Font.Color:= clGreen;
    cond8.Font.Style:= cond8.Font.Style + [fsStrikeOut];
  end;
  if (certo = 0) then
  begin
    cond8.Font.Color:= clRed;
    cond8.Font.Style:= cond8.Font.Style - [fsStrikeOut];
  end
  else if (certo <> 0) and (certo <> 1) then
  begin
    cond8.Font.Color:= clBlack;
    cond8.Font.Style:= cond8.Font.Style - [fsStrikeOut];
  end;
end;

function TKartForm.Condicional9: Boolean;
var
  i, certo: integer;
begin
  Result:= False;
  certo:= 999;
  for i := 1 to 4 do
  begin
    if (Posicao[i].Idolo <> '') and (Posicao[i + 1].Equipe <> '') then
    begin
      if (Posicao[i].Idolo = 'F. Alonso') and (Posicao[i + 1].Equipe = 'Williams') then
      begin
        Result:= True;
        certo:= 1;
      end
      else if (Posicao[i].Idolo = 'F. Alonso') and (Posicao[i + 1].Equipe <> 'Williams')
      or (Posicao[i].Idolo <> 'F. Alonso') and (Posicao[i + 1].Equipe = 'Williams') then
      begin
        Result:= False;
        certo:= 0;
      end;
    end;
  end;

  if (certo = 1) then
  begin
    cond9.Font.Color:= clGreen;
    cond9.Font.Style:= cond9.Font.Style + [fsStrikeOut];
  end;
  if (certo = 0) then
  begin
    cond9.Font.Color:= clRed;
    cond9.Font.Style:= cond9.Font.Style - [fsStrikeOut];
  end
  else if (certo <> 0) and (certo <> 1) then
  begin
    cond9.Font.Color:= clBlack;
    cond9.Font.Style:= cond9.Font.Style - [fsStrikeOut];
  end;
end;

function TKartForm.Condicional10: Boolean;
var
  i, certo: integer;
begin
  Result:= False;
  certo:= 999;
  for i := 1 to 5 do
  begin
    if (Posicao[i].Capacete <> '') and (Posicao[i -1].Idolo <> '') then
    begin
      if (Posicao[i].Capacete = 'verde') and (Posicao[i - 1].Idolo = 'N. Piquet') then
      begin
        Result:= True;
        certo:= 1;
      end
      else if (Posicao[i].Capacete = 'verde') and (Posicao[i - 1].Equipe <> 'N. Piquet') or (Posicao[i].Capacete <> 'verde') and (Posicao[i - 1].Idolo = 'N. Piquet') then
      begin
        Result:= False;
        certo:= 0;
      end;
    end;
  end;

  if (certo = 1) then
  begin
    cond10.Font.Color:= clGreen;
    cond10.Font.Style:= cond10.Font.Style + [fsStrikeOut];
  end;
  if (certo = 0) then
  begin
    cond10.Font.Color:= clRed;
    cond10.Font.Style:= cond10.Font.Style - [fsStrikeOut];
  end
  else if (certo <> 0) and (certo <> 1) then
  begin
    cond10.Font.Color:= clBlack;
    cond10.Font.Style:= cond10.Font.Style - [fsStrikeOut];
  end;
end;

function TKartForm.Condicional11: Boolean;
var
  i: integer;
  certo: integer;
begin
  Result:= False;
  certo:= 999;
  for i := 1 to 5 do
  begin
    if (Posicao[i].Idolo <> '') then
    begin
      if (Posicao[i].Idolo = 'A. Prost') and (i = 1) or (Posicao[i].Idolo = 'A. Prost') and (i = 5) then
      begin
        Result:= True;
        certo:= 1;
      end
      else if ((Posicao[1].Idolo <> 'A. Prost') and (Posicao[1].Idolo <> '')) and ((Posicao[5].Idolo <> 'A. Prost') and (Posicao[5].Idolo <> '')) then
      begin
        Result:= False;
        certo:= 0;
      end;
    end;
  end;

  if (certo = 1) then
  begin
    cond11.Font.Color:= clGreen;
    cond11.Font.Style:= cond11.Font.Style + [fsStrikeOut];
  end;
  if (certo = 0) then
  begin
    cond11.Font.Color:= clRed;
    cond11.Font.Style:= cond11.Font.Style - [fsStrikeOut];
  end
  else if (certo <> 0) and (certo <> 1) then
  begin
    cond11.Font.Color:= clBlack;
    cond11.Font.Style:= cond11.Font.Style - [fsStrikeOut];
  end;
end;

function TKartForm.Condicional12: Boolean;
var
  i, certo: integer;
begin
  Result:= False;
  certo:= 999;
  for i := 1 to 5 do
  begin
    if (Posicao[i].Idade <> '') and (Posicao[i].Idolo <> '') then
    begin
      if (Posicao[i].Idade = '22') and (Posicao[i].Idolo = 'K. Räikkönen') then
      begin
        Result:= True;
        certo:= 1;
      end
      else if (Posicao[i].Idade = '22') and (Posicao[i - 1].Equipe <> 'K. Räikkönen')
      or (Posicao[i].Idade <> '22') and (Posicao[i - 1].Idolo = 'K. Räikkönen') then
      begin
        Result:= False;
        certo:= 0;
      end;
    end;
  end;

  if (certo = 1) then
  begin
    cond12.Font.Color:= clGreen;
    cond12.Font.Style:= cond12.Font.Style + [fsStrikeOut];
  end;
  if (certo = 0) then
  begin
    cond12.Font.Color:= clRed;
    cond12.Font.Style:= cond12.Font.Style - [fsStrikeOut];
  end
  else if (certo <> 0) and (certo <> 1) then
  begin
    cond12.Font.Color:= clBlack;
    cond12.Font.Style:= cond12.Font.Style - [fsStrikeOut];
  end;
end;

function TKartForm.Condicional13: Boolean;
var
  i27, i29, i25: Integer;
  i, certo: Integer;
begin
  Result:= False;
  certo:= 999;
  i27:= -1;
  i29:= -1;
  i25:= -1;

  for i := 1 to 5 do
  begin
    if Posicao[i].Idade = '27' then
       i27:= i;
    if Posicao[i].Idade = '29' then
       i29:= i;
    if Posicao[i].Idade = '25' then
       i25:= i;
  end;

  if (i27 <> -1) and (i29 <> -1) and (i25 <> -1) then
  begin
    if (i29 < i27) and (i27 < i25) then
    begin
       Result:= True;
       certo:= 1;
    end
    else if (i29 > i27) and (i27 < i25) or (i29 < i27) and (i27 > i25) then
    begin
       Result:= False;
       certo:= 0;
    end;
  end;

  if (certo = 1) then
  begin
    cond13.Font.Color:= clGreen;
    cond13.Font.Style:= cond13.Font.Style + [fsStrikeOut];
  end;
  if (certo = 0) then
  begin
    cond13.Font.Color:= clRed;
    cond13.Font.Style:= cond13.Font.Style - [fsStrikeOut];
  end
  else if (certo <> 0) and (certo <> 1) then
  begin
    cond13.Font.Color:= clBlack;
    cond13.Font.Style:= cond13.Font.Style - [fsStrikeOut];
  end;
end;

function TKartForm.Condicional14: Boolean;
var
  i, certo: integer;
begin
  Result:= False;
  certo:= 999;
  for i := 1 to 5 do
  begin
    if (Posicao[i].Nome <> '') and (Posicao[i - 1].Idade <> '') then
    begin
      if (Posicao[i].Nome = 'Felipe') and (Posicao[i - 1].Idade = '27') then
      begin
        Result:= True;
        certo:= 1;
      end
      else if (Posicao[i].Nome = 'Felipe') and (Posicao[i - 1].Idade <> '27') or (Posicao[i].Nome <> 'Felipe') and (Posicao[i - 1].Idade = '27') then
      begin
        Result:= False;
        certo:= 0;
      end;
    end;
  end;

  if (certo = 1) then
  begin
    cond14.Font.Color:= clGreen;
    cond14.Font.Style:= cond14.Font.Style + [fsStrikeOut];
  end;
  if (certo = 0) then
  begin
    cond14.Font.Color:= clRed;
    cond14.Font.Style:= cond14.Font.Style - [fsStrikeOut];
  end
  else if (certo <> 0) and (certo <> 1) then
  begin
    cond14.Font.Color:= clBlack;
    cond14.Font.Style:= cond14.Font.Style - [fsStrikeOut];
  end;;
end;

function TKartForm.Condicional15: Boolean;
var
  i, certo: integer;
begin
  Result:= False;
  certo:= 999;
  for i := 1 to 5 do
  begin
    if (Posicao[i].Carro <> '') and (Posicao[i].Idade <> '') then
    begin
      if (Posicao[i].Carro = 'SUV') and (Posicao[i].Idade = '29') then
      begin
        Result:= True;
        certo:= 1;
      end
      else if (Posicao[i].Carro = 'SUV') and (Posicao[i].Idade <> '29') or (Posicao[i].Carro <> 'SUV') and (Posicao[i].Idade = '29') then
      begin
        Result:= False;
        certo:= 0;
      end;
    end;
  end;

  if (certo = 1) then
  begin
    cond15.Font.Color:= clGreen;
    cond15.Font.Style:= cond15.Font.Style + [fsStrikeOut];
  end;
  if (certo = 0) then
  begin
    cond15.Font.Color:= clRed;
    cond15.Font.Style:= cond15.Font.Style - [fsStrikeOut];
  end
  else if (certo <> 0) and (certo <> 1) then
  begin
    cond15.Font.Color:= clBlack;
    cond15.Font.Style:= cond15.Font.Style - [fsStrikeOut];
  end;
end;

function TKartForm.Condicional16: Boolean;
var
  i, certo: integer;
begin
  Result:= False;
  certo:= 999;

  for i := 1 to 4 do
  begin
    if (Posicao[i].Nome <> '') and (Posicao[i + 1].Idade <> '')
    or (Posicao[i].Nome <> '') and (Posicao[i - 1].Idade <> '') then
    begin
      if (Posicao[i].Nome = 'Emerson') and ((Posicao[i - 1].Idade = '25')
      or (Posicao[i + 1].Idade = '25')) then
      begin
        Result:= True;
        certo:= 1;
      end;
      if (Posicao[i].Nome = 'Emerson') and (Posicao[i - 1].Idade <> '25')
      and (Posicao[i + 1].Idade <> '25') and (Posicao[i - 1].Idade <> '')
      and (Posicao[i +1].Idade <> '')then
      begin
        Result:= False;
        certo:= 0;
      end;
    end;
  end;

  if (certo = 1) then
  begin
    cond16.Font.Color:= clGreen;
    cond16.Font.Style:= cond16.Font.Style + [fsStrikeOut];
  end;
  if (certo = 0) then
  begin
    cond16.Font.Color:= clRed;
    cond16.Font.Style:= cond16.Font.Style - [fsStrikeOut];
  end
  else if (certo <> 0) and (certo <> 1) then
  begin
    cond16.Font.Color:= clBlack;
    cond16.Font.Style:= cond16.Font.Style - [fsStrikeOut];
  end;
end;

function TKartForm.Condicional17: Boolean;
var
  i, certo: integer;
begin
  Result:= False;
  certo:= 999;
  for i := 1 to 5 do
  begin
    if (Posicao[i].Idade <> '') and (Posicao[i].Idolo <> '') then
    begin
      if (Posicao[i].Idade = '27') and (Posicao[i].Idolo = 'N. Piquet') then
      begin
        Result:= True;
        certo:= 1;
      end
      else if (Posicao[i].Idade = '27') and (Posicao[i].Equipe <> 'N. Piquet') or (Posicao[i].Idade <> '27') and (Posicao[i].Idolo = 'N. Piquet') then
      begin
        Result:= False;
        certo:= 0;
      end;
    end;
  end;

  if (certo = 1) then
  begin
    cond17.Font.Color:= clGreen;
    cond17.Font.Style:= cond17.Font.Style + [fsStrikeOut];
  end;
  if (certo = 0) then
  begin
    cond17.Font.Color:= clRed;
    cond17.Font.Style:= cond17.Font.Style - [fsStrikeOut];
  end
  else if (certo <> 0) and (certo <> 1) then
  begin
    cond17.Font.Color:= clBlack;
    cond17.Font.Style:= cond17.Font.Style - [fsStrikeOut];
  end;
end;

function TKartForm.Condicional18: Boolean;
var
  iEmerson, iProst, iSedan: Integer;
  i, certo: Integer;
begin
  Result:= False;
  certo:= 999;
  iEmerson:= -1;
  iProst:= -1;
  iSedan:= -1;

  for i := 1 to 5 do
  begin
    if Posicao[i].Nome = 'Emerson' then
       iEmerson:= i;
    if Posicao[i].Idolo = 'A. Prost' then
       iProst:= i;
    if Posicao[i].Carro = 'sedan' then
       iSedan:= i;
  end;

  if (iEmerson <> -1) and (iProst <> -1) and (iSedan <> -1) then
  begin
    if (iProst < iEmerson) and (iEmerson < iSedan) then
    begin
       Result:= True;
       certo:= 1;
    end
    else if (iProst > iEmerson) and (iEmerson < iSedan) or (iProst < iEmerson) and (iEmerson > iSedan) then
    begin
       Result:= False;
       certo:= 0;
    end;
  end;

  if (certo = 1) then
  begin
    cond18.Font.Color:= clGreen;
    cond18.Font.Style:= cond18.Font.Style + [fsStrikeOut];
  end;
  if (certo = 0) then
  begin
    cond18.Font.Color:= clRed;
    cond18.Font.Style:= cond18.Font.Style - [fsStrikeOut];
  end
  else if (certo <> 0) and (certo <> 1) then
  begin
    cond18.Font.Color:= clBlack;
    cond18.Font.Style:= cond18.Font.Style - [fsStrikeOut];
  end;
end;

function TKartForm.Condicional19: Boolean;
var
  iBruno, iRubens, iRBR: Integer;
  i, certo: Integer;
begin
  Result:= False;
  certo:= 999;
  iBruno:= -1;
  iRubens:= -1;
  iRBR:= -1;

  for i := 1 to 5 do
  begin
    if Posicao[i].Nome = 'Bruno' then
       iBruno:= i;
    if Posicao[i].Nome = 'Rubens' then
       iRubens:= i;
    if Posicao[i].Equipe = 'RBR' then
       iRBR:= i;
  end;

  if (iBruno <> -1) and (iRubens <> -1) and (iRBR <> -1) then
  begin
    if (iRubens < iBruno) and (iBruno < iRBR) then
    begin
       Result:= True;
       certo:= 1;
    end;
    if (iRubens > iBruno) and (iBruno < iRBR) or (iRubens < iBruno) and (iBruno > iRBR) then
    begin
       Result:= False;
       certo:= 0;
    end;
  end;

  if (certo = 1) then
  begin
    cond19.Font.Color:= clGreen;
    cond19.Font.Style:= cond19.Font.Style + [fsStrikeOut];
  end;
  if (certo = 0) then
  begin
    cond19.Font.Color:= clRed;
    cond19.Font.Style:= cond19.Font.Style - [fsStrikeOut];
  end
  else if (certo <> 0) and (certo <> 1) then
  begin
    cond19.Font.Color:= clBlack;
    cond19.Font.Style:= cond19.Font.Style - [fsStrikeOut];
  end;
end;

function TKartForm.Condicional20: Boolean;
var
  i, certo: integer;
begin
  Result:= False;
  certo:= 999;
  for i := 1 to 5 do
  begin
    if (Posicao[i].Idolo <> '') and (Posicao[i].Idade <> '') then
    begin
      if (Posicao[i].Idolo = 'F. Alonso') and (Posicao[i].Idade = '25') then
      begin
        Result:= True;
        certo:= 1;
      end
      else if (Posicao[i].Idolo = 'F. Alonso') and (Posicao[i].Idade <> '25') or (Posicao[i].Idolo <> 'F. Alonso') and (Posicao[i].Idade = '25') then
      begin
        Result:= False;
        certo:= 0;
      end;
    end;
  end;

  if (certo = 1) then
  begin
    cond20.Font.Color:= clGreen;
    cond20.Font.Style:= cond20.Font.Style + [fsStrikeOut];
  end;
  if (certo = 0) then
  begin
    cond20.Font.Color:= clRed;
    cond20.Font.Style:= cond20.Font.Style - [fsStrikeOut];
  end
  else if (certo <> 0) and (certo <> 1) then
  begin
    cond20.Font.Color:= clBlack;
    cond20.Font.Style:= cond20.Font.Style - [fsStrikeOut];
  end;
end;

function TKartForm.Condicional21: Boolean;
var
  i, certo: integer;
begin
  Result:= False;
  certo:= 999;
  for i := 1 to 4 do
  begin
    if (Posicao[i].Capacete <> '') and (Posicao[i + 1].Idade <> '') then
    begin
      if (Posicao[i].Capacete = 'vermelho') and (Posicao[i + 1].Idade = '25') then
      begin
        Result:= True;
        certo:= 1;
      end
      else if (Posicao[i].Capacete = 'vermelho') and (Posicao[i + 1].Idade <> '25') or (Posicao[i].Capacete <> 'vermelho') and (Posicao[i + 1].Idade = '25') then
      begin
        Result:= False;
        certo:= 0;
      end;
    end;
  end;

  if (certo = 1) then
  begin
    cond21.Font.Color:= clGreen;
    cond21.Font.Style:= cond21.Font.Style + [fsStrikeOut];
  end;
  if (certo = 0) then
  begin
    cond21.Font.Color:= clRed;
    cond21.Font.Style:= cond21.Font.Style - [fsStrikeOut];
  end
  else if (certo <> 0) and (certo <> 1) then
  begin
    cond21.Font.Color:= clBlack;
    cond21.Font.Style:= cond21.Font.Style - [fsStrikeOut];
  end;
end;

function TKartForm.Condicional22: Boolean;
var
  i, certo: integer;
begin
  Result:= False;
  certo:= 999;
  for i := 1 to 4 do
  begin
    if (Posicao[i].Nome <> '') and (Posicao[i + 1].Capacete <> '') then
    begin
      if (Posicao[i].Nome = 'Felipe') and (Posicao[i + 1].Capacete = 'branco') then
      begin
        Result:= True;
        certo:= 1;
      end
      else if (Posicao[i].Nome = 'Felipe') and (Posicao[i + 1].Capacete <> 'branco') or (Posicao[i].Nome <> 'Felipe') and (Posicao[i + 1].Capacete = 'branco') then
      begin
        Result:= False;
        certo:= 0;
      end;
    end;
  end;

  if (certo = 1) then
  begin
    cond22.Font.Color:= clGreen;
    cond22.Font.Style:= cond22.Font.Style + [fsStrikeOut];
  end;
  if (certo = 0) then
  begin
    cond22.Font.Color:= clRed;
    cond22.Font.Style:= cond22.Font.Style - [fsStrikeOut];
  end
  else if (certo <> 0) and (certo <> 1) then
  begin
    cond22.Font.Color:= clBlack;
    cond22.Font.Style:= cond22.Font.Style - [fsStrikeOut];
  end;
end;

end.

