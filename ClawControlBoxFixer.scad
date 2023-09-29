

cube([15,15,2]);

translate([0,17,0])rotate([90,0,0])cube([15,17,2]);
rib();
translate([13,0,0])rib();


module rib()
{
translate([2,0,0])
rotate([0,-90,0])
linear_extrude(2)
{
polygon([[0,0],[0,17],[17,17]]);   
}
}