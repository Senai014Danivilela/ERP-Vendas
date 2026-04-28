unit cUsuarioLogado;

interface

uses System.Classes,
     Vcl.Controls,
     Vcl.ExtCtrls,
     Vcl.Dialogs,
     FireDAC.Stan.Intf,FireDAC.Stan.Option,FireDAC.Stan.Error,FireDAC.UI.Intf,
     FireDAC.Phys.Intf,FireDAC.Stan.Def,FireDAC.Stan.Pool,FireDAC.Stan.Async,
     FireDAC.Phys,FireDAC.VCLUI.Wait,Data.DB,FireDAC.Comp.Client,FireDAC.Phys.MSSQL,
     System.SysUtils,
     uFuncaoCriptografia;

 type
 TUsuarioLogado = class
   private
      F_usuarioId:Integer; // int
      F_nome:string; //varchar
      F_senha:string;

   public
 class function TenhoAcesso(aUsuarioId: Integer; aChave: string; aConexao: TFDConnection):Boolean; static;

published
   property codigo           :Integer read F_usuarioId      write F_usuarioId;
   property nome             :string  read F_nome           write F_nome;
   property senha            :string  read F_senha          write F_senha;


  end;

implementation
{$REGION 'Tenho Acesso'}
class function TUsuarioLogado.TenhoAcesso(
  aUsuarioId: Integer;
  aChave: string;
  aConexao: TFDConnection): Boolean;
var
  Qry: TFDQuery;
begin
  try
    Result:=true;
    Qry:=TFDQuery.Create(nil);
    Qry.Connection:=aConexao;
    Qry.SQL.Clear;
    Qry.SQL.Add('SELECT usuarioId '+
                '  FROM usuariosAcaoAcesso '+
                ' WHERE usuarioId=:usuarioId  '+
                '   AND acaoAcessoId=(SELECT TOP 1 acaoAcessoId FROM acaoAcesso WHERE chave=:chave)'+
                '   AND ativo=1');
    Qry.ParamByName('usuarioId').AsInteger       :=aUsuarioId;
    Qry.ParamByName('chave').AsString            :=aChave;

    Qry.Open;

    if Qry.IsEmpty then
       Result:=false

  finally
    if Assigned(Qry) then
       FreeAndNil(Qry);
  end;
end;


{$ENDREGION}


end.
