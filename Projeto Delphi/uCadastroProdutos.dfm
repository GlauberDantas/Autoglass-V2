object frmCadastroProduto: TfrmCadastroProduto
  Left = 0
  Top = 0
  Caption = 'Cadastro de Produtos'
  ClientHeight = 319
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
    Height = 227
    Align = alClient
    TabOrder = 1
    object lblProduto: TLabel
      Left = 113
      Top = 10
      Width = 102
      Height = 13
      Caption = 'Descri'#231#227'o do produto'
    end
    object lblDataFab: TLabel
      Left = 8
      Top = 111
      Width = 91
      Height = 13
      Caption = 'Data de fabrica'#231#227'o'
    end
    object lblDataVal: TLabel
      Left = 272
      Top = 111
      Width = 81
      Height = 13
      Caption = 'Data de validade'
    end
    object lblFornecedor: TLabel
      Left = 8
      Top = 62
      Width = 55
      Height = 13
      Caption = 'Fornecedor'
    end
    object lblCodigoFornecedor: TLabel
      Left = 8
      Top = 10
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object edtProduto: TEdit
      Left = 113
      Top = 26
      Width = 280
      Height = 21
      MaxLength = 100
      TabOrder = 0
    end
    object rgSituacaoProduto: TRadioGroup
      Left = 8
      Top = 166
      Width = 385
      Height = 50
      Caption = 'Situa'#231#227'o do produto '
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Ativo'
        'Inativo')
      TabOrder = 1
    end
    object cmbFornecedor: TComboBox
      Left = 8
      Top = 80
      Width = 385
      Height = 21
      TabOrder = 2
    end
    object dtpDataFab: TDateTimePicker
      Left = 8
      Top = 130
      Width = 121
      Height = 24
      Date = 44558.823935162040000000
      Time = 44558.823935162040000000
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object dtpDataVal: TDateTimePicker
      Left = 272
      Top = 130
      Width = 121
      Height = 24
      Date = 44558.823935162040000000
      Time = 44558.823935162040000000
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object edtCodigoProduto: TEdit
      Left = 8
      Top = 26
      Width = 89
      Height = 21
      Enabled = False
      TabOrder = 5
      OnExit = edtCodigoProdutoExit
    end
  end
  object pnlInferior: TPanel
    Left = 0
    Top = 278
    Width = 401
    Height = 41
    Align = alBottom
    TabOrder = 2
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
    TabOrder = 0
    OnClick = rgOperacaoTelaClick
  end
end
