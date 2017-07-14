unit uProduto;

interface

type
  TTipoProduto = (tpNenhum, tpUnidade, tpQuilo, tpMetro);

  TProduto = class
  protected
    FCodigo    : integer;
    FDescricao : string;
    FPreco     : double;
    FTipoProduto : TTipoProduto;
  public
    constructor Create;
    function Incluir : boolean;
    function Alterar : boolean;
    function Excluir : boolean;
    function getTipoProduto(AIndex : integer) : TTipoProduto;
    function getIndexTipoProduto : integer;
    function getProduto(ACodigo : integer) : TProduto;
    
    property Codigo : integer read FCodigo write FCodigo;
    property Descricao : string read FDescricao write FDescricao;
    property Preco : double read FPreco write FPreco;
    property TipoProduto : TTipoProduto read FTipoProduto write FTipoProduto;
  end;

implementation

uses uPrincipal, DB, SqlExpr;

{ TProduto }

constructor TProduto.Create;
begin
  inherited Create;
  FCodigo := -1;
  FPreco := 0;
  FTipoProduto := tpNenhum;
end;

function TProduto.Incluir: boolean;
begin
  with TSQLQuery.Create(nil) do
  begin
    try
      SQLConnection := frmPrincipal.sqlConexao;
      SQL.Text := 'insert into produtos (descricao, preco, tipo) values (:pdescricao, :ppreco, :ptipo)';
      Params.ParamValues['pdescricao'] := FDescricao;
      Params.ParamValues['ppreco'] := FPreco;
      Params.ParamValues['ptipo'] := getIndexTipoProduto;
      ExecSQL;

      SQL.Text:= 'commit';
      ExecSQL;

      free;

      Result := true;
    except
      result := false;
      free;
    end;
  end;
end;

function TProduto.Alterar: boolean;
begin
  with TSQLQuery.Create(nil) do
  begin
    try
      SQLConnection := frmPrincipal.sqlConexao;
      SQL.Text := 'update produtos set descricao = :pdescricao, preco = :ppreco, tipo = :ptipo where codigo = :pcodigo';
      Params.ParamValues['pdescricao'] := FDescricao;
      Params.ParamValues['ppreco'] := FPreco;
      Params.ParamValues['ptipo'] := getIndexTipoProduto;
      Params.ParamValues['pcodigo'] := FCodigo;
      ExecSQL;

      SQL.Text:= 'commit';
      ExecSQL;

      free;

      Result := true;
    except
      result := false;
      free;
    end;
  end;
end;

function TProduto.Excluir: boolean;
begin
  with TSQLQuery.Create(nil) do
  begin
    try
      SQLConnection := frmPrincipal.sqlConexao;
      SQL.Text := 'delete from produtos where codigo = :pcodigo';
      Params.ParamValues['pcodigo'] := FCodigo;
      ExecSQL;

      SQL.Text:= 'commit';
      ExecSQL;

      free;

      Result := true;
    except
      result := false;
      free;
    end;
  end;
end;

function TProduto.getTipoProduto(AIndex: integer): TTipoProduto;
begin
  case AIndex of
    0 : Result := tpNenhum;
    1 : Result := tpUnidade;
    2 : Result := tpQuilo;
    3 : Result := tpMetro;
  else
    Result := tpNenhum;
  end;
end;

function TProduto.getIndexTipoProduto: integer;
begin
  case FTipoProduto of
    tpNenhum : Result := 0;
    tpUnidade : Result := 1;
    tpQuilo : Result := 2;
    tpMetro : Result := 3;
  else
    result := 0;
  end;
end;

function TProduto.getProduto(ACodigo: integer): TProduto;
var
  AResult : TProduto;
begin
  with TSQLQuery.Create(nil) do
  begin
    SQLConnection := frmPrincipal.sqlConexao;
    SQL.Text := 'select * from produtos where codigo = :pcodigo';
    Params.ParamValues['pcodigo'] := ACodigo;
    Open;

    if not IsEmpty then
    begin
      AResult := TProduto.Create;
      AResult.Codigo := FieldByName('CODIGO').AsInteger;
      AResult.Descricao := FieldByName('DESCRICAO').AsString;
      AResult.FPreco := FieldByName('PRECO').AsFloat;
      AResult.TipoProduto := getTipoProduto(FieldByName('TIPO').AsInteger);
    end
    else
      AResult := nil;

    free;

    Result := AResult;
  end;
end;


end.
