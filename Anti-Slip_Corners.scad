SIZE = 35;
WALL = 2.5;
HEIGHT = 15;

difference()
{
	cube(SIZE);
	translate([WALL,WALL,WALL])cube(SIZE);
	translate([0,0,HEIGHT])cube(SIZE);
	translate([HEIGHT,HEIGHT,0])cube(SIZE);
}