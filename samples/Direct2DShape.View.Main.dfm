object frmSample: TfrmSample
  Left = 0
  Top = 0
  Caption = 'Sample'
  ClientHeight = 554
  ClientWidth = 591
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object pnlShape: TPanel
    Left = 0
    Top = 0
    Width = 297
    Height = 464
    Align = alLeft
    TabOrder = 0
    ExplicitHeight = 439
    object lbTShape: TLabel
      Left = 1
      Top = 1
      Width = 295
      Height = 15
      Align = alTop
      Alignment = taCenter
      Caption = 'TShape'
      Color = clGrayText
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = False
      StyleElements = [seClient, seBorder]
      ExplicitWidth = 41
    end
    object shapeAvg: TShape
      Left = 65
      Top = 193
      Width = 168
      Height = 153
    end
    object shapeBig: TShape
      Left = 1
      Top = 16
      Width = 295
      Height = 171
      Align = alTop
      ExplicitLeft = -3
    end
    object shapeSmall1: TShape
      Left = 43
      Top = 369
      Width = 48
      Height = 48
    end
    object shapeSmall2: TShape
      Left = 105
      Top = 376
      Width = 40
      Height = 41
    end
    object shapeSmall3: TShape
      Left = 161
      Top = 392
      Width = 24
      Height = 25
    end
    object shapeSmall4: TShape
      Left = 201
      Top = 400
      Width = 16
      Height = 17
    end
  end
  object pnlD2DShape: TPanel
    Left = 297
    Top = 0
    Width = 294
    Height = 464
    Align = alClient
    TabOrder = 1
    ExplicitHeight = 439
    object lbD2DShape: TLabel
      Left = 1
      Top = 1
      Width = 292
      Height = 15
      Align = alTop
      Alignment = taCenter
      Caption = 'TDirect2DShape'
      Color = clGrayText
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = False
      StyleElements = [seClient, seBorder]
      ExplicitWidth = 92
    end
    object D2DshapeSmall4: TDirect2DShape
      Left = 209
      Top = 408
      Width = 16
      Height = 17
    end
    object D2DshapeBig: TDirect2DShape
      Left = 1
      Top = 16
      Width = 292
      Height = 171
      Align = alTop
      ExplicitLeft = 2
      ExplicitTop = 24
      ExplicitWidth = 296
    end
    object D2DshapeAvg: TDirect2DShape
      Left = 73
      Top = 201
      Width = 168
      Height = 153
    end
    object D2DshapeSmall3: TDirect2DShape
      Left = 169
      Top = 400
      Width = 24
      Height = 25
    end
    object D2DshapeSmall2: TDirect2DShape
      Left = 113
      Top = 384
      Width = 40
      Height = 41
    end
    object D2DshapeSmall1: TDirect2DShape
      Left = 51
      Top = 377
      Width = 48
      Height = 48
    end
  end
  object pnlOptions: TPanel
    Left = 0
    Top = 464
    Width = 591
    Height = 90
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object gbShapeType: TGroupBox
      Left = 4
      Top = 0
      Width = 181
      Height = 81
      Caption = 'Shape type'
      TabOrder = 0
      object cbShapeType: TComboBox
        Left = 11
        Top = 35
        Width = 153
        Height = 22
        Style = csOwnerDrawFixed
        TabOrder = 0
        OnChange = cbShapeTypeChange
      end
    end
    object GroupBox1: TGroupBox
      Left = 191
      Top = 0
      Width = 170
      Height = 81
      Caption = 'Brush'
      TabOrder = 1
      object lbD2DInfo: TLabel
        Left = 134
        Top = 18
        Width = 7
        Height = 21
        Cursor = crHandPoint
        Caption = '?'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        OnClick = lbD2DInfoClick
      end
      object cbBrushStyle: TComboBox
        Left = 9
        Top = 19
        Width = 119
        Height = 22
        Style = csOwnerDrawFixed
        TabOrder = 0
        OnChange = cbBrushStyleChange
      end
      object colorBrush: TColorBox
        Left = 10
        Top = 50
        Width = 100
        Height = 22
        NoneColorColor = clWhite
        Selected = clWhite
        TabOrder = 1
        OnChange = colorBrushChange
      end
    end
    object gbPen: TGroupBox
      Left = 367
      Top = 0
      Width = 218
      Height = 81
      Caption = 'Pen'
      TabOrder = 2
      object colorPen: TColorBox
        Left = 13
        Top = 19
        Width = 100
        Height = 22
        TabOrder = 0
        OnChange = colorPenChange
      end
      object edtPenWidth: TSpinEdit
        Left = 131
        Top = 18
        Width = 62
        Height = 24
        MaxValue = 0
        MinValue = 0
        TabOrder = 1
        Value = 1
        OnChange = edtPenWidthChange
      end
      object cbPenStyle: TComboBox
        Left = 13
        Top = 48
        Width = 119
        Height = 22
        Style = csOwnerDrawFixed
        TabOrder = 2
        OnChange = cbPenStyleChange
      end
    end
  end
end
