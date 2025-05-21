unit Graphic2DListClass;

interface

    uses
        //Delphi
            system.SysUtils, system.types, system.UIConsts, system.UITypes, system.Generics.Collections, System.Classes,
            vcl.Graphics, vcl.StdCtrls,
        //custom
            GeometryTypes,
            GeomLineClass, GeomPolyLineClass, GeomPolygonClass,
            DrawingAxisConversionClass,
            GraphicDrawingTypes,
            GraphicObjectBaseClass,
            GraphicArcClass, GraphicEllipseClass, GraphicGeometryClass,
            GraphicLineClass, GraphicPolylineClass, GraphicPolygonClass,
            GraphicRectangleClass, GraphicTextClass, GraphicArrowClass,
            GraphicArrowGroupClass,
            GraphicObjectListBaseClass
            ;

    type
        TGraphic2DList = class(TGraphicObjectListBase)
            public
                //add different drawing graphic objects
                    //arc
                        procedure addArc(   const   arcCentreXIn, arcCentreYIn,
                                                    arcXRadiusIn, arcYRadiusIn,
                                                    startAngleIn, endAngleIn    : double;
                                            const   filledIn                    : boolean = False;
                                            const   lineThicknessIn             : integer = 2;
                                            const   fillColourIn                : TColor = TColors.Null;
                                            const   lineColourIn                : TColor = TColors.Black;
                                            const   lineStyleIn                 : TPenStyle = TPenStyle.psSolid );
                    //ellipse
                        procedure addEllipse(   const   diameterXIn,  diameterYIn,
                                                        centreXIn,    centreYIn     : double;
                                                const   filledIn                    : boolean = True;
                                                const   lineThicknessIn             : integer = 2;
                                                const   fillColourIn                : TColor = TColors.Null;
                                                const   lineColourIn                : TColor = TColors.Black;
                                                const   lineStyleIn                 : TPenStyle = TPenStyle.psSolid );
                    //geometry
                        //line
                            procedure addLine(  const lineIn            : TGeomLine;
                                                const lineThicknessIn   : integer = 2;
                                                const colourIn          : TColor = TColors.Black;
                                                const styleIn           : TPenStyle = TPenStyle.psSolid );
                        //polyline
                            procedure addPolyline(  const polylineIn        : TGeomPolyLine;
                                                    const lineThicknessIn   : integer = 2;
                                                    const colourIn          : TColor = TColors.Black;
                                                    const styleIn           : TPenStyle = TPenStyle.psSolid );
                        //polygon
                            procedure addPolygon(   const polygonIn         : TGeomPolygon;
                                                    const filledIn          : boolean = True;
                                                    const lineThicknessIn   : integer = 2;
                                                    const fillColourIn      : TColor = TColors.Null;
                                                    const lineColourIn      : TColor = TColors.Black;
                                                    const lineStyleIn       : TPenStyle = TPenStyle.psSolid     );
                    //rectanlge
                        procedure addRectangle( const   widthIn, heightIn,
                                                        leftIn, bottomIn    : double;
                                                const   filledIn            : boolean = True;
                                                const   lineThicknessIn     : integer = 2;
                                                const   cornerRadiusIn      : double = 0;
                                                const   fillColourIn        : TColor = TColors.Null;
                                                const   lineColourIn        : TColor = TColors.Black;
                                                const   lineStyleIn         : TPenStyle = TPenStyle.psSolid );
                    //text
                        procedure addText(  const   textXIn, textYIn    : double;
                                            const   textStringIn        : string;
                                            const   addTextUnderlayIn   : boolean = False;
                                            const   textSizeIn          : integer = 9;
                                            const   textRotationAngleIn : double = 0;
                                            const   textHorAlignmentIn  : TAlignment = TAlignment.taLeftJustify;
                                            const   textVertAlignmentIn : TVerticalAlignment = TVerticalAlignment.taAlignTop;
                                            const   textColourIn        : TColor = TColors.SysWindowText;
                                            const   textFontStylesIn    : TFontStyles = []                                      );
                    //groups
                        //arrow
                            procedure addArrow( const   arrowLengthIn,
                                                        directionAngleIn    : double;
                                                const   arrowOriginPointIn  : TGeomPoint;
                                                const   arrowOriginIn       : EArrowOrigin = EArrowOrigin.aoTail;
                                                const   filledIn            : boolean = True;
                                                const   lineThicknessIn     : integer = 3;
                                                const   fillColourIn        : TColor = TColors.Null;
                                                const   lineColourIn        : TColor = TColors.Black;
                                                const   lineStyleIn         : TPenStyle = TPenStyle.psSolid         );
                        //arrow group
                            //single line
                                procedure addArrowGroup(const   arrowLengthIn           : double;
                                                        const   arrowGroupLineIn        : TGeomLine;
                                                        const   arrowOriginIn           : EArrowOrigin = EArrowOrigin.aoTail;
                                                        const   arrowGroupDirectionIn   : EArrowGroupDirection = EArrowGroupDirection.agdNormal;
                                                        const   userDirectionAngleIn    : double = 0;
                                                        const   filledIn                : boolean = True;
                                                        const   lineThicknessIn         : integer = 3;
                                                        const   fillColourIn            : TColor = TColors.Null;
                                                        const   lineColourIn            : TColor = TColors.Black;
                                                        const   lineStyleIn             : TPenStyle = TPenStyle.psSolid                         ); overload;
                            //polyline
                                procedure addArrowGroup(const   arrowLengthIn           : double;
                                                        const   arrowGroupPolylineIn    : TGeomPolyLine;
                                                        const   arrowOriginIn           : EArrowOrigin = EArrowOrigin.aoTail;
                                                        const   arrowGroupDirectionIn   : EArrowGroupDirection = EArrowGroupDirection.agdNormal;
                                                        const   userDirectionAngleIn    : double = 0;
                                                        const   filledIn                : boolean = True;
                                                        const   lineThicknessIn         : integer = 3;
                                                        const   fillColourIn            : TColor = TColors.Null;
                                                        const   lineColourIn            : TColor = TColors.Black;
                                                        const   lineStyleIn             : TPenStyle = TPenStyle.psSolid                         ); overload;
        end;

implementation

    //public
        //add different drawing graphic objects
            //arc
                procedure TGraphic2DList.addArc(const   arcCentreXIn, arcCentreYIn,
                                                        arcXRadiusIn, arcYRadiusIn,
                                                        startAngleIn, endAngleIn    : double;
                                                const   filledIn                    : boolean = False;
                                                const   lineThicknessIn             : integer = 2;
                                                const   fillColourIn                : TColor = TColors.Null;
                                                const   lineColourIn                : TColor = TColors.Black;
                                                const   lineStyleIn                 : TPenStyle = TPenStyle.psSolid );
                    var
                        centrePoint     : TGeomPoint;
                        newGraphicArc   : TGraphicArc;
                    begin
                        //check if the arc angles are a valid combination
                            if NOT( TGraphicArc.validArcAngles( startAngleIn, endAngleIn ) ) then
                                exit();

                        centrePoint := TGeomPoint.create( arcCentreXIn, arcCentreYIn );

                        newGraphicArc := TGraphicArc.create(    filledIn,
                                                                lineThicknessIn,
                                                                arcXRadiusIn, arcYRadiusIn,
                                                                startAngleIn, endAngleIn,
                                                                fillColourIn, lineColourIn,
                                                                lineStyleIn,
                                                                centrePoint                 );

                        addGraphicObject( newGraphicArc );
                    end;

            //ellipse
                procedure TGraphic2DList.addEllipse(const   diameterXIn,  diameterYIn,
                                                            centreXIn,    centreYIn     : double;
                                                    const   filledIn                    : boolean = True;
                                                    const   lineThicknessIn             : integer = 2;
                                                    const   fillColourIn                : TColor = TColors.Null;
                                                    const   lineColourIn                : TColor = TColors.Black;
                                                    const   lineStyleIn                 : TPenStyle = TPenStyle.psSolid );
                    var
                        centrePoint         : TGeomPoint;
                        newGraphicEllipse   : TGraphicEllipse;
                    begin
                        centrePoint := TGeomPoint.create( centreXIn, centreYIn );

                        newGraphicEllipse := TGraphicEllipse.create(    filledIn,
                                                                        lineThicknessIn,
                                                                        diameterXIn, diameterYIn,
                                                                        fillColourIn,
                                                                        lineColourIn,
                                                                        lineStyleIn,
                                                                        centrePoint                 );

                        addGraphicObject( newGraphicEllipse );
                    end;

            //geometry
                //line
                    procedure TGraphic2DList.addLine(   const lineIn            : TGeomLine;
                                                        const lineThicknessIn   : integer = 2;
                                                        const colourIn          : TColor = TColors.Black;
                                                        const styleIn           : TPenStyle = TPenStyle.psSolid );
                        var
                            newGraphicGeometry : TGraphicGeometry;
                        begin
                            newGraphicGeometry := TGraphicLine.create(  lineThicknessIn,
                                                                        colourIn,
                                                                        styleIn,
                                                                        lineIn          );

                            addGraphicObject( newGraphicGeometry );
                        end;

                //polyline
                    procedure TGraphic2DList.addPolyline(   const polylineIn        : TGeomPolyLine;
                                                            const lineThicknessIn   : integer = 2;
                                                            const colourIn          : TColor = TColors.Black;
                                                            const styleIn           : TPenStyle = TPenStyle.psSolid );
                        var
                            newGraphicGeometry : TGraphicGeometry;
                        begin
                            newGraphicGeometry := TGraphicPolyline.create(  lineThicknessIn,
                                                                            colourIn,
                                                                            styleIn,
                                                                            polylineIn      );

                            addGraphicObject( newGraphicGeometry );
                        end;

                //polygon
                    procedure TGraphic2DList.addPolygon(const polygonIn         : TGeomPolygon;
                                                        const filledIn          : boolean = True;
                                                        const lineThicknessIn   : integer = 2;
                                                        const fillColourIn      : TColor = TColors.Null;
                                                        const lineColourIn      : TColor = TColors.Black;
                                                        const lineStyleIn       : TPenStyle = TPenStyle.psSolid );
                        var
                            newGraphicGeometry : TGraphicGeometry;
                        begin
                            newGraphicGeometry := TGraphicPolygon.create(   filledIn,
                                                                            lineThicknessIn,
                                                                            fillColourIn,
                                                                            lineColourIn,
                                                                            lineStyleIn,
                                                                            polygonIn       );

                            addGraphicObject( newGraphicGeometry );
                        end;

            //rectanlge
                procedure TGraphic2DList.addRectangle(  const   widthIn, heightIn,
                                                                leftIn, bottomIn    : double;
                                                        const   filledIn            : boolean = True;
                                                        const   lineThicknessIn     : integer = 2;
                                                        const   cornerRadiusIn      : double = 0;
                                                        const   fillColourIn        : TColor = TColors.Null;
                                                        const   lineColourIn        : TColor = TColors.Black;
                                                        const   lineStyleIn         : TPenStyle = TPenStyle.psSolid );
                    var
                        newGraphicRectangle : TGraphicRectangle;
                        bottomLeftPoint     : TGeomPoint;
                    begin
                        bottomLeftPoint := TGeomPoint.create( leftIn, bottomIn );

                        newGraphicRectangle := TGraphicRectangle.create(    filledIn,
                                                                            lineThicknessIn,
                                                                            cornerRadiusIn,
                                                                            widthIn, heightIn,
                                                                            fillColourIn,
                                                                            lineColourIn,
                                                                            lineStyleIn,
                                                                            bottomLeftPoint     );

                        addGraphicObject( newGraphicRectangle );
                    end;

            //text
                procedure TGraphic2DList.addText(   const   textXIn, textYIn    : double;
                                                    const   textStringIn        : string;
                                                    const   addTextUnderlayIn   : boolean = False;
                                                    const   textSizeIn          : integer = 9;
                                                    const   textRotationAngleIn : double = 0;
                                                    const   textHorAlignmentIn  : TAlignment = TAlignment.taLeftJustify;
                                            const   textVertAlignmentIn : TVerticalAlignment = TVerticalAlignment.taAlignTop;
                                                    const   textColourIn        : TColor = TColors.SysWindowText;
                                                    const   textFontStylesIn    : TFontStyles = []                              );
                    var
                        textTopLeftPoint    : TGeomPoint;
                        newGraphicText      : TGraphicText;
                    begin
                        if ( trim(textStringIn) = '' ) then
                            exit();

                        textTopLeftPoint := TGeomPoint.create( textXIn, textYIn );

                        newGraphicText := TGraphicText.create(  addTextUnderlayIn,
                                                                textSizeIn,
                                                                textRotationAngleIn,
                                                                trim( textStringIn ),
                                                                textHorAlignmentIn,
                                                                textVertAlignmentIn,
                                                                textColourIn,
                                                                textFontStylesIn,
                                                                textTopLeftPoint    );

                        addGraphicObject( newGraphicText );
                    end;

            //groups
                //arrow
                    procedure TGraphic2DList.addArrow(  const   arrowLengthIn,
                                                                directionAngleIn    : double;
                                                        const   arrowOriginPointIn  : TGeomPoint;
                                                        const   arrowOriginIn       : EArrowOrigin = EArrowOrigin.aoTail;
                                                        const   filledIn            : boolean = True;
                                                        const   lineThicknessIn     : integer = 3;
                                                        const   fillColourIn        : TColor = TColors.Null;
                                                        const   lineColourIn        : TColor = TColors.Black;
                                                        const   lineStyleIn         : TPenStyle = TPenStyle.psSolid         );
                        var
                            newGraphicArrow : TGraphicArrow;
                        begin
                            newGraphicArrow := TGraphicArrow.create(    filledIn,
                                                                        lineThicknessIn,
                                                                        arrowLengthIn,
                                                                        directionAngleIn,
                                                                        fillColourIn,
                                                                        lineColourIn,
                                                                        lineStyleIn,
                                                                        arrowOriginIn,
                                                                        arrowOriginPointIn  );

                            addGraphicObject( newGraphicArrow );
                        end;

                //arrow group
                    procedure TGraphic2DList.addArrowGroup( const   arrowLengthIn           : double;
                                                            const   arrowGroupLineIn        : TGeomLine;
                                                            const   arrowOriginIn           : EArrowOrigin = EArrowOrigin.aoTail;
                                                            const   arrowGroupDirectionIn   : EArrowGroupDirection = EArrowGroupDirection.agdNormal;
                                                            const   userDirectionAngleIn    : double = 0;
                                                            const   filledIn                : boolean = True;
                                                            const   lineThicknessIn         : integer = 3;
                                                            const   fillColourIn            : TColor = TColors.Null;
                                                            const   lineColourIn            : TColor = TColors.Black;
                                                            const   lineStyleIn             : TPenStyle = TPenStyle.psSolid                             );
                        var
                            newGraphicArrowGroup : TGraphicArrowGroup;
                        begin
                            newGraphicArrowGroup := TGraphicArrowGroup.create(  filledIn,
                                                                                lineThicknessIn,
                                                                                arrowLengthIn,
                                                                                userDirectionAngleIn,
                                                                                fillColourIn,
                                                                                lineColourIn,
                                                                                lineStyleIn,
                                                                                arrowOriginIn,
                                                                                arrowGroupDirectionIn,
                                                                                arrowGroupLineIn        );

                            addGraphicObject( newGraphicArrowGroup );
                        end;

                    procedure TGraphic2DList.addArrowGroup( const   arrowLengthIn           : double;
                                                            const   arrowGroupPolylineIn    : TGeomPolyLine;
                                                            const   arrowOriginIn           : EArrowOrigin = EArrowOrigin.aoTail;
                                                            const   arrowGroupDirectionIn   : EArrowGroupDirection = EArrowGroupDirection.agdNormal;
                                                            const   userDirectionAngleIn    : double = 0;
                                                            const   filledIn                : boolean = True;
                                                            const   lineThicknessIn         : integer = 3;
                                                            const   fillColourIn            : TColor = TColors.Null;
                                                            const   lineColourIn            : TColor = TColors.Black;
                                                            const   lineStyleIn             : TPenStyle = TPenStyle.psSolid                         );
                        var
                            newGraphicArrowGroup : TGraphicArrowGroup;
                        begin
                            newGraphicArrowGroup := TGraphicArrowGroup.create(  filledIn,
                                                                                lineThicknessIn,
                                                                                arrowLengthIn,
                                                                                userDirectionAngleIn,
                                                                                fillColourIn,
                                                                                lineColourIn,
                                                                                lineStyleIn,
                                                                                arrowOriginIn,
                                                                                arrowGroupDirectionIn,
                                                                                arrowGroupPolylineIn    );

                            addGraphicObject( newGraphicArrowGroup );
                        end;

end.
