$fn = 20;
len = 62.5;
wid = 33;

spacing = 46.5;
boltDia = 3.2;

endcap();

module endcap() {
   difference() {
      union() {
         hull() {
            translate([1,1,0]) cylinder(r=1,h=10);
            translate([wid+5-1,1,0]) cylinder(r=1,h=10);
            translate([1,len-1,0]) cylinder(r=1,h=10);
            translate([wid+5-1,len-1,0]) cylinder(r=1,h=10);
         }
         lip();
      }

      /* wire passthrough */
      hull() {
         translate([6,(len-40)/2+1,-1]) cylinder(r=1,h=12);
         translate([wid+5-1-7,(len-40)/2+1,-1]) cylinder(r=1,h=12);
         translate([6,(len+40)/2-1,-1]) cylinder(r=1,h=12);
         translate([wid+5-1-7,(len+40)/2-1,-1]) cylinder(r=1,h=12);
      }

      /* heat set inserts */
      translate([6,-0.1,5]) rotate([-90,0,0]) cylinder (d=5.2, h=6.9);
      translate([31.5,-0.1,5]) rotate([-90,0,0]) cylinder (d=5.2, h=6.9);

      /* screws */
      translate([wid+6,7.5,3.5+10]) rotate([0,-90,0]) cylinder(d=3.2,h=10);
      translate([wid+6,7.5+spacing,3.5+10]) rotate([0,-90,0]) cylinder(d=3.2,h=10);
   }
}


module lip() {
   hull() {
      translate([wid-1,1,0]) cylinder(r=1,h=17);
      translate([wid+5-1,1,0]) cylinder(r=1,h=17);
      translate([wid-1,len-1,0]) cylinder(r=1,h=17);
      translate([wid+5-1,len-1,0]) cylinder(r=1,h=17);
   }
}
