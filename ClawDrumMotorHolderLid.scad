$fn=50;
MOTOR_WIDTH = 45; //width of square with safety
MOTOR_LENGTH = 47;//length of the motor house without PG
PG_DIA = 37; //diameter of the engine with safety

WALL_WIDTH = 5;
ALLAN_HOLE_DIA = 5.5;
ALLAN_DISTANCE = 10;
SELF_TAPPING_DIA = 1.5; //for M3×16 screws, maybe for M2 instead?

difference()
{
cube([MOTOR_LENGTH+2*WALL_WIDTH, MOTOR_WIDTH+2*WALL_WIDTH, WALL_WIDTH]);
translate([WALL_WIDTH,WALL_WIDTH,0])cube([MOTOR_LENGTH/2, MOTOR_WIDTH, WALL_WIDTH]);
SideHoles(MOTOR_WIDTH, MOTOR_LENGTH, WALL_WIDTH, SELF_TAPPING_DIA);
}

module SideHoles(side, length, wall, hole)
{
	depth = wall;
	origin = [wall/2,wall/2,0];
	
	translate(origin)cylinder(h = depth, d = hole);
	translate(origin+[length+wall,0,0])cylinder(h = depth, d = hole);
	translate(origin+[(length+wall)*1/3,side+wall,0])cylinder(h = depth, d = hole);
	translate(origin+[(length+wall)*2/3,side+wall,0])cylinder(h = depth, d = hole);
	
}

