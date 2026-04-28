unit uSelecionarData;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, RxToolEdit,System.DateUtils;

type
  TfrmSelecionarData = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    edtDataFinal: TDateEdit;
    BitBtn1: TBitBtn;
    edtDataInicio: TDateEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelecionarData: TfrmSelecionarData;

implementation

{$R *.dfm}



procedure TfrmSelecionarData.BitBtn1Click(Sender: TObject);
begin
   if(edtDataFinal.Date)< (edtDataInicio.Date)then begin
     MessageDlg('Data Final não pode ser maior que a data inicio',mtInformation,[mbok],0);
     edtDataFinal.SetFocus;
     Abort;
   end;

   if (edtDataFinal.Date=0) or(edtDataInicio.Date=0) then begin
      MessageDlg('Data Inicia ou Final é campo obrigatorio',mtInformation,[mbok],0);
     edtDataInicio.SetFocus;
     Abort;
   end;


   Close;
end;

procedure TfrmSelecionarData.FormShow(Sender: TObject);
begin
 edtDataInicio.Date := StartOftheMonth(Date);
 edtDataFinal.Date  := EndOfTheMonth(Date);
end;

end.
