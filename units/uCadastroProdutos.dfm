object frmCadastroProdutos: TfrmCadastroProdutos
  Left = 419
  Top = 206
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de produtos'
  ClientHeight = 161
  ClientWidth = 436
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 48
    Height = 13
    Caption = 'Descri'#231#227'o'
  end
  object Label2: TLabel
    Left = 16
    Top = 64
    Width = 28
    Height = 13
    Caption = 'Pre'#231'o'
  end
  object Label3: TLabel
    Left = 112
    Top = 64
    Width = 21
    Height = 13
    Caption = 'Tipo'
  end
  object edtDescricao: TEdit
    Left = 16
    Top = 32
    Width = 409
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 0
    OnKeyPress = edtDescricaoKeyPress
  end
  object btnConfirmar: TBitBtn
    Left = 16
    Top = 112
    Width = 89
    Height = 25
    Caption = 'Confirmar'
    TabOrder = 3
    OnClick = btnConfirmarClick
    Kind = bkOK
  end
  object btnCancelar: TBitBtn
    Left = 112
    Top = 112
    Width = 89
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 4
    Kind = bkCancel
  end
  object edtPreco: TEdit
    Left = 16
    Top = 80
    Width = 89
    Height = 21
    TabOrder = 1
    OnExit = edtPrecoExit
    OnKeyPress = edtPrecoKeyPress
  end
  object cbxTipo: TComboBox
    Left = 112
    Top = 80
    Width = 89
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 2
    Text = 'Nenhum'
    Items.Strings = (
      'Nenhum'
      'Unidade'
      'Quilos'
      'Metros')
  end
end
