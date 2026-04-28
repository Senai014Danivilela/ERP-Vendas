unit cArquivoIni;

interface

uses System.Classes,
     Vcl.Controls,
     Vcl.ExtCtrls,
     Vcl.Dialogs,
     FireDAC.Comp.Client,
     FireDAC.Stan.Error,
     FireDAC.DatS,
     FireDAC.Phys.Intf,
     FireDAC.DApt.Intf,
     FireDAC.Stan.Async,
     FireDAC.DApt,
     FireDAC.Comp.DataSet,
     System.SysUtils,
     FireDAC.Stan.Param,
     Forms,
     System.IniFiles;

 type
  TArquivoIni = class
   private

   public
   class function ArquivoIni:string; static;
  class  function LerIni(aSecao:string; aEntrada:string):string;static;
  class  procedure AtualizarIni(aSecao,aEntrada,aValor:string); static;

  end;
implementation

{ TArquivoIni }

class function TArquivoIni.ArquivoIni: string;
begin
  Result := ChangeFileExt(Application.ExeName, '.INT' );
end;

class procedure TArquivoIni.AtualizarIni(aSecao, aEntrada, aValor: string);
var
Ini: TIniFile;
begin
try
  Ini := TIniFile.Create(ChangeFileExt(Application.ExeName, '.INI'));
  Ini.WriteString( aSecao, aEntrada, aValor);
finally
  Ini.Free;
end;

end;

class function TArquivoIni.LerIni(aSecao, aEntrada: string): string;
var
Ini: TIniFile;
begin
 try
 Ini:= TIniFile.Create(ArquivoIni);
 result :=  Ini.ReadString(aSecao, aEntrada, 'NAO ENCONTRADO' );
finally
 Ini.Free;
end;
end;

end.
