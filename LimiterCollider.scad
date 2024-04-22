THICKNESS = 6.5;
LENGTH = 15;
WALL = 2.5;
WIDTH = 3;

difference()
{
	cube([WALL*2+THICKNESS, WALL+WIDTH, LENGTH]);
	translate([WALL,0,0])cube([THICKNESS, WIDTH, LENGTH]);
	
}