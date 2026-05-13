unit uUsuarioVsAcoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Vcl.StdCtrls,
  Vcl.Buttons, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,uDTMConexao,uTelaHeranca;

type
  TfrmUsuarioVsAcoes = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    Panel2: TPanel;
    Splitter1: TSplitter;
    grdUsuario: TDBGrid;
    grdAcoes: TDBGrid;
    FDQAcoes: TFDQuery;
    FDQUsuario: TFDQuery;
    dtsAcoes: TDataSource;
    dtsUsuario: TDataSource;
    btnFechar: TBitBtn;
    FDQUsuariousuarioid: TFDAutoIncField;
    FDQUsuarioNome: TStringField;
    FDQAcoesusuarioId: TIntegerField;
    FDQAcoesacaoAcessoId: TIntegerField;
    FDQAcoesdescricao: TStringField;
    FDQAcoesativo: TBooleanField;
    procedure btnFecharClick(Sender: TObject);
    procedure FDQUsuarioAfterScroll(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure grdAcoesDblClick(Sender: TObject);
    procedure grdAcoesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    private
    { Private declarations }
   // procedure SelecionarAcoesAcessoPorUsuario;
    procedure SelecionarAcoesAcessoPorPerfil;
    public
    { Public declarations }
  end;

var
  frmUsuarioVsAcoes: TfrmUsuarioVsAcoes;

implementation

{$R *.dfm}


procedure TfrmUsuarioVsAcoes.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmUsuarioVsAcoes.FDQUsuarioAfterScroll(DataSet: TDataSet);
begin
  SelecionarAcoesAcessoPorPerfil;
end;

procedure TfrmUsuarioVsAcoes.SelecionarAcoesAcessoPorPerfil;
begin
  FDQAcoes.Close;
  FDQAcoes.ParamByName('usuarioId').AsInteger := FDQUsuario.FieldByName('usuarioID').AsInteger;
  FDQAcoes.Open;
end;


procedure TfrmUsuarioVsAcoes.FormShow(Sender: TObject);
begin
  FDQUsuario.Open;
  SelecionarAcoesAcessoPorPerfil;
end;

procedure TfrmUsuarioVsAcoes.grdAcoesDblClick(Sender: TObject);
var
  Qry: TFDQuery;
  vAcaoAcessoId: Integer;
begin
  try
    // salva o ID atual
    vAcaoAcessoId := FDQAcoes.FieldByName('acaoAcessoId').AsInteger;

    Qry := TFDQuery.Create(nil);
    Qry.Connection := dtmPrincipal.dtmPrincipalDB;

    Qry.SQL.Clear;
    Qry.SQL.Add(
      'UPDATE usuariosAcaoAcesso ' +
      '   SET ativo = :ativo ' +
      ' WHERE usuarioId = :usuarioId ' +
      '   AND acaoAcessoId = :acaoAcessoId '
    );

    Qry.ParamByName('usuarioId').AsInteger :=
      FDQAcoes.FieldByName('usuarioId').AsInteger;

    Qry.ParamByName('acaoAcessoId').AsInteger :=
      vAcaoAcessoId;

    Qry.ParamByName('ativo').AsBoolean :=
      not FDQAcoes.FieldByName('ativo').AsBoolean;

    try
      dtmPrincipal.dtmPrincipalDB.StartTransaction;
      Qry.ExecSQL;
      dtmPrincipal.dtmPrincipalDB.Commit;
    except
       dtmPrincipal.dtmPrincipalDB.Rollback;
      raise;
    end;

  finally
    SelecionarAcoesAcessoPorPerfil;

    // volta para o mesmo registro
    FDQAcoes.Locate('acaoAcessoId', vAcaoAcessoId, []);

    if Assigned(Qry) then
      FreeAndNil(Qry);
  end;
end;




procedure TfrmUsuarioVsAcoes.grdAcoesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  begin
  If not FDQAcoes.FieldByName('ativo').AsBoolean  then
  begin
    TDBGrid(Sender).Canvas.Font.Color:= clWhite;
    TDBGrid(Sender).Canvas.Brush.Color:=clRed
  end;
  TDBGrid(Sender).DefaultDrawDataCell(Rect, TDBGrid(Sender).columns[datacol].field, State);
end;
end;




end.
