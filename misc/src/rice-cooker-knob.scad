$fn=80;

difference() {
   form();
   cutouts();
}

module cutouts() {
   totHt = 18;
   split = 12;
   translate([0,0,split+0.3]) cylinder(d=6, h=totHt - split - 0.3);
   translate([0,0,-0.1]) cylinder($fn=6, d1=12, d2=11.75, h=split+0.1);
}

module form() {
   hull() {
      cylinder(d=13,h=17);
      cylinder(d=18,h=15);
   }
   intersection() {
      translate([0,0,3.5]) hull() rotate_extrude($fn=80) translate([18,0,0]) scale([1,2.0,1]) circle(r=2);
      translate([0,0,5]) cube([50,50,10],center=true);
   }
}

