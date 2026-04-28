object frmRelCadPRodutoComGrupoCategoria: TfrmRelCadPRodutoComGrupoCategoria
  Left = 0
  Top = 0
  Caption = 'RELATORIO DE PRODUTOS POR CATEGORIAS'
  ClientHeight = 469
  ClientWidth = 798
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Relatorio: TRLReport
    Left = -4
    Top = 0
    Width = 794
    Height = 1123
    DataSource = dtsCadProdutos
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object RLBand2: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 45
      BandType = btColumnHeader
      object RLDraw1: TRLDraw
        Left = 0
        Top = 34
        Width = 718
        Height = 11
        Align = faBottom
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        DrawKind = dkLine
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Pen.Width = 2
      end
      object RLLabel1: TRLLabel
        Left = 3
        Top = 5
        Width = 466
        Height = 24
        Caption = 'LISTAGEM DE PRODUTOS POR CATEGORIAS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object RLBand3: TRLBand
      Left = 38
      Top = 278
      Width = 718
      Height = 62
      BandType = btFooter
      object RLSystemInfo1: TRLSystemInfo
        Left = 10
        Top = 17
        Width = 60
        Height = 16
        Info = itFullDate
        Text = ''
      end
      object RLSystemInfo2: TRLSystemInfo
        Left = 636
        Top = 29
        Width = 25
        Height = 30
        Info = itPageNumber
        Text = ''
      end
      object RLSystemInfo3: TRLSystemInfo
        Left = 689
        Top = 29
        Width = 26
        Height = 26
        Info = itLastPageNumber
        Text = ''
      end
      object RLLabel2: TRLLabel
        Left = 667
        Top = 29
        Width = 16
        Height = 30
        Caption = '/'
      end
      object RLLabel3: TRLLabel
        Left = 556
        Top = 29
        Width = 62
        Height = 16
        Caption = 'PAGINAS'
      end
      object RLDraw2: TRLDraw
        Left = 0
        Top = 0
        Width = 718
        Height = 11
        Align = faTop
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        DrawKind = dkLine
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Pen.Width = 2
      end
    end
    object BandaDoGrupo: TRLGroup
      Left = 38
      Top = 83
      Width = 718
      Height = 195
      DataFields = 'categoriaId'
      object RLBand5: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 33
        BandType = btHeader
        Color = clSilver
        ParentColor = False
        Transparent = False
        object RLLabel8: TRLLabel
          Left = 10
          Top = 6
          Width = 84
          Height = 16
          Caption = 'CATEGORIA:'
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Transparent = False
        end
        object RLDBText5: TRLDBText
          Left = 92
          Top = 6
          Width = 57
          Height = 16
          Alignment = taRightJustify
          DataField = 'produtoId'
          DataSource = dtsCadProdutos
          Text = ''
        end
        object RLDBText6: TRLDBText
          Left = 171
          Top = 6
          Width = 117
          Height = 16
          DataField = 'DescricaoCategoria'
          DataSource = dtsCadProdutos
          Text = ''
        end
        object RLLabel9: TRLLabel
          Left = 155
          Top = 3
          Width = 13
          Height = 16
          Caption = '-'
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Transparent = False
        end
      end
      object RLBand4: TRLBand
        Left = 0
        Top = 33
        Width = 718
        Height = 29
        BandType = btHeader
        Color = clInfoBk
        ParentColor = False
        Transparent = False
        object RLLabel4: TRLLabel
          Left = 3
          Top = 6
          Width = 56
          Height = 16
          Caption = 'CODIGO'
          Color = clInfoBk
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Transparent = False
        end
        object RLLabel5: TRLLabel
          Left = 113
          Top = 6
          Width = 42
          Height = 16
          Caption = 'NOME'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object RLLabel6: TRLLabel
          Left = 489
          Top = 6
          Width = 88
          Height = 16
          Caption = 'QUANTIDADE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object RLLabel7: TRLLabel
          Left = 650
          Top = 6
          Width = 49
          Height = 16
          Caption = 'VALOR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
      end
      object RLBand1: TRLBand
        Left = 0
        Top = 62
        Width = 718
        Height = 20
        object RLDBText1: TRLDBText
          Left = 3
          Top = 3
          Width = 57
          Height = 16
          DataField = 'produtoId'
          DataSource = dtsCadProdutos
          Text = ''
        end
        object RLDBText2: TRLDBText
          Left = 113
          Top = 3
          Width = 36
          Height = 16
          DataField = 'nome'
          DataSource = dtsCadProdutos
          Text = ''
        end
        object RLDBText3: TRLDBText
          Left = 489
          Top = 3
          Width = 67
          Height = 16
          DataField = 'quantidade'
          DataSource = dtsCadProdutos
          Text = ''
        end
        object RLDBText4: TRLDBText
          Left = 653
          Top = 4
          Width = 30
          Height = 16
          DataField = 'valor'
          DataSource = dtsCadProdutos
          Text = ''
        end
      end
      object RLBand6: TRLBand
        Left = 0
        Top = 82
        Width = 718
        Height = 87
        BandType = btSummary
        object RLDraw3: TRLDraw
          Left = 489
          Top = 0
          Width = 229
          Height = 11
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = False
          Borders.DrawBottom = False
          DrawKind = dkLine
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
        end
        object RLDBResult1: TRLDBResult
          Left = 609
          Top = 17
          Width = 106
          Height = 16
          Alignment = taRightJustify
          DataField = 'quantidade'
          DataSource = dtsCadProdutos
          Info = riSum
          Text = ''
        end
        object RLLabel10: TRLLabel
          Left = 310
          Top = 17
          Width = 293
          Height = 16
          Caption = 'QUANTIDADE EM ESTOQUE POR CATEGORIA:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object RLDBResult2: TRLDBResult
          Left = 627
          Top = 39
          Width = 88
          Height = 16
          Alignment = taRightJustify
          DataField = 'valor'
          DataSource = dtsCadProdutos
          Info = riAverage
          Text = ''
        end
        object RLLabel11: TRLLabel
          Left = 372
          Top = 39
          Width = 231
          Height = 16
          Caption = 'MEDIA DE VALOR POR CATEGORIA:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
      end
    end
  end
  object dtsCadProdutos: TDataSource
    DataSet = FDQCadProdutos
    Left = 568
    Top = 344
  end
  object RLPDFFilter1: TRLPDFFilter
    DocumentInfo.Creator = 
      'FortesReport Community Edition v4.0 \251 Copyright '#169' 1999-2016 F' +
      'ortes Inform'#225'tica'
    DisplayName = 'Documento PDF'
    Left = 508
    Top = 408
  end
  object FDQCadProdutos: TFDQuery
    Active = True
    Connection = dtmPrincipal.dtmPrincipalDB
    SQL.Strings = (
      'SELECT PRODUTOS.produtoId,'
      '       PRODUTOS.nome,'
      '       PRODUTOS.descricao,'
      
        '       CAST(PRODUTOS.valor AS FLOAT) AS valor,        -- '#8592' CAST ' +
        'para Float'
      
        '       CAST(PRODUTOS.quantidade AS FLOAT) AS quantidade, -- '#8592' CA' +
        'ST para Float'
      '       PRODUTOS.categoriaId,'
      '       CATEGORIAS.descricao AS DescricaoCategoria'
      'FROM PRODUTOS'
      
        'LEFT JOIN CATEGORIAS ON CATEGORIAS.categoriaId = PRODUTOS.catego' +
        'riaId'
      'ORDER BY PRODUTOS.categoriaId, PRODUTOS.produtoId')
    Left = 488
    Top = 336
    object FDQCadProdutosprodutoId: TFDAutoIncField
      FieldName = 'produtoId'
      Origin = 'produtoId'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDQCadProdutosnome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 60
    end
    object FDQCadProdutosdescricao: TStringField
      FieldName = 'descricao'
      Origin = 'descricao'
      Size = 255
    end
    object FDQCadProdutosvalor: TFloatField
      FieldName = 'valor'
      Origin = 'valor'
      ReadOnly = True
    end
    object FDQCadProdutosquantidade: TFloatField
      FieldName = 'quantidade'
      Origin = 'quantidade'
      ReadOnly = True
    end
    object FDQCadProdutoscategoriaId: TIntegerField
      FieldName = 'categoriaId'
      Origin = 'categoriaId'
    end
    object FDQCadProdutosDescricaoCategoria: TStringField
      FieldName = 'DescricaoCategoria'
      Origin = 'DescricaoCategoria'
      Size = 30
    end
  end
end
