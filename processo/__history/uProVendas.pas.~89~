unit uProVendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHeranca, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask,
  Vcl.ExtCtrls, Vcl.ComCtrls,uDTMConexao, RxToolEdit, RxCurrEdit,uDTMVenda,uEnum,cProVendas,cCadCliente,cCredito,uRelProVenda2;

type
  TfrmProVenda = class(TForm1)
    edtVendaId: TLabeledEdit;
    CATEGORIA: TLabel;
    lkpCliente: TDBLookupComboBox;
    Label1: TLabel;
    edtDataVenda: TDateEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Label2: TLabel;
    edtValorTotal: TCurrencyEdit;
    DBGridItensVenda: TDBGrid;
    DBLookupComboBox1: TDBLookupComboBox;
    Label3: TLabel;
    Panel5: TPanel;
    lkpProduto: TDBLookupComboBox;
    edtValorUnitario: TCurrencyEdit;
    btnAdicionarItem: TBitBtn;
    btnApagarItem: TBitBtn;
    edtQuantidade: TCurrencyEdit;
    edtTotalProduto: TCurrencyEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    FDQListagemvendaId: TFDAutoIncField;
    FDQListagemclienteID: TIntegerField;
    FDQListagemnome: TStringField;
    FDQListagemdataVenda: TSQLTimeStampField;
    FDQListagemtotalVenda: TFMTBCDField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGridItensVendaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnAdicionarItemClick(Sender: TObject);
    procedure lkpProdutoExit(Sender: TObject);
    procedure edtQuantidadeExit(Sender: TObject);
    procedure edtQuantidadeEnter(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnApagarItemClick(Sender: TObject);
    procedure DBGridItensVendaDblClick(Sender: TObject);
    procedure grdListagemDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure FormShow(Sender: TObject);

  private

    { Private declarations }
    dtmVenda:TdtmVenda;
    oVenda:TVenda;
    function Gravar(EstadoDoCadastro:TEstadoCadastro):Boolean; override;
    function Apagar:Boolean; override ;
    function TotalizarProduto(valorUnitario, Quantidade: Double): Double;
    procedure LimparComponenteItem;
    procedure LimparCds;
    procedure CarregarRegistroSelecionado;
    function TotalizarVenda: Double;

  public
    { Public declarations }
  end;

var
  frmProVenda: TfrmProVenda;
  oCredito: TCredito;
  oCliente: TCliente;

implementation

uses
  uRelProVenda;

{$R *.dfm}

  {$REGION 'Override'}
 function TfrmProVenda.Apagar: Boolean;
 begin
 if  oVenda.Selecionar(FDQListagem.FieldByName('vendaId').AsInteger, dtmVenda.cdsItensVenda)then begin
     Result:=oVenda.Apagar;
  end;
 end;


function TfrmProVenda.Gravar(EstadoDoCadastro: TEstadoCadastro): Boolean;
var
  IdVenda: Integer;
  saldo: Double;
  limite: Double;
begin
  Result := False;

  if edtVendaId.Text <> EmptyStr then
    oVenda.VendaId := StrToInt(edtVendaId.Text)
  else
    oVenda.VendaId := 0;

  oVenda.ClienteID  := lkpCliente.KeyValue;
  oVenda.DataVenda  := edtDataVenda.Date;
  oVenda.TotalVenda := edtValorTotal.Value;

  if (EstadoDoCadastro = ecInserir) then
  begin
    //  1. CARREGA CLIENTE
    oCliente.Selecionar(oVenda.ClienteID);

    //  2. BLOQUEADO
    oCliente.PodeVender;

    //  3. VALIDA LIMITE CORRETO
    saldo := oCredito.ObterSaldo(oCliente.codigo);
    limite := oCliente.limiteCredito * 1.1;

    if (saldo - oVenda.TotalVenda) < -limite then
    begin
      MessageDlg('Cliente ultrapassou o limite!', mtWarning, [mbOK], 0);
      Exit;
    end;

    // GRAVA VENDA
    IdVenda := oVenda.Inserir(dtmVenda.cdsItensVenda);
    if IdVenda <= 0 then
    begin
      MessageDlg('Erro ao gravar venda!', mtError, [mbOK], 0);
      Exit;
    end;

    oVenda.VendaId := IdVenda;

    //  PROSPECTO/INATIVO  ATIVO
    if (oCliente.statusId = 5) or (oCliente.statusId = 4) then
    begin
      oCliente.statusId := 1;
      oCliente.Atualizar;
    end;

    // DESCONTA CRÉDITO
    oCredito.DescontarCredito(oCliente.codigo, oVenda.TotalVenda,oVenda.VendaId);

    // ATUALIZA STATUS
    oCliente.AtualizarStatus;
  end
  else if (EstadoDoCadastro = ecAlterar) then
  begin
    if not oVenda.Atualizar(dtmVenda.cdsItensVenda) then
    begin
      MessageDlg('Erro ao atualizar venda!', mtError, [mbOK], 0);
      Exit;
    end;
  end;
  frmRelProVenda2:=TfrmRelProVenda2.Create(self);
  frmRelProVenda2.FDQVenda.Close;
  frmRelProVenda2.FDQVenda.ParamByName('VendaId').AsInteger:= oVenda.VendaId;
  frmRelProVenda2.FDQVenda.Open;

  frmRelProVenda2.FDQVendasItens.Close;
  frmRelProVenda2.FDQVendasItens.ParamByName('VendaId').AsInteger:= oVenda.VendaId;
  frmRelProVenda2.FDQVendasItens.Open;

  frmRelProVenda2.Relatorio.PreviewModal;
  frmRelProVenda2.Release;

  Result := True;
end;


 procedure TfrmProVenda.grdListagemDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
 var
  Grid: TDBGrid;
begin

  Grid := Sender as TDBGrid;

  //ZEBRAAAARRRRR
  if not (gdSelected in State) then
  begin
    if Odd(Grid.DataSource.DataSet.RecNo) then
      Grid.Canvas.Brush.Color := clWhite
    else
      Grid.Canvas.Brush.Color := $00F0F0F0; // cinza claro
  end;

  Grid.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmProVenda.lkpProdutoExit(Sender: TObject);
begin
  inherited;
  if TDBLookupComboBox(Sender).KeyValue<>Null then begin

  edtValorUnitario.Value:=dtmVenda.FDQProdutos.FieldByName('valor').AsFloat;
  edtQuantidade.Value:=1;
  edtTotalProduto.Value:=TotalizarProduto(edtValorUnitario.Value, edtQuantidade.Value)
  end;
end;

{$ENDREGION}

procedure TfrmProVenda.btnAdicionarItemClick(Sender: TObject);
begin
  inherited;
   if lkpProduto.KeyValue=Null  then begin
     MessageDlg('Produto é um campo obrigatório' ,mtInformation,[mbOK],0);
     lkpProduto.SetFocus;
     Abort;
   end;

     if edtValorUnitario.Value<=0  then begin
     MessageDlg('Valor Unitario não pode ser Zero' ,mtInformation,[mbOK],0);
     edtValorUnitario.SetFocus;
     Abort;
   end;

    if edtQuantidade.Value<=0  then begin
    MessageDlg('Quantiadae não pode ser igual a Zero' ,mtInformation,[mbOK],0);
    edtQuantidade.SetFocus;
    Abort;
   end;

    if dtmVenda.cdsItensVenda.Locate('produtoId', lkpProduto.KeyValue, [])  then begin
    MessageDlg('Este Produto já foi selecionado' ,mtInformation,[mbOK],0);
    lkpProduto.SetFocus;
    Abort;
   end;
   edtTotalProduto.Value:=TotalizarProduto(edtValorUnitario.Value, edtQuantidade.Value);

   dtmVenda.cdsItensVenda.Append;
   dtmVenda.cdsItensVenda.FieldByName('produtoId').AsString:=lkpProduto.KeyValue;
   dtmVenda.cdsItensVenda.FieldByName('nomeProduto').AsString:=dtmVenda.FDQProdutos.FieldByName('nome').AsString;
   dtmVenda.cdsItensVenda.FieldByName('quantidade').AsFloat:=edtQuantidade.Value;
   dtmVenda.cdsItensVenda.FieldByName('valorUnitario').AsFloat:=edtValorUnitario.Value;
   dtmVenda.cdsItensVenda.FieldByName('valorTotalProduto').AsFloat:=edtTotalProduto.Value;
   dtmVenda.cdsItensVenda.Post;

   edtValorTotal.Value:=TotalizarVenda;
   LimparComponenteItem;
   lkpProduto.SetFocus;
end;

procedure TfrmProVenda.LimparComponenteItem;
begin
  lkpProduto.KeyValue  :=Null;
  edtQuantidade.value:=0;
  edtValorUnitario.Value:=0;
  edtTotalProduto.value:=0;
end;

 function TfrmProVenda.TotalizarProduto(valorUnitario,Quantidade:Double):Double;
 begin
     Result:=valorUnitario * Quantidade;
 end;

 procedure TfrmProVenda.LimparCds;
 begin
   dtmVenda.cdsItensVenda.First;
   while not dtmVenda.cdsItensVenda.Eof do
   dtmVenda.cdsItensVenda.Delete;

 end;

procedure TfrmProVenda.btnAlterarClick(Sender: TObject);
begin

 if oVenda.Selecionar(FDQListagem.FieldByName('vendaId').AsInteger, dtmVenda.cdsItensVenda) then begin
     edtVendaId.Text     :=IntToStr(oVenda.VendaId);
     lkpCliente.KeyValue :=oVenda.ClienteID;
     edtDataVenda.Date   :=oVenda.DataVenda;
     edtValorTotal.Value :=oVenda.TotalVenda;
  end
   else begin
     btnCancelar.Click;
     Abort;
   end;
     inherited;
end;

procedure TfrmProVenda.btnApagarItemClick(Sender: TObject);
begin
  inherited;

  if VarIsNull(lkpProduto.KeyValue) then
  begin
    MessageDlg('Selecione o produto', mtInformation, [mbOk], 0);
    Exit;
  end;

  with dtmVenda.cdsItensVenda do
  begin
    DisableControls;
    try
      if Locate('produtoId', lkpProduto.KeyValue, []) then
        Delete;
    finally
      EnableControls;
    end;
  end;
end;

procedure TfrmProVenda.btnCancelarClick(Sender: TObject);
begin
  inherited;
LimparCds;
end;

procedure TfrmProVenda.btnGravarClick(Sender: TObject);
begin
  inherited;
   LimparCds;
end;

procedure TfrmProVenda.btnNovoClick(Sender: TObject);
begin
  inherited;
  edtDataVenda.Date:=Date;
  lkpCliente.SetFocus;
  LimparCds;
end;

procedure TfrmProVenda.DBGridItensVendaDblClick(Sender: TObject);
begin
  inherited;
  CarregarRegistroSelecionado;
end;

procedure TfrmProVenda.DBGridItensVendaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
    BloqueiaCTRL_DEL_DBGrid(Key,Shift);
end;


procedure TfrmProVenda.edtQuantidadeEnter(Sender: TObject);
begin
  inherited;
  edtTotalProduto.Value:=TotalizarProduto(edtValorUnitario.Value, edtQuantidade.Value);
end;

procedure TfrmProVenda.edtQuantidadeExit(Sender: TObject);
begin
  inherited;
  edtTotalProduto.Value:=TotalizarProduto(edtValorUnitario.Value, edtQuantidade.Value);
end;

procedure TfrmProVenda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if Assigned(dtmVenda)   then
     FreeAndNil(dtmVenda);

  if Assigned(oVenda)   then
     FreeAndNil(oVenda);

     FreeAndNil(oCredito);
     FreeAndNil(oCliente);
end;

procedure TfrmProVenda.FormCreate(Sender: TObject);
begin
  inherited;
  dtmVenda:=TdtmVenda.Create(Self);

  oVenda:=TVenda.Create(dtmPrincipal.dtmPrincipalDB);

  oCredito := TCredito.Create(dtmPrincipal.dtmPrincipalDB);

 oCliente := TCliente.Create(dtmPrincipal.dtmPrincipalDB);

   IndiceAtual :='nome';
  end;

procedure TfrmProVenda.FormShow(Sender: TObject);
begin
  inherited;
  CentralizarDadosGrid(grdListagem);
  CentralizarTitulosGrid(grdListagem);
  CarregarColunas(grdListagem);
end;

procedure TfrmProVenda.CarregarRegistroSelecionado;
begin
  lkpProduto.KeyValue   := dtmVenda.cdsItensVenda.FieldByName('produtoId').AsString;
  edtQuantidade.Value   := dtmVenda.cdsItensVenda.FieldByName('quantidade').AsFloat;
  edtValorUnitario.Value:= dtmVenda.cdsItensVenda.FieldByName('valorUnitario').AsFloat;
  edtTotalProduto.Value := dtmVenda.cdsItensVenda.FieldByName('valorTotalProduto').AsFloat;
end;

function TfrmProVenda.TotalizarVenda:Double;
begin
   result:=0;
   dtmVenda.cdsItensVenda.First;
   while not dtmVenda.cdsItensVenda.Eof do begin
     result := result + dtmVenda.cdsItensVenda.FieldByName('valorTotalProduto').AsFloat;
     dtmVenda.cdsItensVenda.Next;
   end;
  end;

end.
