$fn = 50;
sheetHeight = 2;

Sum(sheetHeight);
/*
minkowski()
{
Sum(sheetHeight);
cylinder(r=1);
}
*/

module Sum(h)
{

Vprofile(20);
translate([0,4,0])mirror([0,1,0])rotate([90,0,0])SwitchHolder(h);

}


module Vprofile(extrude)
{
    linear_extrude(extrude) polygon([[0,0],[5,0],[3/2+5,2],[-3/2,2]]);
    translate([0,2,0])cube([5,2,extrude]);
}







module SwitchHolder(h)
{
pillarHeight = 6;
cube([10,20,h]);

{
translate([5,4+2.5/2,h])cylinder(pillarHeight, d = 2.5);
translate([5,4+3*2.5/2+7,h])cylinder(pillarHeight, d = 2.5);
}
}