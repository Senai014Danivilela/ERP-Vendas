inherited frmAcaoAcesso: TfrmAcaoAcesso
  Caption = 'frmAcaoAcesso'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcPrincipal: TPageControl
    ExplicitLeft = 16
    ExplicitTop = 33
    inherited tabListagem: TTabSheet
      inherited grdListagem: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'acaoacessoId'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'descricao'
            Width = 454
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'chave'
            Visible = True
          end>
      end
    end
    inherited tabManutencao: TTabSheet
      TabVisible = False
    end
  end
  inherited pnlRodape: TPanel
    inherited btnNavigator: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited FDQListagem: TFDQuery
    SQL.Strings = (
      'SELECT acaoacessoId, descricao ,chave FROM acaoacesso')
    object FDQListagemacaoacessoId: TFDAutoIncField
      DisplayLabel = 'Codigo'
      FieldName = 'acaoacessoId'
      Origin = 'acaoacessoId'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDQListagemdescricao: TStringField
      DisplayLabel = 'Descricao'
      FieldName = 'descricao'
      Origin = 'descricao'
      Required = True
      Size = 100
    end
    object FDQListagemchave: TStringField
      DisplayLabel = 'Chave'
      FieldName = 'chave'
      Origin = 'chave'
      Required = True
      Size = 60
    end
  end
end
