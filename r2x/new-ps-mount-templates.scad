$fn = 20;
len = 242;
wid = 33;

spacing = 46.5;
boltDia = 3.2;

endcap(rad=1);

module endcap(rad=1) {
   difference() {
      union() {
         hull() {
            translate([1,1,0]) cylinder(r=1,h=3);
            translate([wid+5-1,1,0]) cylinder(r=1,h=3);
            translate([1,len-1,0]) cylinder(r=1,h=3);
            translate([wid+5-1,len-1,0]) cylinder(r=1,h=3);
         }
      }

      /* wire passthrough */
      hull() {
         translate([6,12,-1]) cylinder(r=1,h=12);
         translate([wid+5-1-7,12,-1]) cylinder(r=1,h=12);
         translate([6,len-12,-1]) cylinder(r=1,h=12);
         translate([wid+5-1-7,len-12,-1]) cylinder(r=1,h=12);
      }


      /* heat set inserts */
      translate([6,5,-1]) cylinder (r=rad, h=6.9);
      translate([31.5,5,-1]) cylinder (r=rad, h=6.9);

      translate([6,5+231,-1]) cylinder (r=rad, h=6.9);
      translate([31.5,5+231,-1]) cylinder (r=rad, h=6.9);
   }
}
