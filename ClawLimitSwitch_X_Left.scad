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
translate([-38,0,0])cube([38,10,h]);
translate([-12,5,-3])cylinder(3, d=4.5);
translate([-32,5,-3])cylinder(3, d=4.5);
}





module SwitchHolder(h)
{
pillarHeight = 6;
cube([10,20,h]);

mirror([0,0,1]){
translate([5,4+2.5/2,0])cylinder(pillarHeight, d = 2.5);
translate([5,4+3*2.5/2+7,0])cylinder(pillarHeight, d = 2.5);
}
}