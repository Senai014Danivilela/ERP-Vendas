unit Upricipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uDTMConexao, Vcl.Menus,uFrmAtualizaDB,
  Vcl.ComCtrls,cAtulizacaoBancoDeDados,cAtualizacaoTabelaMSSQL,cArquivoIni,RLReport,uTelaHeranca, Vcl.ExtCtrls,uDTMGrafico,
  VclTee.TeeGDIPlus, Data.DB, VCLTee.TeEngine, VCLTee.Series, VCLTee.TeeProcs, VCLTee.Chart, VCLTee.DBChart, Vcl.StdCtrls,cFuncao,
  cUsuarioLogado,uProCredito,Enter, Vcl.Imaging.pngimage;

type
  TMenuPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    CADASTRO1: TMenuItem;
    MOVIMENTAAO1: TMenuItem;
     RELATORIOS1: TMenuItem;
    CLIENTES1: TMenuItem;
    N1: TMenuItem;
    CATEGORIA1: TMenuItem;
    PRODUTO1: TMenuItem;
    N2: TMenuItem;
    mnuuFechar: TMenuItem;
    VENDAS1: TMenuItem;
    CLIENTE1: TMenuItem;
    N3: TMenuItem;
    PRODUTO2: TMenuItem;
    VENDAPORDATA1: TMenuItem;
    CATEGORIA2: TMenuItem;
    FICHA1: TMenuItem;
    PRODUTOPORCATEGORIA1: TMenuItem;
    N4: TMenuItem;
    USURIO1: TMenuItem;
    N5: TMenuItem;
    ALTERARSENHA1: TMenuItem;
    stbPricipal: TStatusBar;
    AOACESSO1: TMenuItem;
    N6: TMenuItem;
    USUARIOSVSAOES1: TMenuItem;
    Panel3: TPanel;
    GridPanel1: TGridPanel;
    DBChart3: TDBChart;
    PieSeries2: TPieSeries;
    DBChart2: TDBChart;
    Series2: TFastLineSeries;
    DBChart4: TDBChart;
    Series3: TBarSeries;
    Timer1: TTimer;
    HISTORICODETRANSAO1: TMenuItem;
    DBChart1: TDBChart;
    Series1: TPieSeries;
    SAIR1: TMenuItem;
    Image1: TImage;
    Label1: TLabel;
    //trmAtualizacaoDashBoard: TTimer;
    procedure mnuuFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CATEGORIA1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CLIENTES1Click(Sender: TObject);
    procedure PRODUTO1Click(Sender: TObject);
    procedure VENDAS1Click(Sender: TObject);
    procedure CATEGORIA2Click(Sender: TObject);
    procedure CLIENTE1Click(Sender: TObject);
    procedure FICHA1Click(Sender: TObject);
    procedure PRODUTO2Click(Sender: TObject);
    procedure PRODUTOPORCATEGORIA1Click(Sender: TObject);
    procedure VENDAPORDATA1Click(Sender: TObject);
    procedure USURIO1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ALTERARSENHA1Click(Sender: TObject);
    procedure AOACESSO1Click(Sender: TObject);
    procedure USUARIOSVSAOES1Click(Sender: TObject);
    procedure Panel3Click(Sender: TObject);
    procedure trmAtualizacaoDashBoardTimer(Sender: TObject);
    procedure HISTORICODETRANSAO1Click(Sender: TObject);
    procedure SAIR1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Timer1Timer(Sender: TObject);

  private
    TeclaEnter: TMREnter;
    procedure AtualizacaoBancoDados(aForm: TfrmAtualizaDB);
    procedure AtualizarDshBoard;

    { Private declarations }

  public
    { Public declarations }
  end;

var
  MenuPrincipal: TMenuPrincipal;
  oUsuarioLogado:TUsuarioLogado;

implementation

{$R *.dfm}

uses uCadCategoria, uCadCliente, uCadProduto,uProVendas , uRelCategorias, uRelClienteFicha, uRelClientes, uRelCadProduto, uRelCadProdutoComGrupoCategoria, uSelecionarData, uRelVendaPorData, UCadUsuario, uLogin, uAlterarSenha, uCadAcaoAcesso,cAcaoAcesso, uUsuarioVsAcoes;

procedure TMenuPrincipal.CATEGORIA1Click(Sender: TObject);
begin
         TFuncao.CriarForm(TfrmCadCategorias, oUsuarioLogado, dtmPrincipal.dtmPrincipalDB);
end;



procedure TMenuPrincipal.CATEGORIA2Click(Sender: TObject);
begin
    TFuncao.CriarRelatorio(TfrmRelCategoria, oUsuarioLogado, dtmPrincipal.dtmPrincipalDB);
end;


procedure TMenuPrincipal.CLIENTE1Click(Sender: TObject);
begin
   TFuncao.CriarRelatorio(TfrmRelClientes, oUsuarioLogado, dtmPrincipal.dtmPrincipalDB);

end;

procedure TMenuPrincipal.CLIENTES1Click(Sender: TObject);
begin

     TFuncao.CriarForm(TfrmCadCliente, oUsuarioLogado, dtmPrincipal.dtmPrincipalDB);
end;



procedure TMenuPrincipal.Panel3Click(Sender: TObject);
begin
  AtualizarDshBoard;
end;

procedure TMenuPrincipal.PRODUTO1Click(Sender: TObject);
begin
          TFuncao.CriarForm(TfrmCadProduto, oUsuarioLogado, dtmPrincipal.dtmPrincipalDB);
end;

procedure TMenuPrincipal.PRODUTO2Click(Sender: TObject);
begin
   TFuncao.CriarRelatorio(TfrmRelCadPRoduto, oUsuarioLogado, dtmPrincipal.dtmPrincipalDB);
end;

procedure TMenuPrincipal.PRODUTOPORCATEGORIA1Click(Sender: TObject);
begin
   TFuncao.CriarRelatorio(TfrmRelCadPRodutoComGrupoCategoria, oUsuarioLogado, dtmPrincipal.dtmPrincipalDB);
end;

procedure TMenuPrincipal.SAIR1Click(Sender: TObject);
begin
  // limpa dados do usuário

  // mensagem de saída
  MessageDlg('Usuário '+ oUsuarioLogado.nome+' saiu do sistema.', mtInformation, [mbOK], 0);

  if Assigned(oUsuarioLogado) then
  begin
    oUsuarioLogado.codigo := 0;
    oUsuarioLogado.nome   := '';
    oUsuarioLogado.senha  := '';
  end;


  // esconde o menu principal
  Self.Hide;

  // mostra o menu novamente (se logar)
  Self.Show;
end;



procedure TMenuPrincipal.Timer1Timer(Sender: TObject);
begin
 AtualizarDshBoard;
end;

procedure TMenuPrincipal.trmAtualizacaoDashBoardTimer(Sender: TObject);
begin
  AtualizarDshBoard;
end;

procedure TMenuPrincipal.USUARIOSVSAOES1Click(Sender: TObject);
begin
     TFuncao.CriarForm(TfrmUsuarioVsAcoes, oUsuarioLogado, dtmPrincipal.dtmPrincipalDB);
end;

procedure TMenuPrincipal.USURIO1Click(Sender: TObject);
begin
    TFuncao.CriarForm(TfrmCadUsuario, oUsuarioLogado, dtmPrincipal.dtmPrincipalDB);
end;


procedure TMenuPrincipal.VENDAPORDATA1Click(Sender: TObject);
var
  dtInicio, dtFim: TDate;
begin
  // BLOCO 1: Seleção de datas
  frmSelecionarData := TfrmSelecionarData.Create(Self);
  try
    if not TUsuarioLogado.TenhoAcesso(oUsuarioLogado.codigo, frmSelecionarData.Name, dtmPrincipal.dtmPrincipalDB) then
    begin
      MessageDlg('Usuario: ' + oUsuarioLogado.nome + ', Não tem PERMISSÃO de ACESSO', mtWarning, [mbOK], 0);
      Exit;
    end;

    frmSelecionarData.ShowModal;

    if frmSelecionarData.ModalResult <> mrOk then
      Exit;

    // Salva datas antes de liberar o form
    dtInicio := frmSelecionarData.edtDataInicio.Date;
    dtFim    := frmSelecionarData.edtDataFinal.Date;
  finally
    FreeAndNil(frmSelecionarData);
  end;

  // BLOCO 2: Relatório (separado, sem interferência)
  frmRelVendaPorData := TfrmRelVendaPorData.Create(Self);
  try
    frmRelVendaPorData.FDQVenda.Close;
    frmRelVendaPorData.FDQVenda.ParamByName('DataInicio').AsDate := dtInicio;
    frmRelVendaPorData.FDQVenda.ParamByName('DataFim').AsDate    := dtFim;
    frmRelVendaPorData.FDQVenda.Open;
    frmRelVendaPorData.Relatorio.PreviewModal;
  finally
    FreeAndNil(frmRelVendaPorData);
  end;
end;

procedure TMenuPrincipal.VENDAS1Click(Sender: TObject);
begin
    TFuncao.CriarForm(TfrmProVenda, oUsuarioLogado, dtmPrincipal.dtmPrincipalDB);
end;


procedure TMenuPrincipal.FormCreate(Sender: TObject);
begin
   frmAtualizaDB := TfrmAtualizaDB.Create(Self);
   frmAtualizaDB.Show;
   frmAtualizaDB.Refresh;

   dtmPrincipal := TdtmPrincipal.Create(Self);
   AtualizacaoBancoDados(frmAtualizaDB);

   TeclaEnter:=TMREnter.Create(Self);
   TeclaEnter.FocusEnabled:= true;
   TeclaEnter.FocusColor:=clInfoBk;


   // ?? CRIA AS AÇÕES DOS FORMS
   TAcaoAcesso.CriarAcoes(TfrmCadCategorias, dtmPrincipal.dtmPrincipalDB);
   TAcaoAcesso.CriarAcoes(TfrmCadCliente, dtmPrincipal.dtmPrincipalDB);
   TAcaoAcesso.CriarAcoes(TfrmCadProduto, dtmPrincipal.dtmPrincipalDB);
   TAcaoAcesso.CriarAcoes(TfrmCadUsuario, dtmPrincipal.dtmPrincipalDB);
   TAcaoAcesso.CriarAcoes(TfrmCadAcaoAcesso, dtmPrincipal.dtmPrincipalDB);
   TAcaoAcesso.CriarAcoes(TfrmAlterarSenha, dtmPrincipal.dtmPrincipalDB);
   TAcaoAcesso.CriarAcoes(TfrmProVenda, dtmPrincipal.dtmPrincipalDB);
   TAcaoAcesso.CriarAcoes(TfrmRelVendaPorData, dtmPrincipal.dtmPrincipalDB);
   TAcaoAcesso.CriarAcoes(TfrmRelClienteFicha, dtmPrincipal.dtmPrincipalDB);
   TAcaoAcesso.CriarAcoes(TfrmRelClientes, dtmPrincipal.dtmPrincipalDB);
   TAcaoAcesso.CriarAcoes(TfrmRelCadPRodutoComGrupoCategoria, dtmPrincipal.dtmPrincipalDB);
   TAcaoAcesso.CriarAcoes(TfrmRelCadPRoduto, dtmPrincipal.dtmPrincipalDB);
   TAcaoAcesso.CriarAcoes(TfrmRelCategoria, dtmPrincipal.dtmPrincipalDB);
   TAcaoAcesso.CriarAcoes(TfrmUsuarioVsAcoes, dtmPrincipal.dtmPrincipalDB);
   TAcaoAcesso.CriarAcoes(TfrmSelecionarData, dtmPrincipal.dtmPrincipalDB);
   TAcaoAcesso.CriarAcoes(TfrmProCredito, dtmPrincipal.dtmPrincipalDB);


    TAcaoAcesso.PreencherUsuariosVsAcoes(dtmPrincipal.dtmPrincipalDB);

   DTMGrafico := TDTMGrafico.Create(Self);
   AtualizarDshBoard;

   frmAtualizaDB.Free;
end;

procedure TMenuPrincipal.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;

procedure TMenuPrincipal.FormShow(Sender: TObject);
begin
  try
    oUsuarioLogado := TUsuarioLogado.Create;

    frmLogin:=TfrmLogin.Create(Self);
    frmLogin.ShowModal;

  finally
    frmLogin.Release;
    //StbPrincipal.Panels[0].Text:='USU RIO: '+oUsuarioLogado.nome;
  end;
end;



procedure TMenuPrincipal.HISTORICODETRANSAO1Click(Sender: TObject);
begin
  TFuncao.CriarForm(TfrmProCredito, oUsuarioLogado, dtmPrincipal.dtmPrincipalDB);
end;

procedure TMenuPrincipal.mnuuFecharClick(Sender: TObject);
begin
       Application.Terminate;
end;


procedure TMenuPrincipal.FICHA1Click(Sender: TObject);
begin
    TFuncao.CriarRelatorio(TfrmRelClienteFicha, oUsuarioLogado, dtmPrincipal.dtmPrincipalDB);
end;

procedure TMenuPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 FreeAndNil(TeclaEnter);
 FreeAndNil(dtmPrincipal);
  FreeAndNil(DTMGrafico);
 if Assigned(oUsuarioLogado)then
    FreeAndNil(oUsuarioLogado);
end;

procedure TMenuPrincipal.ALTERARSENHA1Click(Sender: TObject);
begin
 TFuncao.CriarForm(TfrmAlterarSenha, oUsuarioLogado, dtmPrincipal.dtmPrincipalDB);
end;

procedure TMenuPrincipal.AOACESSO1Click(Sender: TObject);
begin
 TFuncao.CriarForm(TfrmCadAcaoAcesso, oUsuarioLogado, dtmPrincipal.dtmPrincipalDB);
end;

{$REGION 'Atualizacao Banco de Dados'}
procedure  TMenuPrincipal.AtualizacaoBancoDados(aForm:TfrmAtualizaDB);
var oAtualizarMSSQL:TAtualizaBancoDadosMSSQL;
begin

  aForm.Refresh;

  try
    oAtualizarMSSQL:= TAtualizaBancoDadosMSSQL.Create(dtmPrincipal.dtmPrincipalDB);
    oAtualizarMSSQL.AtualizarBancoDeDadosMSSQL;
  finally
   if Assigned(oAtualizarMSSQL)then
      FreeAndNil(oAtualizarMSSQL);
  end;
end;
{$ENDREGION}


procedure TMenuPrincipal.AtualizarDshBoard;
begin
  try
  Screen.Cursor:=crSQLWait;
  if DTMGrafico.FDQProdutoEstaoque.Active then
     DTMGrafico.FDQProdutoEstaoque.Close;

  if DTMGrafico.FDQValorVendaPorCliente.Active then
     DTMGrafico.FDQValorVendaPorCliente.Close;

  if DTMGrafico.FDQ10ProdutosMaisVendidos.Active then
     DTMGrafico.FDQ10ProdutosMaisVendidos.Close;

  if DTMGrafico.FDQVendasUltimaSemana.Active then
     DTMGrafico.FDQVendasUltimaSemana.Close;


  DTMGrafico.FDQProdutoEstaoque.Open;
  DTMGrafico.FDQValorVendaPorCliente.Open;
  DTMGrafico.FDQ10ProdutosMaisVendidos.Open;
  DTMGrafico.FDQVendasUltimaSemana.Open;
  finally
    Screen.Cursor:=crDefault;
  end;
end;
end.
