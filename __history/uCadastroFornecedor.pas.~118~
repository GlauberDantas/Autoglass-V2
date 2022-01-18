unit uCadastroFornecedor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

const
  C_INCLUIR   = 0;
  C_ALTERAR   = 1;
  C_EXCLUIR   = 2;

type
  TfrmCadastroFornecedor = class(TForm)
    pnlCentral: TPanel;
    pnlInferior: TPanel;
    lblFornecedor: TLabel;
    lblCidadeForneceor: TLabel;
    edtFornecedor: TEdit;
    cmbCidade: TComboBox;
    btnGravar: TButton;
    btnCancelarSair: TButton;
    lblCodigoFornecedor: TLabel;
    edtCodigoFornecedor: TEdit;
    rgOperacaoTela: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure btnCancelarSairClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rgOperacaoTelaClick(Sender: TObject);
    procedure edtCodigoFornecedorExit(Sender: TObject);
  private
    { Private declarations }
    procedure CarregaCombo();
    procedure GravaDados(sFornecedor : string; sCidade : string);
    procedure AlteraDados(sCodigoFornecedor : string; sFornecedor : string; sCidade : string);
    procedure ApagaDados(sCodigoFornecedor : string);
    procedure MontaAmbienteInicial();
    function ValidaInformacoes() : Boolean;
    function VerificaExclusao(sCodigoFornecedor : string) : Boolean;
  public
    { Public declarations }
  end;

var
  frmCadastroFornecedor: TfrmCadastroFornecedor;

  qryGravaDados : TFDQuery;

implementation

uses
  udmAutoglass;

{$R *.dfm}

{ TfrmCadastroFornecedor }

procedure TfrmCadastroFornecedor.AlteraDados(sCodigoFornecedor, sFornecedor,
  sCidade: string);
var
  qryAlteraDados : TFDQuery;
begin
  try
    try
      qryAlteraDados := TFDQuery.Create(nil);
      qryAlteraDados.Connection := dmAutoglass.Connection;

      qryAlteraDados.Close;
      qryAlteraDados.SQL.Clear;
      qryAlteraDados.SQL.Add(' UPDATE tbFornecedor ');
      qryAlteraDados.SQL.Add('    SET tbFornecedor_Descricao = ' + QuotedStr(sFornecedor));
      qryAlteraDados.SQL.Add('        , tbFornecedor_Cidade = ' + QuotedStr(sCidade));
      qryAlteraDados.SQL.Add(' WHERE ');
      qryAlteraDados.SQL.Add('    tbFornecedor_Id = ' + QuotedStr(sCodigoFornecedor));
      qryAlteraDados.ExecSQL;

      MessageDlg('Fornecedor alterado com sucesso.', mtInformation, [mbOk], 0);
    except
      On E:Exception do
      begin
        MessageDlg('Ocorreu um erro durante a execução do método AlteraDados, erro: '+E.Message, mtError, [mbOk], 0);
        exit;
      end;
    end;
  finally
    FreeAndNil(qryAlteraDados);
  end;
end;

procedure TfrmCadastroFornecedor.ApagaDados(sCodigoFornecedor: string);
var
  qryApagaDados : TFDQuery;
begin
  try
    try
      if MessageDlg('Você tem certeza que deseja excluir o fornecedor ' + edtFornecedor.Text +'?'+ #13 +
                    'Essa ação será irreverssível.', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        if VerificaExclusao(sCodigoFornecedor) then
        begin
          qryApagaDados := TFDQuery.Create(nil);
          qryApagaDados.Connection := dmAutoglass.Connection;

          qryApagaDados.Close;
          qryApagaDados.SQL.Clear;
          qryApagaDados.SQL.Add(' DELETE FROM tbFornecedor WHERE tbFornecedor_Id = ' + QuotedStr(sCodigoFornecedor));
          qryApagaDados.ExecSQL;

          MessageDlg('Fornecedor excluído com sucesso.', mtInformation, [mbOk], 0);
        end else
        begin
          MessageDlg('O fornecedor '+QuotedStr(edtFornecedor.Text)+' não poderá ser excluído, pois existem produtos atrelados', mtWarning, [mbOk], 0);
        end;
      end;
    except
      on E:Exception do
      begin
        MessageDlg('Ocorreu um erro durante a execução do método ApagaDados, erro: '+E.Message, mtError, [mbOk], 0);
        exit;
      end;
    end;
  finally
    MontaAmbienteInicial();
    FreeAndNil(qryApagaDados);
  end;
end;

procedure TfrmCadastroFornecedor.btnCancelarSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadastroFornecedor.btnGravarClick(Sender: TObject);
begin
  try
    if (rgOperacaoTela.ItemIndex = C_INCLUIR) then
    begin
      if ValidaInformacoes then
      begin
        GravaDados(edtFornecedor.Text, cmbCidade.Text);
        MontaAmbienteInicial;
      end;
    end else
    if (rgOperacaoTela.ItemIndex = C_ALTERAR) then
    begin
      if ValidaInformacoes then
      begin
        AlteraDados(edtCodigoFornecedor.Text, edtFornecedor.Text, cmbCidade.Text);
        MontaAmbienteInicial;
      end;
    end else
    if (rgOperacaoTela.ItemIndex = C_EXCLUIR) then
    begin
      ApagaDados(edtCodigoFornecedor.Text);
      MontaAmbienteInicial;
    end else
    begin
      edtCodigoFornecedorExit(edtCodigoFornecedor);
    end;
  except
    on E:Exception do
    begin
      MessageDlg('Ocorreu um erro durante o processo de gravação, erro: ' + E.Message + '.', mtWarning, [mbOk], 0);
    end;
  end;
end;

procedure TfrmCadastroFornecedor.CarregaCombo;
var
  qryCarregaCombo : TFDQuery;
begin
  try
    qryCarregaCombo := TFDQuery.Create(nil);
    qryCarregaCombo.Connection := dmAutoglass.Connection;

    qryCarregaCombo.Close;
    qryCarregaCombo.SQL.Clear;
    qryCarregaCombo.SQL.Add(' SELECT ');
  	qryCarregaCombo.SQL.Add('   concat(c.nome,'' - '',e.UF) as Cidade ');
    qryCarregaCombo.SQL.Add(' FROM ');
  	qryCarregaCombo.SQL.Add('   tbCidades c ');
 	  qryCarregaCombo.SQL.Add('   INNER JOIN tbEstados e ON e.id = c.id_estado ');
    qryCarregaCombo.SQL.Add(' ORDER BY ');
    qryCarregaCombo.SQL.Add('  	e.UF, c.nome');
    qryCarregaCombo.Open();

    cmbCidade.Items.Add('');
    while (not qryCarregaCombo.Eof ) do
    begin
      cmbCidade.Items.Add(qryCarregaCombo.FieldByName('Cidade').AsString);

      qryCarregaCombo.Next
    end;
  finally
    FreeAndNil(qryCarregaCombo);
  end;
end;

procedure TfrmCadastroFornecedor.edtCodigoFornecedorExit(Sender: TObject);
var
  qryConsultaRegistros : TFDQuery;
begin
  try
    qryConsultaRegistros := TFDQuery.Create(nil);
    qryConsultaRegistros.Connection := dmAutoglass.Connection;

    qryConsultaRegistros.Close;
    qryConsultaRegistros.SQL.Clear;
    qryConsultaRegistros.SQL.Add(' SELECT ');
  	qryConsultaRegistros.SQL.Add('   tbFornecedor_Id, tbFornecedor_Descricao, tbFornecedor_Cidade ');
    qryConsultaRegistros.SQL.Add(' FROM ');
  	qryConsultaRegistros.SQL.Add('   tbFornecedor ');
 	  qryConsultaRegistros.SQL.Add(' WHERE ');
    qryConsultaRegistros.SQL.Add('   tbFornecedor_Id = ' + QuotedStr(edtCodigoFornecedor.text));
    qryConsultaRegistros.SQL.Add(' ORDER BY ');
    qryConsultaRegistros.SQL.Add('  	tbFornecedor_Descricao');
    qryConsultaRegistros.Open();

    if not qryConsultaRegistros.IsEmpty then
    begin
      edtCodigoFornecedor.Text := qryConsultaRegistros.FieldByName('tbFornecedor_Id').AsString;
      edtFornecedor.Text       := qryConsultaRegistros.FieldByName('tbFornecedor_Descricao').AsString;
      cmbCidade.ItemIndex      := cmbCidade.Items.IndexOf(qryConsultaRegistros.FieldByName('tbFornecedor_Cidade').AsString);
    end;

  finally
    FreeAndNil(qryConsultaRegistros);
  end;
end;

procedure TfrmCadastroFornecedor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(qryGravaDados);
end;

procedure TfrmCadastroFornecedor.FormCreate(Sender: TObject);
begin
  CarregaCombo();

  qryGravaDados := TFDQuery.Create(nil);
  qryGravaDados.Connection := dmAutoglass.Connection;
end;

procedure TfrmCadastroFornecedor.GravaDados(sFornecedor, sCidade: string);
begin
  try
    try
      qryGravaDados.Close;
      qryGravaDados.SQL.Clear;
      qryGravaDados.SQL.Add(' INSERT INTO tbFornecedor(tbFornecedor_Descricao, tbFornecedor_Cidade)');
      qryGravaDados.SQL.Add(' VALUES (' + QuotedStr(sFornecedor));
      qryGravaDados.SQL.Add('        ,' + QuotedStr(sCidade));
      qryGravaDados.SQL.Add('        )');
      qryGravaDados.ExecSQL;

      MessageDlg('O Fornecedor '+sFornecedor+' foi gravado com sucesso!', mtInformation, [mbOk], 0);
    except
      On E:Exception do
      begin
        MessageDlg('Ocorreu um erro durante a execução do método GravaDados, erro: '+E.Message, mtError, [mbOk], 0);
        exit;
      end;
    end;
  finally
    MontaAmbienteInicial;
  end;
end;

procedure TfrmCadastroFornecedor.MontaAmbienteInicial;
begin
  edtCodigoFornecedor.Clear;
  edtFornecedor.Clear;
  cmbCidade.ItemIndex := 0;
end;

procedure TfrmCadastroFornecedor.rgOperacaoTelaClick(Sender: TObject);
begin
  if rgOperacaoTela.ItemIndex = C_INCLUIR then
  begin
    MontaAmbienteInicial;
    edtCodigoFornecedor.Enabled := False;
    btnGravar.Caption := 'Gravar';
  end else
  if rgOperacaoTela.ItemIndex = C_ALTERAR then
  begin
    MontaAmbienteInicial;
    edtCodigoFornecedor.Enabled := True;
    btnGravar.Caption := 'Alterar';
  end else
  if rgOperacaoTela.ItemIndex = C_EXCLUIR then
  begin
    MontaAmbienteInicial;
    edtCodigoFornecedor.Enabled := True;
    btnGravar.Caption := 'Excluir';
  end else
  begin
    edtCodigoFornecedor.Enabled := True;
    btnGravar.Caption := 'Consultar';
  end;
end;

function TfrmCadastroFornecedor.ValidaInformacoes: Boolean;
begin
  Result:= True;

  if (edtFornecedor.Text = EmptyStr) then
  begin
    MessageDlg('Por favor, preencha o nome do Fornecedor.', mtWarning, [mbOk], 0);
    Result := False;
    Exit;
  end;

  if (cmbCidade.Text = EmptyStr) then
  begin
    MessageDlg('Por favor, selecione a cidade.', mtWarning, [mbOk], 0);
    Result := False;
    Exit;
  end;
end;

function TfrmCadastroFornecedor.VerificaExclusao(
  sCodigoFornecedor: string): Boolean;
var
  qryVerificaExclusao : TFDQuery;
begin
  try
    try
      qryVerificaExclusao := TFDQuery.Create(nil);
      qryVerificaExclusao.Connection := dmAutoglass.Connection;

      qryVerificaExclusao.Close;
      qryVerificaExclusao.SQL.Clear;
      qryVerificaExclusao.SQL.Add(' SELECT 1 FROM tbProduto WHERE tbFornecedor_Id = ' + QuotedStr(sCodigoFornecedor));
      qryVerificaExclusao.Open();

      Result := (qryVerificaExclusao.IsEmpty);
    except
      on E:Exception do
      begin
        MessageDlg('Ocorreu um erro durante a execução do método VerificaExclusao, erro: '+E.Message, mtError, [mbOk], 0);
        exit;
      end;
    end;
  finally
    FreeAndNil(qryVerificaExclusao);
  end;
end;

end.
