//resolution:
$fn=50;


//Input
L = 800; // rope length [mm]
n = 4; // number of winding
ropeD = 5; //rope diameter with safety [mm]
h = 2; // base rings width

wormD = 5.2; //worm screw hole diameter [mm]

holeD = 5.2; //shaft hole diameter [mm]



//CAD

//math
outerD = round(L/(n*PI)); //diameter of drum
echo("outerD is:" , outerD);


coneHeight = outerD/4.5; //half width of drum

echo("coneHeight is:" , coneHeight);

innerD = outerD/2 ; //inner rim DIA
echo("innerD is:" , innerD);

difference()
{
    drum();
    shaftHole(2.5*coneHeight,holeD);
}



module drum()
{
halfDrum(coneHeight, outerD, innerD,wormD, ropeD);

translate([0,0,coneHeight*2])mirror([0,0,1]) halfDrum(coneHeight, outerD, innerD,wormD, ropeD);
}

module halfDrum(height, OuterDia, InnerDia, worm, ropeDia)
{
    difference()
    {
cylinder(height, d1= OuterDia, d2 = InnerDia);

translate([0,OuterDia/2,height/2]) rotate(a=90, v=[1,0,0]) cylinder(OuterDia/2, d= worm);
    

translate([OuterDia/2-ropeDia,ropeDia,0]) cylinder(height, d=ropeDia);    
translate([OuterDia/2-ropeDia,-ropeDia,0]) cylinder(height, d=ropeDia);
    }
}



module shaftHole(holeHeight, holeD)
{
    difference()
    {
cylinder(holeHeight, d = holeD);
translate([-holeD/2,2/5*holeD,0]) cube([holeD,holeD,holeHeight]);
    }
}


