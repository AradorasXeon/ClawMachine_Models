// Power Suppy holder

baseWidth = 15;
baseHeight = 3.5;
wallThickness = 2;
wallWidth = 6;
maxHeight = 25;

negativeBase = 8;






difference()
{
    base(baseWidth,baseHeight,wallThickness,maxHeight,wallWidth);
    translate([baseWidth-negativeBase,baseWidth-negativeBase,0])cube([negativeBase,negativeBase,baseHeight]);
}

module base(baseWidth,baseHeight,wallThickness, maxHeight, wallWidth)
{
cube([baseWidth,baseWidth,baseHeight]);
cube([wallWidth+wallThickness,wallThickness,maxHeight]);
cube([wallThickness,wallWidth+wallThickness,maxHeight]);
}
