unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, IPPeerClient, System.Rtti,
  System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.EngExt,
  Vcl.Bind.DBEngExt, Data.Bind.Components, REST.Client, Data.Bind.ObjectScope;

type
  TfrmPrincipal = class(TForm)
    MenuAutoglass: TMainMenu;
    Cadastros1: TMenuItem;
    Fornecedores1: TMenuItem;
    Produtos1: TMenuItem;
    Relatrios1: TMenuItem;
    ProdutoseFornecedores1: TMenuItem;
    procedure Fornecedores1Click(Sender: TObject);
    procedure Produtos1Click(Sender: TObject);
    procedure ProdutoseFornecedores1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  uCadastroFornecedor, uCadastroProdutos, uRelatorio, udmAutoglass, System.JSON;

{$R *.dfm}

procedure TfrmPrincipal.Fornecedores1Click(Sender: TObject);
begin
  try
    frmCadastroFornecedor := TfrmCadastroFornecedor.Create(nil);
    frmCadastroFornecedor.ShowModal;
  finally
    FreeAndNil(frmCadastroFornecedor);
  end;
end;

procedure TfrmPrincipal.Produtos1Click(Sender: TObject);
begin
  try
    frmCadastroProduto := TfrmCadastroProduto.Create(nil);
    frmCadastroProduto.ShowModal;
  finally
    FreeAndNil(frmCadastroProduto);
  end;
end;

procedure TfrmPrincipal.ProdutoseFornecedores1Click(Sender: TObject);
begin
  try
    frmRelatorio := TfrmRelatorio.Create(nil);
    frmRelatorio.ShowModal;
  finally
    FreeAndNil(frmRelatorio);
  end;
end;

end.
