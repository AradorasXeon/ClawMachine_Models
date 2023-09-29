$fn=150;

height = 12;

diameterInside = 4;
diameterOutside = 24;



difference()
{
cylinder(h=height, d=diameterOutside);

cylinder(h=height, d=diameterInside);

}


//END
