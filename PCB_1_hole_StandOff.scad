//PCB 1 hole Stand Off

$fn = 150;

height = 7;
bigDia = 6;
smallDia = 2.4;
topHeight = 6;

//base for glue
baseDia = 16;
baseHeight = 2;

cylinder(baseHeight, d = baseDia);
cylinder(height, d = bigDia);
cylinder(height + topHeight, d = smallDia);

