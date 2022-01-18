program Autpglass;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  udmAutoglass in 'udmAutoglass.pas' {dmAutoglass: TDataModule},
  uCadastroFornecedor in 'uCadastroFornecedor.pas' {frmCadastroFornecedor},
  uCadastroProdutos in 'uCadastroProdutos.pas' {frmCadastroProduto},
  uRelatorio in 'uRelatorio.pas' {frmRelatorio};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TdmAutoglass, dmAutoglass);
  Application.CreateForm(TfrmCadastroFornecedor, frmCadastroFornecedor);
  Application.CreateForm(TfrmCadastroProduto, frmCadastroProduto);
  Application.CreateForm(TfrmRelatorio, frmRelatorio);
  Application.Run;
end.
