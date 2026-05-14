inherited frmCadAcaoAcesso: TfrmCadAcaoAcesso
  Caption = 'A'#231#227'o Acesso'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcPrincipal: TPageControl
    ActivePage = tabManutencao
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
      object edtAcaoAcessoId: TLabeledEdit
        Tag = 1
        Left = 305
        Top = 64
        Width = 121
        Height = 21
        EditLabel.Width = 33
        EditLabel.Height = 13
        EditLabel.Caption = 'C'#243'digo'
        MaxLength = 30
        NumbersOnly = True
        TabOrder = 0
      end
      object edtDescricao: TLabeledEdit
        Tag = 2
        Left = 176
        Top = 103
        Width = 401
        Height = 21
        EditLabel.Width = 46
        EditLabel.Height = 13
        EditLabel.Caption = 'Descri'#231#227'o'
        MaxLength = 100
        TabOrder = 1
      end
      object edtChave: TLabeledEdit
        Tag = 2
        Left = 176
        Top = 176
        Width = 401
        Height = 21
        EditLabel.Width = 31
        EditLabel.Height = 13
        EditLabel.Caption = 'Chave'
        MaxLength = 60
        TabOrder = 2
      end
    end
  end
  inherited pnlRodape: TPanel
    inherited btnGravar: TBitBtn
      Top = 6
      ExplicitTop = 6
    end
    inherited btnNavigator: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited FDQListagem: TFDQuery
    Active = True
    SQL.Strings = (
      'SELECT acaoacessoId, descricao ,chave FROM acaoacesso'
      '')
    object FDQListagemacaoacessoId: TFDAutoIncField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'acaoacessoId'
      Origin = 'acaoacessoId'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDQListagemdescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
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
  inherited dtslistagem: TDataSource
    AutoEdit = False
  end
end
