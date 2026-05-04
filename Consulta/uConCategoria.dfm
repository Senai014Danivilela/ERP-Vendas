inherited frmConCategoria: TfrmConCategoria
  Caption = 'frmConCategoria'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TPanel
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
  inherited FDQListagem: TFDQuery
    Active = True
    SQL.Strings = (
      'SELECT categoriaId,'
      '             descricao'
      'FROM CATEGORIAS'
      '  ')
    object FDQListagemcategoriaId: TFDAutoIncField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'categoriaId'
      Origin = 'categoriaId'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDQListagemdescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Origin = 'descricao'
      Size = 30
    end
  end
end
