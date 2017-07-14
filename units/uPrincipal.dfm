object frmPrincipal: TfrmPrincipal
  Left = 192
  Top = 124
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Menu principal - Produtos'
  ClientHeight = 428
  ClientWidth = 591
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object btnNovo: TButton
    Left = 8
    Top = 392
    Width = 75
    Height = 23
    Caption = 'Novo'
    TabOrder = 0
    OnClick = btnNovoClick
  end
  object btnAlterar: TButton
    Left = 88
    Top = 392
    Width = 75
    Height = 23
    Caption = 'Alterar'
    TabOrder = 1
    OnClick = btnAlterarClick
  end
  object grdProdutos: TDBGrid
    Left = 8
    Top = 8
    Width = 577
    Height = 249
    DataSource = dtsProdutos
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'CODIGO'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRICAO'
        Title.Caption = 'Descri'#231#227'o'
        Width = 400
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRECO'
        Title.Caption = 'Pre'#231'o'
        Visible = True
      end>
  end
  object Detalhes: TGroupBox
    Left = 8
    Top = 264
    Width = 409
    Height = 113
    Caption = 'Detalhes do produto selecionado'
    TabOrder = 3
    object Label1: TLabel
      Left = 8
      Top = 20
      Width = 48
      Height = 13
      Caption = 'Descri'#231#227'o'
    end
    object Label2: TLabel
      Left = 8
      Top = 64
      Width = 28
      Height = 13
      Caption = 'Pre'#231'o'
    end
    object Label3: TLabel
      Left = 136
      Top = 64
      Width = 21
      Height = 13
      Caption = 'Tipo'
    end
    object edtDescricao: TEdit
      Left = 8
      Top = 36
      Width = 393
      Height = 21
      ReadOnly = True
      TabOrder = 0
    end
    object edtPreco: TEdit
      Left = 8
      Top = 80
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 1
    end
    object cbxTipo: TComboBox
      Left = 136
      Top = 80
      Width = 89
      Height = 21
      Style = csDropDownList
      Enabled = False
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
  object btnExcluir: TButton
    Left = 168
    Top = 392
    Width = 75
    Height = 23
    Caption = 'Excluir'
    TabOrder = 4
    OnClick = btnExcluirClick
  end
  object sqlConexao: TSQLConnection
    ConnectionName = 'IBConnection'
    DriverName = 'Firebird'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=Data.DBXFirebird'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DbxCommonDriver200.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=20.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXFirebirdMetaDataCommandFactory,DbxFire' +
        'birdDriver200.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXFirebirdMetaDataCommandF' +
        'actory,Borland.Data.DbxFirebirdDriver,Version=20.0.0.0,Culture=n' +
        'eutral,PublicKeyToken=91d62ebb5b0d1b1b'
      'GetDriverFunc=getSQLDriverINTERBASE'
      'LibraryName=dbxfb.dll'
      'LibraryNameOsx=libsqlfb.dylib'
      'VendorLib=fbclient.dll'
      'VendorLibWin64=fbclient.dll'
      'VendorLibOsx=/Library/Frameworks/Firebird.framework/Firebird'
      'Database='
      'User_Name=sysdba'
      'Password=masterkey'
      'Role=RoleName'
      'MaxBlobSize=-1'
      'LocaleCode=0000'
      'IsolationLevel=ReadCommitted'
      'SQLDialect=3'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'TrimChar=False'
      'BlobSize=-1'
      'ErrorResourceFile='
      'RoleName=RoleName'
      'ServerCharSet='
      'Trim Char=False')
    Left = 344
    Top = 64
  end
  object dtsProdutos: TDataSource
    DataSet = sdsProdutos
    OnDataChange = dtsProdutosDataChange
    Left = 544
    Top = 64
  end
  object sdsProdutos: TSimpleDataSet
    Aggregates = <>
    AggregatesActive = True
    Connection = sqlConexao
    DataSet.CommandText = 'select * from produtos'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    AfterOpen = sdsProdutosAfterOpen
    Left = 416
    Top = 64
  end
end
