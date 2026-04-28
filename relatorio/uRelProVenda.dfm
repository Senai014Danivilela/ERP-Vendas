object frmrRelProVenda: TfrmrRelProVenda
  Left = 0
  Top = 0
  Caption = 'RELATORIO DE VENDA '
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
  object RLDBText3: TRLDBText
    Left = 150
    Top = 149
    Width = 57
    Height = 16
    DataField = 'produtoId'
    DataSource = dtsVendasItens
    Text = ''
  end
  object dtsVenda: TDataSource
    DataSet = FDQVenda
    Left = 600
    Top = 336
  end
  object RLPDFFilter1: TRLPDFFilter
    DocumentInfo.Creator = 
      'FortesReport Community Edition v4.0 \251 Copyright '#169' 1999-2016 F' +
      'ortes Inform'#225'tica'
    DisplayName = 'Documento PDF'
    Left = 420
    Top = 376
  end
  object FDQVenda: TFDQuery
    Active = True
    Connection = dtmPrincipal.dtmPrincipalDB
    SQL.Strings = (
      'select vendas.vendaId,'
      'vendas.ClienteId,'
      'clientes.nome,'
      'vendas.dataVenda,'
      'cast(vendas.totalVenda as numeric(18,3)) as TotalVenda'
      
        'from vendas inner join clientes on clientes.clienteId = vendas.c' +
        'lienteId'
      'where vendas.vendaId =:vendaId')
    Left = 512
    Top = 328
    ParamData = <
      item
        Name = 'VENDAID'
        DataType = ftInteger
        ParamType = ptInput
        Value = 4
      end>
    object FDQVendavendaId: TFDAutoIncField
      FieldName = 'vendaId'
      Origin = 'vendaId'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDQVendaClienteId: TIntegerField
      FieldName = 'ClienteId'
      Origin = 'ClienteId'
      Required = True
    end
    object FDQVendanome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 60
    end
    object FDQVendadataVenda: TSQLTimeStampField
      FieldName = 'dataVenda'
      Origin = 'dataVenda'
    end
    object FDQVendaTotalVenda: TBCDField
      FieldName = 'TotalVenda'
      Origin = 'TotalVenda'
      ReadOnly = True
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 3
    end
  end
  object dtsVendasItens: TDataSource
    DataSet = FDQVendasItens
    Left = 592
    Top = 376
  end
  object FDQVendasItens: TFDQuery
    Active = True
    Connection = dtmPrincipal.dtmPrincipalDB
    SQL.Strings = (
      'select vendasItens.vendaId,'
      'vendasItens.produtoId,'
      'produtos.Nome,'
      'vendasItens.quantidade,'
      'vendasItens.valorUnitario,'
      'vendasItens.totalProduto from vendasItens'
      
        'inner join produtos on produtos.produtoId = vendasItens.produtoI' +
        'd'
      'where vendasItens.vendaId =:vendaId'
      'order by vendasItens.produtoId')
    Left = 512
    Top = 376
    ParamData = <
      item
        Name = 'VENDAID'
        DataType = ftInteger
        ParamType = ptInput
        Value = 4
      end>
    object FDQVendasItensvendaId: TIntegerField
      FieldName = 'vendaId'
      Origin = 'vendaId'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQVendasItensprodutoId: TIntegerField
      FieldName = 'produtoId'
      Origin = 'produtoId'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQVendasItensnome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 60
    end
    object FDQVendasItensquantidade: TFMTBCDField
      FieldName = 'quantidade'
      Origin = 'quantidade'
      Precision = 18
      Size = 5
    end
    object FDQVendasItensvalorUnitario: TFMTBCDField
      FieldName = 'valorUnitario'
      Origin = 'valorUnitario'
      Precision = 18
      Size = 5
    end
    object FDQVendasItenstotalProduto: TFMTBCDField
      FieldName = 'totalProduto'
      Origin = 'totalProduto'
      Precision = 18
      Size = 5
    end
  end
end
