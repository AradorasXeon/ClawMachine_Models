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
SwitchHolder(h);
Additional(h);
}



module Additional(h)
{
translate([10,0,-3])cube([6,20,5]);
translate([16,0,0])cube([33,15,h]);
translate([33+16,0,-3])cube([6,20,5]);
}





module SwitchHolder(h)
{
pillarHeight = 6;
cube([10,20,h]);
translate([5,4+2.5/2,h])cylinder(pillarHeight, d = 2.5);
translate([5,4+3*2.5/2+7,h])cylinder(pillarHeight, d = 2.5);
}