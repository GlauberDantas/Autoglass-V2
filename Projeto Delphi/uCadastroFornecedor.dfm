object frmCadastroFornecedor: TfrmCadastroFornecedor
  Left = 0
  Top = 0
  Caption = 'Cadastro de Fornecedores'
  ClientHeight = 198
  ClientWidth = 401
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlCentral: TPanel
    Left = 0
    Top = 51
    Width = 401
    Height = 106
    Align = alClient
    TabOrder = 0
    object lblFornecedor: TLabel
      Left = 112
      Top = 10
      Width = 46
      Height = 13
      Caption = 'Descri'#231#227'o'
    end
    object lblCidadeForneceor: TLabel
      Left = 8
      Top = 57
      Width = 104
      Height = 13
      Caption = 'Cidade do fornecedor'
    end
    object lblCodigoFornecedor: TLabel
      Left = 8
      Top = 10
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object edtFornecedor: TEdit
      Left = 112
      Top = 26
      Width = 281
      Height = 21
      MaxLength = 100
      TabOrder = 0
    end
    object cmbCidade: TComboBox
      Left = 8
      Top = 73
      Width = 385
      Height = 21
      TabOrder = 1
    end
    object edtCodigoFornecedor: TEdit
      Left = 8
      Top = 26
      Width = 89
      Height = 21
      Enabled = False
      TabOrder = 2
      OnExit = edtCodigoFornecedorExit
    end
  end
  object pnlInferior: TPanel
    Left = 0
    Top = 157
    Width = 401
    Height = 41
    Align = alBottom
    TabOrder = 1
    object btnGravar: TButton
      Left = 8
      Top = 6
      Width = 75
      Height = 25
      Caption = '&Gravar'
      TabOrder = 0
      OnClick = btnGravarClick
    end
    object btnCancelarSair: TButton
      Left = 294
      Top = 6
      Width = 99
      Height = 25
      Caption = '&Cancelar / Sair'
      TabOrder = 1
      OnClick = btnCancelarSairClick
    end
  end
  object rgOperacaoTela: TRadioGroup
    Left = 0
    Top = 0
    Width = 401
    Height = 51
    Align = alTop
    Columns = 4
    ItemIndex = 0
    Items.Strings = (
      'Incluir'
      'Alterar'
      'Excluir'
      'Consultar')
    TabOrder = 2
    OnClick = rgOperacaoTelaClick
  end
end
