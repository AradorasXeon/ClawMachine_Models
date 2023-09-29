$fn=50;

height = 40;
diameterInside = 26;
thickness = 2;
diameterOutside = diameterInside+2*thickness;
diameterHoleOnTop = 5;

flangeHole = 3;
flangeThickness = 3;

difference()
{
cylinder(h=height, d=diameterOutside);

cylinder(h= height - thickness, d= diameterInside);
    
cylinder(h = height+1, d= diameterHoleOnTop);
}


for(i=[0:120:359])
{
    echo(i);
    basePoint = 
    [
        (diameterOutside/2-1)*cos(i),
        (diameterOutside/2-1)*sin(i),
        0
    ];

    rotate([0,0,i])flange(basePoint, flangeThickness, flangeHole);
}
module flange(basePoint, thick, hole)
{
    HOLEA = 1.8* hole;
    //Default: Draws triangle on the XZ plane
    xB = basePoint[0] + HOLEA/2*(1/(tan(30))+1/tan(45));
    
    zA = basePoint[2] + HOLEA/2*(1/(tan(15))+1/tan(45));
    
    holeCenter = 
    [
    basePoint[0] + HOLEA/2,
    basePoint[1],
    basePoint[2] + HOLEA/2
    ];
    
    diffCubeTranslate =
    [
    holeCenter[0] + 1.5*hole,
    holeCenter[1],
    holeCenter[2]+5
    ];
    
    echo("xB is:", xB);
    echo("zA is:", zA);
    echo("holeCent is:", holeCenter);
    
    //Points of polyhedron:
    Points = 
    [
    [basePoint[0]-1,thick/2,0],
    [basePoint[0]-1,-thick/2,0],
    [xB+1,-thick/2,0],
    [xB+1,thick/2,0],
    [basePoint[0]-1,thick/2,zA],
    [basePoint[0]-1,-thick/2,zA]
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
        translate(holeCenter)rotate(a=[90,0,0]) cylinder(h = thick+2, d=hole, center = true);
        translate(diffCubeTranslate) cube([thick,thick, 2*zA], center=true);
        
    }
    
    
    
    
}


