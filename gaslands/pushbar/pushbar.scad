$fn=30;

half();
mirror([1,0,0]) half();
side();
mirror([1,0,0]) side();

module half() {
   translate([5,0,0]) vertMember();
   translate([0,0,3]) rotate([0,90,0]) translate([0,0,-0.1]) cylinder(d=1.5,h=5);
   translate([0,-1.5,0]) rotate([0,90,0]) translate([0,0,-0.1]) cylinder(d=1.5,h=5);
   translate([0,-1.5,-2]) rotate([0,90,0]) translate([0,0,-0.1]) cylinder(d=1.5,h=5);
}

module side() {
   len1 = 7;
   len2 = 5;
   len2Top = 4.5;
   angle = 15;

   translate([5,0,3]) rotate([0,90,0]) cylinder(d=1.5,h=len1);
   translate([5+len1,0,3]) sphere(d=1.5);
   translate([5+len1,0,3]) rotate([0,0,angle]) {
      translate([len2Top,0,0]) sphere(d=1.5);
      rotate([0,90,0]) cylinder(d=1.5,h=len2Top);
   }

   translate([5,-1.5,0]) rotate([0,90,0]) cylinder(d=1.5,h=len1);
   translate([5+len1,-1.5,0]) sphere(d=1.5);
   translate([5+len1,-1.5,0]) rotate([0,0,angle]) {
      translate([5,0,0]) sphere(d=1.5);
      rotate([0,90,0]) cylinder(d=1.5,h=5);
   }

   translate([5,-1.5,-2]) rotate([0,90,0]) cylinder(d=1.5,h=len1);
   translate([5+len1,-1.5,-2]) sphere(d=1.5);
   translate([5+len1,-1.5,-2]) rotate([0,0,angle]) {
      translate([5,0,0]) sphere(d=1.5);
      rotate([0,90,0]) cylinder(d=1.5,h=5);
   }
   translate([5+len1,0,0]) hull() {
      translate([0,0,3]) rotate([0,0,angle]) translate([len2Top,0,0]) sphere(d=1.5);
      translate([0,-1.5,0]) rotate([0,0,angle]) translate([len2,0,0]) sphere(d=1.5);
   }
   translate([5+len1,0,0]) hull() {
      translate([0,-1.5,0]) rotate([0,0,angle]) translate([len2,0,0]) sphere(d=1.5);
      translate([0,-1.5,-2]) rotate([0,0,angle]) translate([len2,0,0]) sphere(d=1.5);
   }
}

module vertMember() {
   thick=1.5;

   rotate([90,-90,90]) translate([0,0,-thick/2]) {
      hull() {
         translate([0,0.5,0]) cylinder(d=3,h=thick);
         translate([0,1.5,0]) cylinder(d=3,h=thick);
         translate([3,0,0]) cylinder(d=3,h=thick);
      }
      hull() {
         translate([0,0.5,0]) cylinder(d=3,h=thick);
         translate([0,1.5,0]) cylinder(d=3,h=thick);
         translate([-2,0.5,0]) cylinder(d=3,h=thick);
         translate([-2,1.5,0]) cylinder(d=3,h=thick);
      }
   }
}
