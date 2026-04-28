unit uRelClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, RLReport, RLFilters, RLPDFFilter,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmRelClientes = class(TForm)
    Relatorio: TRLReport;
    FDQFicha: TFDQuery;
    dtsFicha: TDataSource;
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
    RLDraw2: TRLDraw;
    RLBand1: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLBand4: TRLBand;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel8: TRLLabel;
    FDQFichaclienteID: TFDAutoIncField;
    FDQFichanome: TStringField;
    FDQFichaendereco: TStringField;
    FDQFichatelefone: TStringField;
    FDQFichaemail: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelClientes: TfrmRelClientes;

implementation

{$R *.dfm}







procedure TfrmRelClientes.FormCreate(Sender: TObject);
begin
    FDQFicha.Open;
end;

procedure TfrmRelClientes.FormDestroy(Sender: TObject);
begin
   FDQFicha.Close;
end;

end.
