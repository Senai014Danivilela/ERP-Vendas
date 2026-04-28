unit uDTMVenda;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Datasnap.DBClient,uDTMConexao;

type
  TdtmVenda = class(TDataModule)
    FDQCliente: TFDQuery;
    FDQClienteclienteID: TFDAutoIncField;
    FDQClientenome: TStringField;
    FDQProdutos: TFDQuery;
    FDQProdutosprodutoId: TFDAutoIncField;
    FDQProdutosnome: TStringField;
    FDQProdutosvalor: TFMTBCDField;
    FDQProdutosquantidade: TFMTBCDField;
    cdsItensVenda: TClientDataSet;
    dtsProdutos: TDataSource;
    dtsCliente: TDataSource;
    dtsItensVenda: TDataSource;
    cdsItensVendaprodutoId: TIntegerField;
    cdsItensVendaNomeProduto: TStringField;
    cdsItensVendaquantidade: TFloatField;
    cdsItensVendavalorUnitario: TFloatField;
    cdsItensVendavalorTotalProduto: TFloatField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmVenda: TdtmVenda;

implementation


{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}




procedure TdtmVenda.DataModuleCreate(Sender: TObject);
begin
    cdsItensVenda.CreateDataSet;

    FDQCliente.Open;
    FDQProdutos.Open;
end;

procedure TdtmVenda.DataModuleDestroy(Sender: TObject);
begin
    cdsItensVenda.Close;

    FDQCliente.Close;
    FDQProdutos.Close;
end;


end.
