unit uRelCadProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, RLReport, RLFilters, RLPDFFilter,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmRelCadPRoduto = class(TForm)
    Relatorio: TRLReport;
    FDQCadProdutos: TFDQuery;
    dtsCadProdutos: TDataSource;
    RLPDFFilter1: TRLPDFFilter;
    RLBand2: TRLBand;
    RLBand3: TRLBand;
    RLDraw1: TRLDraw;
    RLLabel1: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLSystemInfo3: TRLSystemInfo;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLBand1: TRLBand;
    RLBand4: TRLBand;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLDraw2: TRLDraw;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    FDQCadProdutosprodutoId: TFDAutoIncField;
    FDQCadProdutosnome: TStringField;
    FDQCadProdutosdescricao: TStringField;
    FDQCadProdutosvalor: TFMTBCDField;
    FDQCadProdutosquantidade: TFMTBCDField;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLBand5: TRLBand;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelCadPRoduto: TfrmRelCadPRoduto;

implementation

{$R *.dfm}







procedure TfrmRelCadPRoduto.FormCreate(Sender: TObject);
begin
    FDQCadProdutos.Open;
end;

procedure TfrmRelCadPRoduto.FormDestroy(Sender: TObject);
begin
   FDQCadProdutos.Close;
end;







end.
