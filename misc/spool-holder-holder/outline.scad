dep=81; /* measured 80.3 */
wid=43; /* measured 42.3 */
thk=8;  /* measured 3.5 */
spc=20; /* est. for typical 1kg spool */
rad=3;  /* est. from model */

outsideWid=8;

$fn=60;

difference() {
   outside();
   inside();
}

module inside() {
   hull() {
      translate([-dep/2+rad, -wid+rad-spc/2,-1]) cylinder(r=3,h=thk+2);
      translate([dep/2-rad, -wid+rad-spc/2,-1]) cylinder(r=3,h=thk+2);
      translate([dep/2-rad, wid-rad+spc/2,-1]) cylinder(r=3,h=thk+2);
      translate([-dep/2+rad, wid-rad+spc/2,-1]) cylinder(r=3,h=thk+2);
   }
}

module outside() {
   hull() {
      translate([-dep/2+rad-outsideWid, -wid+rad-spc/2-outsideWid,0])
         cylinder(r=3,h=thk);
      translate([dep/2-rad+outsideWid, -wid+rad-spc/2-outsideWid,0])
         cylinder(r=3,h=thk);
      translate([dep/2-rad+outsideWid, wid-rad+spc/2+outsideWid,0])
         cylinder(r=3,h=thk);
      translate([-dep/2+rad-outsideWid, wid-rad+spc/2+outsideWid,0])
         cylinder(r=3,h=thk);
   }
}
