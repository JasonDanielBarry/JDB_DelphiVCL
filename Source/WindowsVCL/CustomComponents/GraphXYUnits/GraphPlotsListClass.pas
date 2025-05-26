unit GraphPlotsListClass;

interface

    uses
        System.SysUtils,
        GraphicLinePlotClass,
        GraphicScatterPlotClass,
        GraphicMousePointTrackerClass,
        GraphXYTypes,
        GraphicObjectListBaseClass;

    type
        TGraphPlotsList = class(TGraphicObjectListBase)
            private
                procedure addLinePlot(const graphPlotIn : TGraphPlotData);
                procedure addScatterPlot(const graphPlotIn : TGraphPlotData);
                procedure addFunction(const graphPlotIn : TGraphPlotData);
                procedure addClassFunction(const graphPlotIn : TGraphPlotData);
            public
                procedure addGraphPlot(const graphPlotIn : TGraphPlotData);
                procedure addMousePointTracker(const mousePointTrackerIn : TGraphicMousePointTracker);
        end;

implementation

    //private
        procedure TGraphPlotsList.addLinePlot(const graphPlotIn : TGraphPlotData);
            var
                showPlotPoints  : boolean;
                graphicLinePlot : TGraphicLinePlot;
            begin
                showPlotPoints := graphPlotIn.graphPlotType = EGraphPlotType.gpMarkerLinePlot;

                graphicLinePlot := TGraphicLinePlot.create( showPlotPoints,
                                                            graphPlotIn.plottingSize,
                                                            graphPlotIn.plotColour,
                                                            graphPlotIn.lineStyle,
                                                            graphPlotIn.arrDataPoints   );

                addGraphicObject( graphicLinePlot );
            end;

        procedure TGraphPlotsList.addScatterPlot(const graphPlotIn : TGraphPlotData);
            var
                graphicScatterPlot : TGraphicScatterPlot;
            begin
                graphicScatterPlot := TGraphicScatterPlot.create(   graphPlotIn.plottingSize,
                                                                    graphPlotIn.plotColour,
                                                                    graphPlotIn.arrDataPoints   );

                addGraphicObject( graphicScatterPlot );
            end;

        procedure TGraphPlotsList.addFunction(const graphPlotIn : TGraphPlotData);
            begin

            end;

        procedure TGraphPlotsList.addClassFunction(const graphPlotIn : TGraphPlotData);
            begin

            end;

    //public
        procedure TGraphPlotsList.addGraphPlot(const graphPlotIn : TGraphPlotData);
            begin
                case ( graphPlotIn.graphPlotType ) of
                    EGraphPlotType.gpLine:
                        addLinePlot( graphPlotIn );

                    EGraphPlotType.gpScatter:
                        addScatterPlot( graphPlotIn );

                    EGraphPlotType.gpMarkerLinePlot:
                        ;asdf

                    EGraphPlotType.gpFuntion:
                        addFunction( graphPlotIn );

                    EGraphPlotType.gpClassFunction:
                        addClassFunction( graphPlotIn );
                end;
            end;

        procedure TGraphPlotsList.addMousePointTracker(const mousePointTrackerIn : TGraphicMousePointTracker);
            begin
                addGraphicObject( mousePointTrackerIn );
            end;


end.
