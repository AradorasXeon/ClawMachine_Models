$fn = 150;
axisDistance = 17;
thickness = 2.4;
holeDiameterSmall = 3.2;
holeDiameterBig = 5;


width = 2*0.9 * holeDiameterBig;


clawDiaMiddle = 120;


translate([0,-clawDiaMiddle/2,0])claw(clawDiaMiddle, width, holeDiameterBig);

rotate([0,0,8.45])beam(axisDistance,holeDiameterBig, width,thickness,holeDiameterSmall);




module claw(middleDiameter, width, holeDia)
{
    clawDiaOut = middleDiameter + width;

    clawDiaIn = middleDiameter - width;
    
    difference()
    {
    cylinder(thickness, d= clawDiaOut);
        
        cylinder(thickness, d= clawDiaIn);
        
        translate([0,-clawDiaOut/2,0])cube(clawDiaOut);
        
        translate([0,middleDiameter/2,0])cylinder(thickness, d = holeDia);
        
        translate([-width,-clawDiaOut/2,0])cube(width+2);
        
    }//difference
    
    translate([-width,-middleDiameter/2+1,0])cylinder(thickness, d=width+1);
}//module claw




module beam(axisDistance, holeDiameter, width, thickness, smallHoleDia)
{
difference()
{
union()
{
    cylinder(h = thickness, d = width);
    
    translate([axisDistance,0,0])cylinder(h = thickness, d = width);
    
    translate([0,-width/2,0])cube([axisDistance,width,thickness]);
    
}// union

cylinder(h = thickness, d = smallHoleDia);

translate([axisDistance,0,0])cylinder(h = thickness, d = holeDiameter);



}//difference
}//module beam



