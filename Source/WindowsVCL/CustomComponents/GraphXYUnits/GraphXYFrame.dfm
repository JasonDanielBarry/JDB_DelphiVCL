object CustomGraphXY: TCustomGraphXY
  Left = 0
  Top = 0
  Width = 1766
  Height = 843
  TabOrder = 0
  OnResize = FrameResize
  object LabelTitle: TLabel
    AlignWithMargins = True
    Left = 1
    Top = 1
    Width = 1764
    Height = 15
    Margins.Left = 1
    Margins.Top = 1
    Margins.Right = 1
    Margins.Bottom = 1
    Align = alTop
    Alignment = taCenter
    Caption = 'Title'
    Layout = tlCenter
    ExplicitWidth = 23
  end
  object LabelXAxis: TLabel
    AlignWithMargins = True
    Left = 1
    Top = 827
    Width = 1764
    Height = 15
    Margins.Left = 1
    Margins.Top = 1
    Margins.Right = 1
    Margins.Bottom = 1
    Align = alBottom
    Alignment = taCenter
    Caption = 'X-Axis'
    Layout = tlCenter
    ExplicitWidth = 33
  end
  object LabelYAxis: TLabel
    AlignWithMargins = True
    Left = 1
    Top = 18
    Width = 33
    Height = 807
    Margins.Left = 1
    Margins.Top = 1
    Margins.Right = 1
    Margins.Bottom = 1
    Align = alLeft
    Alignment = taCenter
    Caption = 'Y-Axis'
    Layout = tlCenter
    ExplicitHeight = 15
  end
  object PBGraphXY: TPaintBox
    AlignWithMargins = True
    Left = 36
    Top = 18
    Width = 1477
    Height = 807
    Margins.Left = 1
    Margins.Top = 1
    Margins.Right = 1
    Margins.Bottom = 1
    Align = alClient
    ExplicitLeft = 416
    ExplicitTop = 368
    ExplicitWidth = 105
    ExplicitHeight = 105
  end
  object PageControl1: TPageControl
    AlignWithMargins = True
    Left = 1515
    Top = 18
    Width = 250
    Height = 807
    Margins.Left = 1
    Margins.Top = 1
    Margins.Right = 1
    Margins.Bottom = 1
    ActivePage = TabSheetGrid
    Align = alRight
    MultiLine = True
    TabOrder = 0
    object TabSheetGraph: TTabSheet
      Caption = 'Graph'
      object ComboBoxPlotNames: TComboBox
        AlignWithMargins = True
        Left = 5
        Top = 5
        Width = 232
        Height = 23
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Align = alTop
        Style = csDropDownList
        TabOrder = 0
        OnChange = ComboBoxPlotNamesChange
      end
      object CheckBoxShowSelectedPlot: TCheckBox
        AlignWithMargins = True
        Left = 5
        Top = 38
        Width = 232
        Height = 17
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Align = alTop
        Caption = 'Show Graph'
        TabOrder = 1
        OnClick = CheckBoxShowSelectedPlotClick
      end
    end
    object TabSheetGrid: TTabSheet
      Caption = 'Grid'
      ImageIndex = 1
      object GroupBoxGridElementVisibility: TGroupBox
        Left = 0
        Top = 0
        Width = 242
        Height = 225
        Align = alTop
        Caption = 'Grid Element Visibility'
        TabOrder = 0
        object GridPanelGridElementVisibility: TGridPanel
          Left = 2
          Top = 17
          Width = 238
          Height = 206
          Align = alClient
          BevelOuter = bvNone
          ColumnCollection = <
            item
              Value = 100.000000000000000000
            end>
          ControlCollection = <
            item
              Column = 0
              Control = LabelAxesVisibility
              Row = 0
            end
            item
              Column = 0
              Control = CheckBoxXAxis
              Row = 1
            end
            item
              Column = 0
              Control = CheckBoxYAxis
              Row = 2
            end
            item
              Column = 0
              Control = LabelAxisValuesVisibility
              Row = 3
            end
            item
              Column = 0
              Control = CheckBoxXAxisValues
              Row = 4
            end
            item
              Column = 0
              Control = CheckBoxYAxisValues
              Row = 5
            end
            item
              Column = 0
              Control = LabelGridLineVisibility
              Row = 6
            end
            item
              Column = 0
              Control = CheckBoxMajorLines
              Row = 7
            end
            item
              Column = 0
              Control = CheckBoxMinorLines
              Row = 8
            end>
          ParentColor = True
          RowCollection = <
            item
              Value = 11.111111111111110000
            end
            item
              Value = 11.111111111111110000
            end
            item
              Value = 11.111111111111110000
            end
            item
              Value = 11.111111111111110000
            end
            item
              Value = 11.111111111111110000
            end
            item
              Value = 11.111111111111110000
            end
            item
              Value = 11.111111111111110000
            end
            item
              Value = 11.111111111111110000
            end
            item
              Value = 11.111111111111100000
            end>
          TabOrder = 0
          ExplicitTop = 34
          ExplicitHeight = 189
          object LabelAxesVisibility: TLabel
            AlignWithMargins = True
            Left = 5
            Top = 1
            Width = 232
            Height = 21
            Margins.Left = 5
            Margins.Top = 1
            Margins.Right = 1
            Margins.Bottom = 1
            Align = alClient
            Caption = 'Axes'
            Layout = tlCenter
            ExplicitWidth = 24
            ExplicitHeight = 15
          end
          object CheckBoxXAxis: TCheckBox
            AlignWithMargins = True
            Left = 20
            Top = 24
            Width = 217
            Height = 21
            Margins.Left = 20
            Margins.Top = 1
            Margins.Right = 1
            Margins.Bottom = 1
            Align = alClient
            Caption = 'X-Axis'
            Checked = True
            State = cbChecked
            TabOrder = 0
            OnClick = CheckBoxGridVisibilityClick
            ExplicitTop = 22
            ExplicitHeight = 19
          end
          object CheckBoxYAxis: TCheckBox
            AlignWithMargins = True
            Left = 20
            Top = 47
            Width = 217
            Height = 21
            Margins.Left = 20
            Margins.Top = 1
            Margins.Right = 1
            Margins.Bottom = 1
            Align = alClient
            Caption = 'Y-Axis'
            Checked = True
            State = cbChecked
            TabOrder = 1
            OnClick = CheckBoxGridVisibilityClick
            ExplicitTop = 43
            ExplicitHeight = 19
          end
          object LabelAxisValuesVisibility: TLabel
            AlignWithMargins = True
            Left = 5
            Top = 70
            Width = 232
            Height = 21
            Margins.Left = 5
            Margins.Top = 1
            Margins.Right = 1
            Margins.Bottom = 1
            Align = alClient
            Caption = 'Axis Values'
            Layout = tlCenter
            ExplicitTop = 64
            ExplicitWidth = 57
            ExplicitHeight = 15
          end
          object CheckBoxXAxisValues: TCheckBox
            AlignWithMargins = True
            Left = 20
            Top = 93
            Width = 217
            Height = 20
            Margins.Left = 20
            Margins.Top = 1
            Margins.Right = 1
            Margins.Bottom = 1
            Align = alClient
            Caption = 'X-Axis'
            Checked = True
            State = cbChecked
            TabOrder = 2
            OnClick = CheckBoxGridVisibilityClick
            ExplicitTop = 85
            ExplicitHeight = 19
          end
          object CheckBoxYAxisValues: TCheckBox
            AlignWithMargins = True
            Left = 20
            Top = 115
            Width = 217
            Height = 21
            Margins.Left = 20
            Margins.Top = 1
            Margins.Right = 1
            Margins.Bottom = 1
            Align = alClient
            Caption = 'Y-Axis'
            Checked = True
            State = cbChecked
            TabOrder = 3
            OnClick = CheckBoxGridVisibilityClick
            ExplicitTop = 106
            ExplicitHeight = 19
          end
          object LabelGridLineVisibility: TLabel
            AlignWithMargins = True
            Left = 5
            Top = 138
            Width = 232
            Height = 21
            Margins.Left = 5
            Margins.Top = 1
            Margins.Right = 1
            Margins.Bottom = 1
            Align = alClient
            Caption = 'Grid Lines'
            Layout = tlCenter
            ExplicitTop = 127
            ExplicitWidth = 52
            ExplicitHeight = 15
          end
          object CheckBoxMajorLines: TCheckBox
            AlignWithMargins = True
            Left = 20
            Top = 161
            Width = 217
            Height = 21
            Margins.Left = 20
            Margins.Top = 1
            Margins.Right = 1
            Margins.Bottom = 1
            Align = alClient
            Caption = 'Major'
            Checked = True
            State = cbChecked
            TabOrder = 4
            OnClick = CheckBoxGridVisibilityClick
            ExplicitTop = 148
            ExplicitHeight = 19
          end
          object CheckBoxMinorLines: TCheckBox
            AlignWithMargins = True
            Left = 20
            Top = 184
            Width = 217
            Height = 21
            Margins.Left = 20
            Margins.Top = 1
            Margins.Right = 1
            Margins.Bottom = 1
            Align = alClient
            Caption = 'Minor'
            Checked = True
            State = cbChecked
            TabOrder = 5
            OnClick = CheckBoxGridVisibilityClick
            ExplicitTop = 169
            ExplicitHeight = 19
          end
        end
      end
    end
  end
end
