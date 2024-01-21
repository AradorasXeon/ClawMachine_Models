$fn=150;

difference()
{
union()
{
cube([20,20,3]);
cube([20,3,10]);
cube([3,20,10]);
}
translate([10,10,0])cylinder(h=3, d=2);

}