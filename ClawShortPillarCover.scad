$fn = 150;
OuterRadius = 30; //must be bigger than GlueArea
WallWidth = 2;
GlueArea = 5;
PillarHeight = 120;
CapHeight = 25;


pillar(OuterRadius, WallWidth, GlueArea, PillarHeight);
cap(PillarHeight, CapHeight, OuterRadius);



module pillar(outerRadius, width, glueLength, height)
{

difference()//diff 1
    {
    cylinder(height,  outerRadius, outerRadius,false);
            
    cylinder(height,  outerRadius-glueLength, outerRadius-glueLength,false);
        translate([-outerRadius,0,0])cube([outerRadius*2,outerRadius,height]);
        translate([0,-outerRadius,0])cube([outerRadius,outerRadius,height]);
    }//diff 1
    
    
}

module cap(startHeight, capHeight, outerRadius)
{
    
    difference()
    {
    translate([0,0,startHeight])cylinder(capHeight, outerRadius, false);
    
        translate([-outerRadius,0,startHeight])cube([outerRadius*2,outerRadius,capHeight]);
        translate([0,-outerRadius,startHeight])cube([outerRadius,outerRadius,capHeight]);
       translate([-2.2,0,startHeight])rotate([0,0,-180])cube([22,2.2,capHeight]);
    translate([-2.2,0,startHeight])rotate([0,0,-90])cube([22,2.2,capHeight]);
       //2.5 is with safety the width of the sheet metal
       //22 is with safety the size of the L shape 
    }
    
    
}