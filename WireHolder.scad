WIRE_DIA = 4.5;
LENGTH = 15;
WIDTH = 10;

$fn = 50;



difference()
{
	union()
	{
		cube([WIDTH, LENGTH, 2]);

		translate([WIDTH/2, LENGTH, (WIRE_DIA+1)/2+1.5])rotate([90,0,0])difference()
		{
			union()
			{
				cylinder(LENGTH, d=WIRE_DIA+2, center = false);
				translate([(WIRE_DIA+2)/2,-1,0])rotate([90,-90,0])cube([LENGTH, WIRE_DIA+2, 2]);
			}
			cylinder(LENGTH, d=WIRE_DIA, center = false);
			
		}
	}
	TEMP = (WIRE_DIA+2)/3;
	translate([WIDTH/2-TEMP/2,0,WIRE_DIA+1])cube([TEMP, LENGTH, 2]);
}
