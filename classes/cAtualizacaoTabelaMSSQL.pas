unit cAtualizacaoTabelaMSSQL;

interface

uses System.Classes,
     Vcl.Controls,
     Vcl.ExtCtrls,
     Vcl.Dialogs,
     FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
     FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
     FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
     FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
     FireDAC.Phys.MSSQL, System.SysUtils, Datasnap.DBClient,
     uEnum, cControleEstoque, cAtulizacaoBancoDeDados, uDTMConexao,
     cCadUsuario, FireDAC.Stan.Param;

type
  TAtualizacaoTableMSSQL = class(TAtualizaBancoDados)
  private
    function tabelaExiste(aNomeTabela, aCampo: string): Boolean;
    procedure Categoria;
    procedure Clientes;
    procedure Produtos;
    procedure Vendas;
    procedure VendasItens;
    procedure Usuario;
    procedure AcaoAcesso;
    procedure UsuariosAcaoAcesso;
    // NOVAS
    procedure StatusClientes;
    procedure Documentos;
    procedure Credito;
  public
    constructor Create(aConexao: TFDConnection);
    destructor Destroy; override;
    procedure Versao1;
  end;

implementation

constructor TAtualizacaoTableMSSQL.Create(aConexao: TFDConnection);
begin
  dtmPrincipalDB := aConexao;
  // Tabelas base primeiro (sem dependências)
  StatusClientes;
  Documentos;
  Categoria;
  // Tabelas com FK
  Clientes;
  Produtos;
  Vendas;
  VendasItens;
  Credito;
  Usuario;
  AcaoAcesso;
  UsuariosAcaoAcesso;
end;

destructor TAtualizacaoTableMSSQL.Destroy;
begin
  inherited;
end;

function TAtualizacaoTableMSSQL.TabelaExiste(aNomeTabela, aCampo: String): Boolean;
var
  Qry: TFDQuery;
begin
  Result := False;
  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := dtmPrincipalDB;
    Qry.SQL.Text :=
      ' SELECT COUNT(COLUMN_NAME) AS Qtde ' +
      ' FROM INFORMATION_SCHEMA.COLUMNS ' +
      ' WHERE TABLE_NAME  = :Tabela ' +
      '   AND COLUMN_NAME = :Campo ';
    Qry.ParamByName('Tabela').AsString := aNomeTabela;
    Qry.ParamByName('Campo').AsString  := aCampo;   // sem espaço!
    Qry.Open;
    if Qry.FieldByName('Qtde').AsInteger > 0 then
      Result := True;
  finally
    Qry.Close;
    FreeAndNil(Qry);
  end;
end;

// ?? TABELAS BASE ?????????????????????????????????????????????????????????????

procedure TAtualizacaoTableMSSQL.StatusClientes;
begin
  if not tabelaExiste('STATUSCLIENTES', 'statusId') then
  begin
    ExecutaDiretoBancoDeDados(
      'CREATE TABLE STATUSCLIENTES( ' +
      '  statusId  int NOT NULL, ' +
      '  descricao varchar(20) NOT NULL, ' +
      '  PRIMARY KEY (statusId) ' +
      ')'
    );
    // Popula os status padrão
    ExecutaDiretoBancoDeDados(
      'INSERT INTO STATUSCLIENTES (statusId, descricao) VALUES ' +
      '(1,''Ativo''), (2,''Bloqueado''), (3,''Atenção''), ' +
      '(4,''Prospecto''), (5,''Inativo'')'
    );
  end;
end;

procedure TAtualizacaoTableMSSQL.Documentos;
begin
  if not tabelaExiste('DOCUMENTOS', 'documentoId') then
  begin
    ExecutaDiretoBancoDeDados(
      'CREATE TABLE DOCUMENTOS( ' +
      '  documentoId int NOT NULL, ' +
      '  descricao   varchar(20) NOT NULL, ' +
      '  PRIMARY KEY (documentoId) ' +
      ')'
    );
    // Popula os tipos de documento padrão
    ExecutaDiretoBancoDeDados(
      'INSERT INTO DOCUMENTOS (documentoId, descricao) VALUES ' +
      '(1,''CPF''), (2,''CNPJ'')'
    );
  end;
end;

procedure TAtualizacaoTableMSSQL.Categoria;
begin
  if not tabelaExiste('CATEGORIAS', 'categoriaId') then
  begin
    ExecutaDiretoBancoDeDados(
      'CREATE TABLE CATEGORIAS( ' +
      '  categoriaId int IDENTITY(1,1) NOT NULL, ' +
      '  descricao   varchar(30) NULL, ' +
      '  PRIMARY KEY (categoriaId) ' +
      ')'
    );
  end;
end;

// ?? TABELAS COM FK ????????????????????????????????????????????????????????????

procedure TAtualizacaoTableMSSQL.Clientes;
begin
  if not tabelaExiste('CLIENTES', 'clienteID') then
  begin
    ExecutaDiretoBancoDeDados(
      'CREATE TABLE CLIENTES( ' +
      '  clienteID      int IDENTITY(1,1) NOT NULL, ' +
      '  nome           varchar(60)  NULL, ' +
      '  endereco       varchar(60)  NULL, ' +
      '  cidade         varchar(50)  NULL, ' +
      '  bairro         varchar(40)  NULL, ' +
      '  estado         varchar(2)   NULL, ' +
      '  cep            varchar(10)  NULL, ' +
      '  telefone       varchar(14)  NULL, ' +
      '  email          varchar(100) NULL, ' +
      '  dataNascimento datetime     NULL, ' +
      '  statusId       int          NULL, ' +
      '  documentoId    int          NULL, ' +
      '  documento      varchar(20)  NULL, ' +
      '  limiteCredito  decimal(10,2) NULL DEFAULT(0), ' +
      '  PRIMARY KEY (clienteID), ' +
      '  CONSTRAINT FK_CLIENTES_STATUS    FOREIGN KEY (statusId)    REFERENCES STATUSCLIENTES(statusId), ' +
      '  CONSTRAINT FK_CLIENTES_DOCUMENTOS FOREIGN KEY (documentoId) REFERENCES DOCUMENTOS(documentoId) ' +
      ')'
    );
  end;
end;

procedure TAtualizacaoTableMSSQL.Produtos;
begin
  if not tabelaExiste('PRODUTOS', 'produtoId') then
  begin
    ExecutaDiretoBancoDeDados(
      'CREATE TABLE PRODUTOS( ' +
      '  produtoId   int IDENTITY(1,1) NOT NULL, ' +
      '  nome        varchar(60)   NULL, ' +
      '  descricao   varchar(255)  NULL, ' +
      '  valor       decimal(18,5) NULL DEFAULT(0.00000), ' +
      '  quantidade  decimal(18,5) NULL DEFAULT(0.00000), ' +
      '  categoriaId int           NULL, ' +
      '  foto        varbinary(MAX) NULL, ' +
      '  PRIMARY KEY (produtoId), ' +
      '  CONSTRAINT FK_ProdutosCategorias FOREIGN KEY (categoriaId) REFERENCES CATEGORIAS(categoriaId) ' +
      ')'
    );
  end;
end;

procedure TAtualizacaoTableMSSQL.Vendas;
begin
  if not tabelaExiste('VENDAS', 'vendaId') then
  begin
    ExecutaDiretoBancoDeDados(
      'CREATE TABLE VENDAS( ' +
      '  vendaId    int IDENTITY(1,1) NOT NULL, ' +
      '  clienteID  int           NOT NULL, ' +
      '  dataVenda  datetime      NULL DEFAULT(getdate()), ' +
      '  totalVenda decimal(18,5) NULL DEFAULT(0.00000), ' +
      '  PRIMARY KEY (vendaId), ' +
      '  CONSTRAINT Fk_VendasClientes FOREIGN KEY (clienteID) REFERENCES CLIENTES(clienteID) ' +
      ')'
    );
  end;
end;

procedure TAtualizacaoTableMSSQL.VendasItens;
begin
  if not tabelaExiste('VENDASITENS', 'vendaId') then
  begin
    ExecutaDiretoBancoDeDados(
      'CREATE TABLE VENDASITENS( ' +
      '  vendaId        int           NOT NULL, ' +
      '  produtoId      int           NOT NULL, ' +
      '  valorUnitario  decimal(18,5) NULL DEFAULT(0.00000), ' +
      '  quantidade     decimal(18,5) NULL DEFAULT(0.00000), ' +
      '  totalProduto   decimal(18,5) NULL DEFAULT(0.00000), ' +
      '  PRIMARY KEY (vendaId, produtoId), ' +
      '  CONSTRAINT Fk_VendasItensProdutos FOREIGN KEY (produtoId) REFERENCES PRODUTOS(produtoId) ' +
      ')'
    );
  end;
end;

procedure TAtualizacaoTableMSSQL.Credito;
begin
  if not tabelaExiste('CREDITO', 'creditoId') then
  begin
    ExecutaDiretoBancoDeDados(
      'CREATE TABLE CREDITO( ' +
      '  creditoId int IDENTITY(1,1) NOT NULL, ' +
      '  credito   decimal(18,5) NULL DEFAULT(0), ' +
      '  clienteId int           NULL, ' +
      '  tipo      varchar(10)   NULL, ' +
      '  data      datetime      NULL DEFAULT(getdate()), ' +
      '  vendaId   int           NULL, ' +
      '  PRIMARY KEY (creditoId), ' +
      '  CONSTRAINT FK_CREDITO_CLIENTE FOREIGN KEY (clienteId) REFERENCES CLIENTES(clienteID), ' +
      '  CONSTRAINT FK_CREDITO_VENDA   FOREIGN KEY (vendaId)   REFERENCES VENDAS(vendaId) ' +
      ')'
    );
  end;
end;

procedure TAtualizacaoTableMSSQL.Usuario;
var
  oUsuario: TUsuario;
begin
  if not tabelaExiste('USUARIOS', 'usuarioId') then
  begin
    ExecutaDiretoBancoDeDados(
      'CREATE TABLE USUARIOS( ' +
      '  usuarioId int IDENTITY(1,1) NOT NULL, ' +
      '  nome      varchar(50) NOT NULL, ' +
      '  senha     varchar(40) NOT NULL, ' +
      '  PRIMARY KEY (usuarioId) ' +
      ')'
    );
  end;

  oUsuario := TUsuario.Create(dtmPrincipalDB);
  try
    oUsuario.nome  := 'ADMIN';
    oUsuario.senha := '123';
    if not oUsuario.UsuarioExiste(oUsuario.nome) then
      oUsuario.Inserir;
  finally
    FreeAndNil(oUsuario);
  end;
end;

procedure TAtualizacaoTableMSSQL.AcaoAcesso;
begin
  if not tabelaExiste('ACAOACESSO', 'AcaoAcessoId') then
  begin
    ExecutaDiretoBancoDeDados(
      'CREATE TABLE ACAOACESSO( ' +
      '  AcaoAcessoId int IDENTITY(1,1) NOT NULL, ' +
      '  descricao    varchar(100) NOT NULL, ' +
      '  chave        varchar(60)  NOT NULL, ' +
      '  PRIMARY KEY (AcaoAcessoId) ' +
      ')'
    );
  end;
end;

procedure TAtualizacaoTableMSSQL.UsuariosAcaoAcesso;
begin
  if not tabelaExiste('USUARIOSACAOACESSO', 'AcaoAcessoId') then  // sem espaço!
  begin
    ExecutaDiretoBancoDeDados(
      'CREATE TABLE USUARIOSACAOACESSO( ' +
      '  usuarioId    int NOT NULL, ' +
      '  AcaoAcessoId int NOT NULL, ' +
      '  ativo        bit NOT NULL DEFAULT(1), ' +
      '  PRIMARY KEY (usuarioId, AcaoAcessoId), ' +
      '  CONSTRAINT FK_UsuarioAcaoAcessoUsuario     FOREIGN KEY (usuarioId)    REFERENCES USUARIOS(usuarioId), ' +
      '  CONSTRAINT FK_UsuarioAcaoAcessoAcaoAcesso  FOREIGN KEY (AcaoAcessoId) REFERENCES ACAOACESSO(AcaoAcessoId) ' +
      ')'
    );
  end;
end;

procedure TAtualizacaoTableMSSQL.Versao1;
begin
  if not TabelaExiste('CATEGORIAS', 'teste') then
    ExecutaDiretoBancoDeDados('ALTER TABLE CATEGORIAS ADD teste varchar(30) NULL');

  if TabelaExiste('CATEGORIAS', 'teste') then
    ExecutaDiretoBancoDeDados('ALTER TABLE CATEGORIAS DROP COLUMN teste');

  if not TabelaExiste('PRODUTOS', 'foto') then
    ExecutaDiretoBancoDeDados('ALTER TABLE PRODUTOS ADD foto varbinary(MAX)');
end;

end.
