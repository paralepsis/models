$fn=60;

depth=49.5;
width=248;

frontHt=8;
backHt=15;
frontWid=10;
frontDep=30;

botThick=3;

bevel=2;

difference() {
   base();
   translate([-width/2-0.1,-depth/2,botThick]) cube([width+0.2, depth, 20]);
}

module base() {
   /* just the base */
   hull() {
      translate([-width/2+bevel, -depth/2+bevel, 0]) cylinder(r=bevel,h=botThick);
      translate([width/2-bevel, -depth/2+bevel, 0]) cylinder(r=bevel,h=botThick);
      translate([-width/2+bevel, depth/2-bevel, 0]) cylinder(r=bevel,h=botThick);
      translate([width/2-bevel, depth/2-bevel, 0]) cylinder(r=bevel,h=botThick);
   }
   
   /* left side */
   hull() {
      /* bottom */
      translate([-width/2+bevel, -depth/2+bevel-frontDep, 0]) cylinder(r=bevel,h=botThick);
      translate([-width/2+bevel, depth/2-bevel+frontDep, 0]) cylinder(r=bevel,h=botThick);
      translate([-width/2+bevel+frontWid, -depth/2+bevel-frontDep, 0]) cylinder(r=bevel,h=botThick);
      translate([-width/2+bevel+frontWid, depth/2-bevel+frontDep, 0]) cylinder(r=bevel,h=botThick);

      /* mid */
      translate([-width/2+bevel, -depth/2+bevel-frontDep, botThick]) sphere(r=bevel);
      translate([-width/2+bevel, depth/2-bevel+frontDep, botThick]) sphere(r=bevel);
      translate([-width/2+bevel+frontWid, -depth/2+bevel-frontDep, botThick]) sphere(r=bevel);
      translate([-width/2+bevel+frontWid, depth/2-bevel+frontDep, botThick]) sphere(r=bevel);

      /* top */
      translate([-width/2+bevel, -depth/2+bevel, frontHt-bevel]) sphere(r=bevel);
      translate([-width/2+bevel, depth/2-bevel, backHt-bevel]) sphere(r=bevel);
      translate([-width/2+bevel+frontWid, -depth/2+bevel, frontHt-bevel]) sphere(r=bevel);
      translate([-width/2+bevel+frontWid, depth/2-bevel, backHt-bevel]) sphere(r=bevel);
   }
   
   /* right side */
   hull() {
      /* bottom */
      translate([width/2-bevel, -depth/2+bevel-frontDep, 0]) cylinder(r=bevel,h=botThick);
      translate([width/2-bevel, depth/2-bevel+frontDep, 0]) cylinder(r=bevel,h=botThick);
      translate([width/2-bevel-frontWid, -depth/2+bevel-frontDep, 0]) cylinder(r=bevel,h=botThick);
      translate([width/2-bevel-frontWid, depth/2-bevel+frontDep, 0]) cylinder(r=bevel,h=botThick);

      /* mid */
      translate([width/2-bevel, -depth/2+bevel-frontDep, botThick]) sphere(r=bevel);
      translate([width/2-bevel, depth/2-bevel+frontDep, botThick]) sphere(r=bevel);
      translate([width/2-bevel-frontWid, -depth/2+bevel-frontDep, botThick]) sphere(r=bevel);
      translate([width/2-bevel-frontWid, depth/2-bevel+frontDep, botThick]) sphere(r=bevel);

      /* top */
      translate([width/2-bevel, -depth/2+bevel, frontHt-bevel]) sphere(r=bevel);
      translate([width/2-bevel, depth/2-bevel, backHt-bevel]) sphere(r=bevel);
      translate([width/2-bevel-frontWid, -depth/2+bevel, frontHt-bevel]) sphere(r=bevel);
      translate([width/2-bevel-frontWid, depth/2-bevel, backHt-bevel]) sphere(r=bevel);
   }
}
