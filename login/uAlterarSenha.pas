unit uAlterarSenha;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,Upricipal,uDTMConexao,cCadUsuario;

type
  TfrmAlterarSenha = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    btnFechar: TBitBtn;
    btnAlterar: TBitBtn;
    Label3: TLabel;
    edtSenhaAtual: TEdit;
    edtSenhaNova: TEdit;
    edtRepetirNovaSenha: TEdit;
    procedure FormShow(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
  private
    procedure LimparEdits;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAlterarSenha: TfrmAlterarSenha;


implementation

{$R *.dfm}

procedure TfrmAlterarSenha.btnAlterarClick(Sender: TObject);
var oUsuario:TUsuario;
begin
  if (edtSenhaAtual.Text=oUsuarioLogado.senha)then begin
    if (edtSenhaNova.Text=edtRepetirNovaSenha.Text)then begin
      try
        oUsuario:=TUsuario.Create(dtmPrincipal.dtmPrincipalDB);
        oUsuario.codigo := oUsuario.codigo;
        oUsuario.senha  := edtSenhaNova.Text;
        oUsuario.AlterarSenha;
        oUsuarioLogado.senha:=edtSenhaNova.Text;
        MessageDlg('Senha alterada',mtInformation,[mbok],0);
        LimparEdits;
      finally
        FreeAndNil(oUsuario);
      end;
    end
    else begin
      MessageDlg('Senha digitadas nao coincidem',mtInformation,[mbok],0);
      edtSenhaNova.SetFocus
    end;

  end
  else begin
      MessageDlg('Senha Atual está invalida ',mtInformation,[mbok],0);
  end;
end;

procedure TfrmAlterarSenha.btnFecharClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmAlterarSenha.FormShow(Sender: TObject);
begin
 LimparEdits;
end;

procedure TfrmAlterarSenha.LimparEdits ;
begin
  edtSenhaAtual.Clear;
  edtSenhaNova.Clear;
  edtRepetirNovaSenha.Clear;
end;


end.
