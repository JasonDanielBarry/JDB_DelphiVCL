unit GraphXYComponent;

interface

    uses
        System.SysUtils, System.Classes, System.UITypes,
        Vcl.Graphics,
        Vcl.Controls,

        GeometryTypes,
        CustomComponentPanelClass,
        GraphXYTypes,
        GraphXYFrame;

    type
        TJDBGraphXY = class(TCustomComponentPanel)
            private
                customGraphXY : TCustomGraphXY;
            public
                constructor Create(AOwner: TComponent); override;
                destructor Destroy(); override;
                //update plots event
                    function getOnUpdateGraphPlotsEvent() : TUpdateGraphPlotsEvent;
                    procedure setOnUpdateGraphPlotsEvent(const OnUpdateGraphPlotsEventIn : TUpdateGraphPlotsEvent);
                    procedure updateGraphPlots();
                //replot graphs
                    procedure replot();
            published
                property OnUpdateGraphPlots : TUpdateGraphPlotsEvent read getOnUpdateGraphPlotsEvent write setOnUpdateGraphPlotsEvent;
        end;

implementation

    //public
        constructor TJDBGraphXY.Create(AOwner: TComponent);
            begin
                inherited create( AOwner );

                customGraphXY := TCustomGraphXY.create(Self);
                customGraphXY.parent    := self;
                customGraphXY.Align     := TAlign.alClient;
                customGraphXY.Visible   := True;
            end;

        destructor TJDBGraphXY.Destroy();
            begin
                FreeAndNil( customGraphXY );

                inherited Destroy();
            end;

        //update plots event
            function TJDBGraphXY.getOnUpdateGraphPlotsEvent() : TUpdateGraphPlotsEvent;
                begin
                    result := customGraphXY.getOnUpdateGraphPlotsEvent();
                end;

            procedure TJDBGraphXY.setOnUpdateGraphPlotsEvent(const OnUpdateGraphPlotsEventIn : TUpdateGraphPlotsEvent);
                begin
                    customGraphXY.setOnUpdateGraphPlotsEvent( OnUpdateGraphPlotsEventIn );
                end;

            procedure TJDBGraphXY.updateGraphPlots();
                begin
                    customGraphXY.updateGraphPlots();
                end;

        //replot graphs
            procedure TJDBGraphXY.replot();
                begin
                    customGraphXY.replot();
                end;

end.
