width = 299;
depth = 59;
thick = 6;

holeDia = 3.5;
holeXOff = 4.5;
holeYOff = 14.5;

$fn=50;

difference() {
   hull() {
      translate([width/2-1,depth/2-1,0]) cylinder(r=1,h=thick);
      translate([-width/2+1,depth/2-1,0]) cylinder(r=1,h=thick);
      translate([width/2-1,-depth/2+1,0]) cylinder(r=1,h=thick);
      translate([-width/2+1,-depth/2+1,0]) cylinder(r=1,h=thick);
   }

   
   translate([-width/2+holeXOff,-depth/2+holeYOff,-1]) cylinder(d=holeDia,h=thick+2);
   translate([width/2-holeXOff,-depth/2+holeYOff,-1]) cylinder(d=holeDia,h=thick+2);
   translate([-width/2+holeXOff,depth/2-holeYOff,-1]) cylinder(d=holeDia,h=thick+2);
   translate([width/2-holeXOff,depth/2-holeYOff,-1]) cylinder(d=holeDia,h=thick+2);
   translate([20,depth/2+1,-1]) scale([1.5,1,1]) cylinder(d=21,h=thick+2);
   translate([width/2-15,depth/2+1,-1]) cylinder(d=10,h=thick+2);
}
