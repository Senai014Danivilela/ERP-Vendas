unit uTelaHerancaConsulta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Vcl.StdCtrls,
  Vcl.Buttons, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, Vcl.Mask;

type
  TfrmTelaHerancaConsulta = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    mskPesquisa: TMaskEdit;
    lblIndice: TLabel;
    grdPesquisa: TDBGrid;
    FDQListagem: TFDQuery;
    dtslistagem: TDataSource;
    btnFechar: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFecharClick(Sender: TObject);
    procedure grdPesquisaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure grdPesquisaTitleClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    procedure grdPesquisaDblClick(Sender: TObject);
    procedure mskPesquisaChange(Sender: TObject);
  private
    procedure ExibirLabelIndice(Campo: string; aLabel: TLabel);
    function RetonarCampoTraduzido(Campo: string): string;
    { Private declarations }
  public
    { Public declarations }
    aRetornarIdSelecionado:Variant;
    aIniciarPesquisaId:Variant;
    aCampoId:string;
    IndiceAtual:string;
  end;

var
  frmTelaHerancaConsulta: TfrmTelaHerancaConsulta;

implementation

{$R *.dfm}

procedure TfrmTelaHerancaConsulta.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmTelaHerancaConsulta.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 if FDQListagem.Active then
     FDQListagem.Close;
end;

procedure TfrmTelaHerancaConsulta.FormCreate(Sender: TObject);
begin
  if FDQListagem.Active then
     FDQListagem.Close;
     ExibirLabelIndice(IndiceAtual,lblIndice);
     FDQListagem.Open;
end;

procedure TfrmTelaHerancaConsulta.FormShow(Sender: TObject);
begin
   if (aIniciarPesquisaId<>Unassigned) then
   begin
     FDQListagem.Locate(aCampoId,aIniciarPesquisaId,[loPartialKey])
   end;
end;

procedure TfrmTelaHerancaConsulta.grdPesquisaDblClick(Sender: TObject);
begin
   aRetornarIdSelecionado := FDQListagem.FieldByName(aCampoId).AsVariant;
   Close;
end;

procedure TfrmTelaHerancaConsulta.grdPesquisaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  //Bloqueia o ctrl + Del
  if (Shift = [ssCtrl]) and (Key = 46) then
     key := 0;
end;

procedure TfrmTelaHerancaConsulta.grdPesquisaTitleClick(Column: TColumn);
begin
  IndiceAtual         :=Column.FieldName;
  FDQListagem.IndexFieldNames:=IndiceAtual;
  ExibirLabelIndice(IndiceAtual, lblIndice);
end;

procedure TfrmTelaHerancaConsulta.mskPesquisaChange(Sender: TObject);
begin
 FDQListagem.Locate(IndiceAtual, TMaskEdit(Sender).Text,[loPartialKey])
end;

procedure TfrmTelaHerancaConsulta.ExibirLabelIndice(Campo: string;aLabel:TLabel);
begin
 aLabel.Caption:=RetonarCampoTraduzido(Campo);
end;

function TfrmTelaHerancaConsulta.RetonarCampoTraduzido(Campo: string):string;
var i:Integer;
begin
  for i := 0 to FDQListagem.FieldCount-1 do begin
    if LowerCase(FDQListagem.Fields[i].FieldName) = LowerCase(Campo)then begin
       Result:=FDQListagem.Fields[i].DisplayLabel;
       Break;
    end;
  end;
end;

////procedure TfrmTelaHerancaConsulta.grdPesquisaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
//begin
//
//end;
end.
