 unit cCadUsuario;

interface

uses
System.Classes,Vcl.Controls,Vcl.ExtCtrls,
Vcl.Dialogs,FireDAC.Stan.Intf,FireDAC.Stan.Option,
FireDAC.Stan.Error,FireDAC.UI.Intf,FireDAC.Phys.Intf,
FireDAC.Stan.Def,FireDAC.Stan.Pool,FireDAC.Stan.Async,
FireDAC.Phys,FireDAC.VCLUI.Wait,Data.DB,FireDAC.Comp.Client,
FireDAC.Phys.MSSQL,System.SysUtils, Datasnap.DBClient,uFuncaoCriptografia, FireDAC.Stan.Param;

type
  TUsuario = class
   private
      dtmPrincipalDB:TFDConnection;
      F_usuarioId:Integer; // int
      F_nome:string; //varchar
      F_senha:string;
      F_perfilId:Integer;
      function getSenha: string;
      procedure setSenha(const Value: string);



   public
   constructor Create(aConexao: TFDConnection);
   destructor Destroy; override;
   function Atualizar:Boolean;
   function Apagar:Boolean;
   function Inserir:Boolean;
   function Selecionar(id:Integer):Boolean;

    function Logar(aUsuario:String; aSenha: string): Boolean;
    function UsuarioExiste(aUsuario: string): Boolean;
    function AlterarSenha: Boolean;
published
   property codigo           :Integer read F_usuarioId      write F_usuarioId;
   property nome             :string  read F_nome           write F_nome;
   property senha            :string  read getSenha         write setSenha;
  end;
implementation

{$REGION 'Create e Destroy'}
constructor TUsuario.Create(aConexao: TFDConnection);
begin
   dtmPrincipalDB:= aConexao;
end;
destructor TUsuario.Destroy;
begin
  inherited;
end;
{$ENDREGION}

{$REGION 'APAGAR'}
 function TUsuario.Apagar: Boolean;
var Qry:TFDQuery;
begin
  if MessageDlg('Apagar o Registro: ' + #13+#13 + // quebrou a linha e pulou a linha
                'Código: ' + IntToStr(F_usuarioId) + #13 +
                'Nome: ' + F_nome, mtConfirmation, [mbYes, mbNo], 0) = mrNo then begin  // da um clique no sim e no não, se clicar não ele retorna como falso
    Result := False;
    Exit;
  end;
  // caso ele responda sim, ele vem pra esse código
  try
    Result := True;
    Qry := TFDQuery.Create(nil);
    Qry.Connection := dtmPrincipalDB;
    Qry.SQL.Clear;
    Qry.SQL.Add('DELETE FROM usuarios ' +
                'WHERE usuarioId =:usuarioId');
    Qry.ParamByName('usuarioId').AsInteger := F_usuarioId;


  //implementação para apagar todas as dependencias de um usuário
    Qry.SQL.Text := 'DELETE FROM USUARIOSACAOACESSO WHERE usuarioId = :usuarioId';
    Qry.ParamByName('usuarioId').AsInteger := F_usuarioId;
    Qry.ExecSQL;

    Qry.SQL.Text := 'DELETE FROM usuarios WHERE usuarioId = :usuarioId';
    Qry.ExecSQL;

    try
      Qry.ExecSQL;
    except
      on E: Exception do
      begin
        Result := False;
      end;
    end;

  finally
    if Assigned(Qry) then
      FreeAndNil(Qry);
  end;
end;

{$ENDREGION}

{$REGION 'Atualizar'}
function TUsuario.Atualizar: Boolean;
var FDQ: TFDQuery;
begin
  Result := False;
  FDQ := TFDQuery.Create(nil);
  try
    FDQ.Connection := dtmPrincipalDB;

    FDQ.SQL.Text :=
      'UPDATE USUARIOS SET '+
      'nome = :nome, '+
      'senha = :senha '+
    //  'perfilId = :perfilId '+
      'WHERE usuarioId = :usuarioId';

    FDQ.ParamByName('usuarioId').AsInteger := Self.F_usuarioId;
    FDQ.ParamByName('nome').AsString       := Self.F_nome;
    FDQ.ParamByName('senha').AsString      := Self.F_senha;
   // FDQ.ParamByName('perfilId').AsInteger  := Self.F_perfilId;

    try

    dtmPrincipalDB.StartTransaction;
      FDQ.ExecSQL;
      dtmPrincipalDB.Commit;
     Except
      dtmPrincipalDB.Rollback;
      Result:=false;
    End;

  finally
    if Assigned(FDQ) then
       FreeAndNil(FDQ);
  end;

end;
{$ENDREGION}

{$REGION 'Inserir'}
 function TUsuario.Inserir: Boolean;
var FDQ: TFDQuery;
begin
  Result := False;
  FDQ := TFDQuery.Create(nil);
  try
    FDQ.Connection := dtmPrincipalDB;

    FDQ.SQL.Text :=
      'INSERT INTO USUARIOS (nome, senha ) '+
      'VALUES (:nome, :senha)';

    FDQ.ParamByName('nome').AsString      := Self.F_nome;
    FDQ.ParamByName('senha').AsString     := Self.F_senha;
    //FDQ.ParamByName('perfilId').AsInteger := Self.F_perfilId;

    dtmPrincipalDB.StartTransaction;
    try
      FDQ.ExecSQL;
      dtmPrincipalDB.Commit;
      Result := True;
    except
      dtmPrincipalDB.Rollback;
    end;

  finally
    FDQ.Free;
  end;
end;
{$ENDREGION}

{$REGION 'Selecionar'}
function TUsuario.Selecionar(id: Integer): Boolean;
var Qry:TFDQuery;
begin
  try
    Result:=true;
    Qry:=TFDQuery.Create(nil);
    Qry.Connection:=dtmPrincipalDB;
    Qry.SQL.Clear;
    Qry.SQL.Add('SELECT usuarioId,'+
                '       nome, '+
                '       senha '+
                '  FROM usuarios '+
                ' WHERE usuarioId=:usuarioId');
    Qry.ParamByName('usuarioId').AsInteger:=id;
    Try
      Qry.Open;

      Self.F_usuarioId     := Qry.FieldByName('usuarioId').AsInteger;
      Self.F_nome          := Qry.FieldByName('nome').AsString;
      Self.F_Senha         := Qry.FieldByName('senha').AsString;;
    Except
      Result:=false;
    End;

  finally
    if Assigned(Qry) then
       FreeAndNil(Qry);
  end;
end;

 function TUsuario.UsuarioExiste(aUsuario:string): Boolean;
var FDQ: TFDQuery;
begin
  try
    FDQ := TFDQuery.Create(nil);
    FDQ.Connection := dtmPrincipalDB;
    FDQ.SQL.Clear;
    FDQ.SQL.Add('SELECT COUNT(usuarioId) AS Qtde '+
                '  FROM USUARIOS '+
                ' WHERE nome=:nome');
    FDQ.ParamByName('nome').AsString := aUsuario;
    try
      FDQ.Open;

      if FDQ.FieldByName('Qtde').AsInteger>0 then
         result := True
      else
         result := False;
    except
      Result := False;
    end;
  finally
    if Assigned(FDQ) then
      FreeAndNil(FDQ);
  end;
end;
{$ENDREGION}

{$REGION 'GET e SET'}
function TUsuario.getSenha:string;
begin
  Result := Descriptografar(Self.F_senha);
end;

procedure TUsuario.setSenha(const Value: string);
begin
  Self.F_senha := Criptografar(Value);
end;
{$ENDREGION}

{$REGION 'LOGIN'}
function TUsuario.Logar(aUsuario, aSenha: String): Boolean;
var Qry: TFDQuery;
begin
  Result := False;
  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := dtmPrincipalDB;

    Qry.SQL.Text :=
      'SELECT usuarioId, nome, senha '+
      'FROM USUARIOS '+
      'WHERE nome = :nome AND senha = :senha';

    Qry.ParamByName('nome').AsString  := aUsuario;
    Qry.ParamByName('senha').AsString := Criptografar(aSenha);

    Qry.Open;

    if not Qry.IsEmpty then
    begin
      F_usuarioId := Qry.FieldByName('usuarioId').AsInteger;
      F_nome      := Qry.FieldByName('nome').AsString;
      F_senha     := Qry.FieldByName('senha').AsString;
     // F_perfilId  := Qry.FieldByName('perfilId').AsInteger;
      Result := True;
    end;

  finally
    Qry.Free;
  end;
end;
{$ENDREGION}

{$REGION 'AlterarSenha'}
 function TUsuario.AlterarSenha:Boolean;
var FDQ:TFDQuery;
begin
  try
    Result:=True;
    FDQ:=TFDQuery.Create(nil);
    FDQ.Connection:=dtmPrincipalDB;
    FDQ.SQL.Clear;
    FDQ.SQL.Add('UPDATE USUARIOS '+
            'SET senha = :senha '+
              'WHERE usuarioId = :usuarioId');
    FDQ.ParamByName('usuarioId').AsInteger :=self.F_usuarioId;
    FDQ.ParamByName('senha').AsString      :=self.F_senha;
    Try
      dtmPrincipalDB.StartTransaction;
      FDQ.ExecSQL;
      dtmPrincipalDB.Commit;
    Except
      dtmPrincipalDB.Rollback;
      Result:=false;
    End;

  finally
    if Assigned(FDQ) then
       FreeAndNil(FDQ);
  end;
end;
{$ENDREGION}

end.

