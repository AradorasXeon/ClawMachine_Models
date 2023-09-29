$fn=150;

height = 44;
holeInsideHeight = 42;
diameterInside = 30;
diameterOutside = 36;
flangeDiameter = 41;

flangeHole = 3;
flangeThickness = 3;


difference()
{
union()
{

difference()
{
cylinder(h=height, d=diameterOutside);

cylinder(h= holeInsideHeight, d= diameterInside);
    
   translate([-3.5,diameterOutside/2-7,height-13])cube([7,7,13]);
    
cylinder(h=height, d=5);

}


for(i=[0:120:359])
{
    echo(i);
    basePoint = 
    [
        (flangeDiameter/2-2)*cos(i),
        (flangeDiameter/2-2)*sin(i),
        0
    ];

    translate(basePoint)rotate([0,0,i])flange( flangeThickness, flangeHole);
}
//for end
}


}

module flange(thick, hole)
{
    HOLEA = 1.8* hole;
    //Default: Draws triangle on the XZ plane
    xB = 0 + HOLEA/2*(1/(tan(14))+1/tan(45));
    
    zA = 0 + HOLEA/2*(1/(tan(7))+1/tan(45));
    
    holeCenter = 
    [
    HOLEA/2+3,
    0,
    HOLEA/2
    ];
    
    diffCubeTranslate =
    [
    xB-hole/2,
    holeCenter[1],
    holeCenter[2]+5
    ];
    
    
    
    echo("xB is:", xB);
    echo("zA is:", zA);
    echo("holeCent is:", holeCenter);
    
    //Points of polyhedron:
    Points = 
    [
    [0-1,thick/2,0],
    [0-1,-thick/2,0],
    [xB+1,-thick/2,0],
    [xB+1,thick/2,0],
    [0-1,thick/2,zA],
    [0-1,-thick/2,zA]
    ];
    //Faces of polyhedron:
    Faces =
    [
    [0,1,2,3],
    [0,3,4],
    [1,5,2],
    [3,2,5,4],
    [4,5,1,0]
    //oreder matters, says where the norm will point
    ];
    
    difference()
    {
    polyhedron(Points,Faces);
        translate(holeCenter)
        
        rotate(a=[90,0,0]) cylinder(h = thick+2, d=hole, center = true);
        
        translate(diffCubeTranslate) cube([thick*2,thick, 2*zA], center=true);
        
    }
    
    
    
    
}//flange

//END
