inherited frmConCategoria: TfrmConCategoria
  Caption = 'frmConCategoria'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Color = 8282689
    ParentBackground = False
    inherited lblIndice: TLabel
      Width = 109
      Caption = 'Campo de Pesquisa'
      Font.Color = clWhite
      ExplicitWidth = 109
    end
  end
  inherited Panel2: TPanel
    inherited grdPesquisa: TDBGrid
      ParentFont = False
      TitleFont.Color = clWhite
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
