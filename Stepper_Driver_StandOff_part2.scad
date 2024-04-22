$fn=150;

LENGTH_X = 50;
BASE_Y = 20;
BASE_HEIGHT = 2.5;

SPINE_HEIGHT = 35;
SPINE_BASE_WIDTH = 5;

cube([LENGTH_X,BASE_Y,BASE_HEIGHT]);
translate([0,BASE_Y,0])cube([LENGTH_X,2,SPINE_HEIGHT]);

translate([2*SPINE_BASE_WIDTH,BASE_Y+2,0])cube([SPINE_BASE_WIDTH,SPINE_BASE_WIDTH,SPINE_HEIGHT]);
translate([LENGTH_X-2*SPINE_BASE_WIDTH,BASE_Y+2,0])cube([SPINE_BASE_WIDTH,SPINE_BASE_WIDTH,SPINE_HEIGHT]);