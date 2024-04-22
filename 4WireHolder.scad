LENGTH = 20;
WIDTH = 20;
HEIGHT = 4;

CUT_WIDTH = 7;
CUT_HEIGHT = 2;

union()
{
	difference()
	{
		cube([WIDTH,HEIGHT,LENGTH]);
		translate([WIDTH/2-CUT_WIDTH/2,0,0])cube([CUT_WIDTH,CUT_HEIGHT,LENGTH]);
	}
	
	difference()
	{
		mirror([0,1,0])cube([WIDTH,HEIGHT,LENGTH]);
		mirror([0,1,0])translate([WIDTH/2-CUT_WIDTH/2,0,0])cube([WIDTH,CUT_HEIGHT,LENGTH]);
	}

	mirror([1,0,0])cube([WIDTH,HEIGHT,LENGTH]);
	

}