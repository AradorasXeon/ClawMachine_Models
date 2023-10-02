$fn=150;
MOTOR_WIDTH = 45; //width of square with safety
MOTOR_LENGTH = 47;//length of the motor house without PG
PG_DIA = 37; //diameter of the engine with safety

WALL_WIDTH = 5;
ALLAN_HOLE_DIA = 5.5;
ALLAN_DISTANCE = 10;
SELF_TAPPING_DIA = 2.8; //for M3×16 screws

difference()
{
union()
{
difference()
{
	cube([MOTOR_WIDTH, MOTOR_LENGTH, WALL_WIDTH]);
	translate([MOTOR_WIDTH/2,MOTOR_LENGTH/2,0])AllenHoles(ALLAN_DISTANCE, ALLAN_HOLE_DIA, WALL_WIDTH);
	
}
translate([0,MOTOR_LENGTH,0])BackWall(WALL_WIDTH, MOTOR_WIDTH);
translate([0,-WALL_WIDTH,0])FrontWall(WALL_WIDTH, MOTOR_WIDTH, PG_DIA);
difference()
{
	translate([0,0,WALL_WIDTH+MOTOR_WIDTH])cube([MOTOR_WIDTH, MOTOR_LENGTH, WALL_WIDTH]);
	translate([MOTOR_WIDTH/2,MOTOR_LENGTH/2,WALL_WIDTH+MOTOR_WIDTH])cylinder(h = WALL_WIDTH, d = 1.28*(2*ALLAN_DISTANCE+ALLAN_HOLE_DIA));
}
translate([-WALL_WIDTH,-WALL_WIDTH,0])SideWall(WALL_WIDTH, MOTOR_LENGTH, MOTOR_WIDTH);
}
SideHoles(MOTOR_WIDTH, MOTOR_LENGTH, WALL_WIDTH, SELF_TAPPING_DIA);


}

module AllenHoles(dist, hole, depth)
{
	cylinder(h = depth, d = hole);
	translate([0,dist,0])cylinder(h = depth, d = hole);
	translate([0,-dist,0])cylinder(h = depth, d = hole);
	translate([dist,0,0])cylinder(h = depth, d = hole);
	translate([-dist,0,0])cylinder(h = depth, d = hole);
}

module BackWall(wall, side)
{
	cube([side, wall, 2*wall+side]);
}

module FrontWall(wall, side, pgDia)
{
	dia = 1.05*pgDia;
	difference()
	{
		BackWall(wall, side);
		translate([side/2,0,wall+side/2])rotate([0,90,90])cylinder(h = wall, d = dia);
		translate([side/2,0,wall+side/2-dia/2])cube([side,wall,dia]);
	}
}

module SideWall(wall, length, baseHeight)
{
	cube([wall, length+2*wall, baseHeight+2*wall]);
}

module SideHoles(side, length, wall, hole)
{
	depth = 6*hole;
	origin = [side,-wall/2,wall/2];
	
	translate(origin)rotate([0,-90,0])cylinder(h = depth, d = hole);
	translate(origin+[0,0,side+wall])rotate([0,-90,0])cylinder(h = depth, d = hole);
	translate(origin+[0,length+wall,side+wall])rotate([0,-90,0])cylinder(h = depth, d = hole);
	translate(origin+[0,length+wall,0])rotate([0,-90,0])cylinder(h = depth, d = hole);
}

