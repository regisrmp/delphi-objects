unit uCadastroProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Buttons, uProduto;

type
  TfrmCadastroProdutos = class(TForm)
    Label1: TLabel;
    edtDescricao: TEdit;
    Label2: TLabel;
    btnConfirmar: TBitBtn;
    btnCancelar: TBitBtn;
    edtPreco: TEdit;
    cbxTipo: TComboBox;
    Label3: TLabel;
    procedure edtPrecoKeyPress(Sender: TObject; var Key: Char);
    procedure edtDescricaoKeyPress(Sender: TObject; var Key: Char);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtPrecoExit(Sender: TObject);
  private
    { Private declarations }
  public
    vAcao : string;
    vProduto : TProduto;
  end;

var
  frmCadastroProdutos: TfrmCadastroProdutos;

implementation

uses uUteis;

{$R *.dfm}

procedure TfrmCadastroProdutos.edtPrecoKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9', #8, ',']) then
    key := #0;
end;

procedure TfrmCadastroProdutos.edtDescricaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (key in ['A'..'Z', 'a' .. 'z', '0'..'9', #8, #32, ',']) then
    key := #0;
end;

procedure TfrmCadastroProdutos.btnConfirmarClick(Sender: TObject);
var
  Produto : TProduto;
begin
  if trim(edtDescricao.Text) = '' then
  begin
    Mensagem('A descrição não pode ser nula.');
    edtDescricao.SetFocus;
    ModalResult := mrNone;
    exit;
  end;

  try
    edtPreco.Text := FormatFloat('###0.00##', StrToFloat(edtPreco.Text));
  except
    Mensagem('Digite um preço válido.');
    edtPreco.SetFocus;
    ModalResult := mrNone;
    exit;
  end;

  if not Assigned(vProduto) then // novo
    Produto := TProduto.Create
  else
    Produto := vProduto;  // alterando

  with Produto do
  begin
    Descricao := edtDescricao.Text;
    Preco :=  StrToFloat(edtPreco.Text);
    TipoProduto := getTipoProduto(cbxTipo.ItemIndex);

    if vAcao = 'I' then
    begin
      if Incluir then
      begin
        Mensagem('O produto foi incluído com sucesso.')
      end;
    end
    else
    begin
      if Alterar then
      begin
        Mensagem('O produto foi alterado com sucesso.')
      end;
    end
  end;
end;

procedure TfrmCadastroProdutos.FormShow(Sender: TObject);
begin
  if vAcao = 'I' then
    Caption :=  'Cadastro de produtos - Incluindo'
  else
    Caption :=  'Cadastro de produtos - Alterando';

  if Assigned(vProduto) then
  begin
    edtDescricao.Text := vProduto.Descricao;
    edtPreco.Text := FormatFloat('###0.00##', vProduto.Preco);
    cbxTipo.ItemIndex := vProduto.getIndexTipoProduto;
  end
  else
  begin
    edtDescricao.Text := '';
    edtPreco.Text := '';
    cbxTipo.ItemIndex := 0;
  end;

  edtDescricao.SetFocus;
end;

procedure TfrmCadastroProdutos.edtPrecoExit(Sender: TObject);
begin
  try
    edtPreco.Text := FormatFloat('###0.00##', StrToFloat(edtPreco.Text));
  except
  end;
end;

end.
