unit GraphXYFrame;

interface

uses
    Winapi.Windows, Winapi.Messages,
    System.SysUtils, System.Variants, System.Classes, System.Generics.Collections, System.UITypes,
    Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls,

    GeometryTypes,
    GeomBox,
    GeomPolyLineClass,
    GraphicScatterPlotClass,
    GraphicLinePlotClass,
    GraphicMousePointTrackerClass,
    GraphicGridClass,
    GraphPlotsListClass,
    GraphicDrawer2DPaintBoxClass,
    GraphXYTypes
    ;

    type
        TCustomGraphXY = class(TFrame)
            PBGraphXY: TPaintBox;
            //events
                procedure FrameResize(Sender: TObject);
            private
                var
                    gridVisibilitySettings  : TGridVisibilitySettings;
                    graphPlotsMap           : TGraphXYMap;
                    onUpdateGraphPlotsEvent : TUpdateGraphPlotsEvent;
                //set graph boundaries
                    procedure setGraphBoundaries(const xMinIn, xMaxIn, yMinIn, yMaxIn : double);
            protected
                //process windows messages
                    procedure wndProc(var messageInOut : TMessage); override;
            public
                //constructor
                    constructor create(AOwner : TComponent); override;
                //destructor
                    destructor destroy(); override;
                //update plots event
                    function getOnUpdateGraphPlotsEvent() : TUpdateGraphPlotsEvent;
                    procedure setOnUpdateGraphPlotsEvent(const OnUpdateGraphPlotsEventIn : TUpdateGraphPlotsEvent);
                    procedure updateGraphPlots();
                //replot graphs
                    procedure replot();
        end;

implementation

{$R *.dfm}

    //events
        procedure TCustomGraphXY.FrameResize(Sender: TObject);
            begin
                replot();
            end;

    //private
        //set graph boundaries
            procedure TCustomGraphXY.setGraphBoundaries(const xMinIn, xMaxIn, yMinIn, yMaxIn : double);
                var
                    newRegion : TGeomBox;
                begin
                    newRegion.setBounds( xMinIn, xMaxIn, yMinIn, yMaxIn, 0, 0 );

                    PBGraphXY.GraphicDrawer.setDrawingRegion(0, newRegion );

                    replot();
                end;

    //protected
        //process windows messages
            procedure TCustomGraphXY.wndProc(var messageInOut : TMessage);
                var
                    graphWasRedrawn : boolean;
                begin
                    if ( Assigned( PBGraphXY ) ) then
                        begin
                            //drawing messages
                                PBGraphXY.processWindowsMessages( messageInOut, graphWasRedrawn );

                            //more messages
                                //
                        end;

                    inherited wndProc( messageInOut );
                end;

    //public
        //constructor
            constructor TCustomGraphXY.create(AOwner : TComponent);
                begin
                    inherited Create( AOwner );

                    PBGraphXY.setGridEnabled( True );
                    gridVisibilitySettings.setValues( True, True, True, True );

                    graphPlotsMap := TGraphXYMap.Create();

                    PBGraphXY.GraphicDrawer.setDrawingSpaceRatioEnabled( False );
                    PBGraphXY.GraphicDrawer.setGeometryBorderPercentage( 0 );

                    PBGraphXY.setGridElementsVisiblity( gridVisibilitySettings );
                end;

        //destructor
            destructor TCustomGraphXY.destroy();
                begin
                    graphPlotsMap.clear();
                    FreeAndNil( graphPlotsMap );

                    inherited destroy();
                end;

        //update plots event
            function TCustomGraphXY.getOnUpdateGraphPlotsEvent() : TUpdateGraphPlotsEvent;
                begin
                    result := onUpdateGraphPlotsEvent;
                end;

            procedure TCustomGraphXY.setOnUpdateGraphPlotsEvent(const OnUpdateGraphPlotsEventIn : TUpdateGraphPlotsEvent);
                begin
                    onUpdateGraphPlotsEvent := OnUpdateGraphPlotsEventIn;
                end;

            procedure TCustomGraphXY.updateGraphPlots();
                var
                    continuousTracking  : boolean;
                    tempGraphPlotItem   : TPair<string, TGraphPlotData>;
                    mousePointTracker   : TGraphicMousePointTracker;
                    graphPlotsList      : TGraphPlotsList;
                begin
                    //clear map
                        graphPlotsMap.Clear();

                    //update the plots
                        if NOT( Assigned( onUpdateGraphPlotsEvent ) ) then
                            exit();

                        onUpdateGraphPlotsEvent( self, graphPlotsMap );

                    //create graphic object list
                        graphPlotsList := TGraphPlotsList.create();

                        //collect graph plots
                            for tempGraphPlotItem in graphPlotsMap do
                                graphPlotsList.addGraphPlot( tempGraphPlotItem.Value );

                        //collect mouse point tracker
                            continuousTracking := ( tempGraphPlotItem.Value.graphPlotType <> EGraphPlotType.gpScatter );

                            mousePointTracker := TGraphicMousePointTracker.create( continuousTracking, tempGraphPlotItem.Value.arrDataPoints );

                            graphPlotsList.addMousePointTracker( mousePointTracker );

                            PBGraphXY.GraphicDrawer.setRedrawOnMouseMoveActive( True );

                    //update the graphic drawers graphicsS
                        PBGraphXY.updateGraphics( self, graphPlotsList );

                    //free graphic object list memory
                        FreeAndNil( graphPlotsList );

                    //grid settings
                        PBGraphXY.setGridElementsVisiblity( gridVisibilitySettings );

                    replot();
                end;

        //replot graphs
            procedure TCustomGraphXY.replot();
                begin
                    PBGraphXY.postRedrawGraphicMessage( self );
                end;

end.
