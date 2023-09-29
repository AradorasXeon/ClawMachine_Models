innerRadius = 100;
fullHeight = 101;
sheet = 2;
shapeL = 25;
widthL = 1.6;
$fn=150;



difference()//2
{

difference()//1
{
cube([innerRadius,innerRadius, fullHeight]);

cylinder(h=fullHeight, r=innerRadius, center = false);



}//difference 1

translate([innerRadius-shapeL, innerRadius-shapeL, 0])cube([shapeL,shapeL,fullHeight-sheet]);

translate([innerRadius-shapeL, innerRadius-shapeL, 0])Lshape(widthL, shapeL);

}//difference 2




module Lshape(width, length)
{
    translate([0,length-width,0])cube([length,width,fullHeight+1]);
    
    translate([length-width,0,0])cube([width,length,fullHeight+1]);
}