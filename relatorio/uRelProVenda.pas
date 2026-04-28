unit uRelProVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, RLReport, RLFilters, RLPDFFilter,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uDTMConexao ;

type
  TfrmrRelProVenda = class(TForm)
    dtsVenda: TDataSource;
    RLPDFFilter1: TRLPDFFilter;
    Relatorio: TRLReport;
    RLBand2: TRLBand;
    RLDraw1: TRLDraw;
    RLLabel1: TRLLabel;
    RLBand3: TRLBand;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLSystemInfo3: TRLSystemInfo;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLDraw2: TRLDraw;
    FDQVenda: TFDQuery;
    dtsVendasItens: TDataSource;
    FDQVendasItens: TFDQuery;
    FDQVendasItensvendaId: TIntegerField;
    FDQVendasItensprodutoId: TIntegerField;
    FDQVendasItensnome: TStringField;
    FDQVendasItensquantidade: TFMTBCDField;
    FDQVendasItensvalorUnitario: TFMTBCDField;
    FDQVendasItenstotalProduto: TFMTBCDField;
    FDQVendavendaId: TFDAutoIncField;
    FDQVendaClienteId: TIntegerField;
    FDQVendanome: TStringField;
    FDQVendadataVenda: TSQLTimeStampField;
    FDQVendaTotalVenda: TBCDField;
    RLDBText3: TRLDBText;
    BandaDoGrupo: TRLGroup;
    RLBand5: TRLBand;
    RLLabel8: TRLLabel;
    RLBand4: TRLBand;
    RLLabel4: TRLLabel;
    RLBand6: TRLBand;
    RLDraw3: TRLDraw;
    rldbrslttotalProduto: TRLDBResult;
    RLLabel10: TRLLabel;
    RLDBText6: TRLDBText;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText5: TRLDBText;
    RLLabel9: TRLLabel;
    RLBand1: TRLBand;
    rlsbdtl1: TRLSubDetail;
    rlbnd1: TRLBand;
    rldbtxtnome: TRLDBText;
    rldbtxtquantidade: TRLDBText;
    rldbtxtvalorUnitario: TRLDBText;
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmrRelProVenda: TfrmrRelProVenda;

implementation

{$R *.dfm}






procedure TfrmrRelProVenda.FormDestroy(Sender: TObject);
begin
   FDQVenda.Close;
   FDQVendasItens.Close;
end;





end.
