inherited frmConCategoria: TfrmConCategoria
  Caption = 'frmConCategoria'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    ExplicitWidth = 801
    inherited mskPesquisa: TMaskEdit
      ExplicitLeft = 1
      ExplicitTop = 19
      ExplicitWidth = 799
    end
  end
  inherited Panel2: TPanel
    ExplicitWidth = 801
    ExplicitHeight = 320
    inherited grdPesquisa: TDBGrid
      Columns = <
        item
          Expanded = False
          FieldName = 'categoriaId'
          Width = 81
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'descricao'
          Visible = True
        end>
    end
  end
  inherited Panel3: TPanel
    ExplicitTop = 361
    ExplicitWidth = 801
    inherited btnFechar: TBitBtn
      ExplicitLeft = 726
    end
  end
  inherited FDQListagem: TFDQuery
    Active = True
    SQL.Strings = (
      'SELECT categoriaId,'
      '             descricao'
      'FROM CATEGORIAS'
      '  ')
    object FDQListagemcategoriaId: TFDAutoIncField
      FieldName = 'categoriaId'
      Origin = 'categoriaId'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDQListagemdescricao: TStringField
      FieldName = 'descricao'
      Origin = 'descricao'
      Size = 30
    end
  end
end
