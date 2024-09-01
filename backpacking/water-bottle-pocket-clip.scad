$fn=40;
thick=2;

difference() {
   hull() {
      translate([6,8.5,0]) cylinder(r=1,h=thick);
      translate([-6,8.5,0]) cylinder(r=1,h=thick);
      translate([-6,-8.5,0]) cylinder(r=1,h=thick);
      translate([6,-8.5,0]) cylinder(r=1,h=thick);
   }

   translate([-3.,0,2]) cube([3.5,15.2,5],center=true);
   translate([3.,0,2]) cube([3.5,15.2,5],center=true);
}
