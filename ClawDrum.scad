//resolution:
$fn=50;


//Input
L = 800; // rope length [mm]
n = 5; // number of winding
ropeD = 5; //rope diameter with safety [mm]
h = 2; // base rings width

wormD = 5; //worm screw hole diameter [mm]

holeD = 5; //hole diameter [mm]



//CAD

//math
D = round(L/(n*PI)); //diameter of drum
echo("D is:" , D);


v = n* ropeD; //width of drum

hD = D + 3.5*ropeD; //outerrim DIA
coneHeight = 1.8*ropeD;


 


//model
difference()
{
drum(h, hD, v, coneHeight);
    //shaft hole
    hole(2*h+coneHeight+v, holeD);
    
    
    //rope holes
    translate([hD/2-(hD-D)/2, 3*ropeD,0]) cylinder(10,d=ropeD,true);
    
    translate([hD/2-(hD-D)/2, -3*ropeD,0]) cylinder(10,d=ropeD,true);
    
    
    //wormhole
    translate([0,0,v/2+h])
rotate(a= -90,v=[1,0,0]) cylinder(D/2, d=wormD);
    
}
//drum
module drum(h, hD, v, coneHeight)
{
cylinder(h, d=hD);

translate([0,0,h]) cylinder(v, d=D);

translate([0,0,h+v]) cylinder(coneHeight, d1 = D,d2=hD);
//cone is there only to make it easier for FDM printer

translate([0,0,h+v+coneHeight]) cylinder(h, d=hD);
}



module hole(holeHeight, holeD)
{
    difference()
    {
cylinder(holeHeight, d = holeD);
translate([-holeD/2,2/5*holeD,0]) cube([holeD,holeD,holeHeight]);
    }
}


