unit uPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uProduto, Data.DBXFirebird, Data.DB, Datasnap.DBClient,
  SimpleDS, Data.SqlExpr, Vcl.Grids, Vcl.DBGrids, Data.DBXInterBase;

type
  TfrmPrincipal = class(TForm)
    btnNovo: TButton;
    btnAlterar: TButton;
    sqlConexao: TSQLConnection;
    dtsProdutos: TDataSource;
    grdProdutos: TDBGrid;
    Detalhes: TGroupBox;
    Label1: TLabel;
    edtDescricao: TEdit;
    Label2: TLabel;
    edtPreco: TEdit;
    cbxTipo: TComboBox;
    Label3: TLabel;
    btnExcluir: TButton;
    sdsProdutos: TSimpleDataSet;
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dtsProdutosDataChange(Sender: TObject; Field: TField);
    procedure btnExcluirClick(Sender: TObject);
    procedure sdsProdutosAfterOpen(DataSet: TDataSet);
  private
    AProduto : TProduto;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses uCadastroProdutos, uUteis;

{$R *.dfm}

procedure TfrmPrincipal.btnNovoClick(Sender: TObject);
begin
  if frmCadastroProdutos = nil then
    Application.CreateForm(TfrmCadastroProdutos, frmCadastroProdutos);

  with frmCadastroProdutos do
  begin
    vAcao := 'I';
    vProduto := nil;
    ShowModal;
    try
      sdsProdutos.Refresh;
    except
    end;
  end;
end;

procedure TfrmPrincipal.btnAlterarClick(Sender: TObject);
begin
  if frmCadastroProdutos = nil then
    Application.CreateForm(TfrmCadastroProdutos, frmCadastroProdutos);

  if not Assigned(AProduto) then
  begin
    Mensagem('Por favor selecione primeiro o produto.');
    exit;
  end;

  with frmCadastroProdutos do
  begin
    vAcao := 'A';
    vProduto := AProduto;
    ShowModal;
    try
      sdsProdutos.Refresh;
    except
    end;    
  end;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  sqlConexao.Params.Values['Database'] := '127.0.0.1:'+ExtractFilePath(Application.ExeName)+'db\exercicio.fdb';

  sqlConexao.Connected := true;

  AProduto := TProduto.Create;

  sdsProdutos.Close;
  sdsProdutos.DataSet.CommandText := 'select * from produtos order by codigo';
  sdsProdutos.Open;
end;

procedure TfrmPrincipal.sdsProdutosAfterOpen(DataSet: TDataSet);
begin
  TFloatField(sdsProdutos.FieldByName('PRECO')).Currency := true;
end;

procedure TfrmPrincipal.dtsProdutosDataChange(Sender: TObject;
  Field: TField);
begin
  AProduto := AProduto.getProduto(sdsProdutos.FieldByName('CODIGO').AsInteger);

  if not Assigned(AProduto) then
  begin
    edtDescricao.text := '';
    edtPreco.Text := '';
    cbxTipo.ItemIndex := 0;
  end
  else
  begin
    edtDescricao.text := AProduto.Descricao;
    edtPreco.Text := FormatFloat('###0.00##', AProduto.Preco);
    cbxTipo.ItemIndex := AProduto.getIndexTipoProduto;
  end;
end;

procedure TfrmPrincipal.btnExcluirClick(Sender: TObject);
begin
  if not Assigned(AProduto) then
  begin
    Mensagem('Por favor selecione primeiro o produto.');
    exit;
  end;
  
  if MessageDlg('Deseja excluir o produto selecionado?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    exit;

  if AProduto.Excluir then
  begin
    Mensagem('Produto removido com sucesso.');
    AProduto := nil;
    try
      sdsProdutos.Refresh;
    except
    end;    
  end
  else
    Mensagem('Erro ao apagar o produto.');
end;

end.
