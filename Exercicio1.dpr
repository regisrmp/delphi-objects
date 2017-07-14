program Exercicio1;

uses
  Forms,
  uPrincipal in 'units\uPrincipal.pas' {frmPrincipal},
  uCadastroProdutos in 'units\uCadastroProdutos.pas' {frmCadastroProdutos},
  uUteis in 'units\uUteis.pas',
  uProduto in 'units\uProduto.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
