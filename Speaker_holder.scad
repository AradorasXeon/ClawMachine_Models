$fn = 250;

SPEAKER_BIG_DIA = 66;
SPEAKER_SMALL_DIA = 32;
SPEAKER_FULL_HEIGHT = 18;
SPEAKER_SMALL_HEIGHT = 9;
WALL = 2;

difference()
{
union()
{
	cylinder(h = WALL, d = SPEAKER_BIG_DIA*1.5,center =false);

	translate([0,0,WALL])difference()
	{
		cylinder(h = SPEAKER_FULL_HEIGHT+2*WALL, d = SPEAKER_BIG_DIA+3*WALL,center =false);
		cylinder(h = SPEAKER_FULL_HEIGHT+2*WALL, d = SPEAKER_BIG_DIA,center =false);
		cylinder(h = SPEAKER_FULL_HEIGHT, d = SPEAKER_BIG_DIA+2*WALL,center =false);	
	}	
}
	translate([-SPEAKER_BIG_DIA,0,0])cube(2*SPEAKER_BIG_DIA);
	translate([-SPEAKER_BIG_DIA/8,-SPEAKER_BIG_DIA,WALL])cube([SPEAKER_BIG_DIA/4,SPEAKER_BIG_DIA,SPEAKER_FULL_HEIGHT+2*WALL]);
}