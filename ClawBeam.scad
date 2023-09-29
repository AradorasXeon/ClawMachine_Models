$fn = 50;
axisDistance = 25;
thickness = 2.4;
holeDiameter = 2;


width = 2*0.8+ holeDiameter;

difference()
{
union()
{
    cylinder(h = thickness, d = width);
    
    translate([axisDistance,0,0])cylinder(h = thickness, d = width);
    
    translate([0,-width/2,0])cube([axisDistance,width,thickness]);
    
}// union

cylinder(h = thickness, d = holeDiameter);

translate([axisDistance,0,0])cylinder(h = thickness, d = holeDiameter);



}//difference