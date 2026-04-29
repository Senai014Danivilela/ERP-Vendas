inherited frmProCredito: TfrmProCredito
  Caption = 'frmProCredito'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcPrincipal: TPageControl
    inherited tabListagem: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 791
      ExplicitHeight = 308
    end
    inherited tabManutencao: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 791
      ExplicitHeight = 308
    end
  end
  inherited pnlRodape: TPanel
    inherited btnNovo: TBitBtn
      Top = 6
      Visible = False
      ExplicitTop = 6
    end
    inherited btnAlterar: TBitBtn
      Top = 6
      Visible = False
      ExplicitTop = 6
    end
    inherited btnCancelar: TBitBtn
      Top = 6
      Visible = False
      ExplicitTop = 6
    end
    inherited btnGravar: TBitBtn
      Top = 6
      Visible = False
      ExplicitTop = 6
    end
    inherited btnApagar: TBitBtn
      Visible = False
    end
    inherited btnNavigator: TDBNavigator
      Hints.Strings = ()
      Visible = False
    end
  end
  inherited FDQListagem: TFDQuery
    Active = True
    SQL.Strings = (
      'SELECT '
      '    CR.creditoId,'
      '    CR.clienteId,'
      '    C.nome,'
      '    CR.credito,'
      '    CR.tipo,'
      '    CR.data,'
      '    CR.vendaId'
      'FROM CREDITO CR'
      'INNER JOIN CLIENTES C'
      '    ON C.clienteId = CR.clienteId'
      'ORDER BY '
      '    CR.clienteId,'
      '    CR.data DESC')
    object FDQListagemcreditoId: TFDAutoIncField
      FieldName = 'creditoId'
      ReadOnly = True
    end
    object FDQListagemclienteId: TIntegerField
      FieldName = 'clienteId'
    end
    object FDQListagemnome: TStringField
      FieldName = 'nome'
      Size = 60
    end
    object FDQListagemcredito: TFMTBCDField
      FieldName = 'credito'
      Precision = 18
      Size = 5
    end
    object FDQListagemtipo: TStringField
      FieldName = 'tipo'
      Size = 10
    end
    object FDQListagemdata: TSQLTimeStampField
      FieldName = 'data'
    end
    object FDQListagemvendaId: TIntegerField
      FieldName = 'vendaId'
      Origin = 'vendaId'
    end
  end
end
