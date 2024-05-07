rad = 0.2;
pt1 = [-12+rad,0+rad,0];
pt2 = [-11+rad,5.5-rad,0];
pt3 = [11-rad,5.5-rad,0];
pt4 = [12-rad,0+rad,0];

ipt1 = [-12+rad+1.25,0+rad+0.75,-0.1];
ipt2 = [-11+rad+1,5.5-rad-1,-0.1];
ipt3 = [11-rad-1,5.5-rad-1,-0.1];
ipt4 = [12-rad-1.25,0+rad+0.75,-0.1];

difference() {
   flatForm();
   scale([1,1,.03]) translate([0,-0.2,0]) rotate([-90,0,0]) cylinder($fn=30,r=11,h=6);
}


module flatForm() {
   difference() {
      hull() {
         translate(pt1) cylinder(r=rad,h=0.8);
         translate(pt2) cylinder(r=rad,h=0.8);
         translate(pt3) cylinder(r=rad,h=0.8);
         translate(pt4) cylinder(r=rad,h=0.8);
      }
   
      hull() {
         translate(ipt1) cylinder(r=rad,h=1.7);
         translate(ipt2) cylinder(r=rad,h=1.7);
         translate(ipt3) cylinder(r=rad,h=1.7);
         translate(ipt4) cylinder(r=rad,h=1.7);
      }
   }
   
   translate([0,0,0.3]) difference() {
      union() {
         translate([0,2.7,0]) rotate([45,0,0]) translate([0,0,1.25]) cube([22.9,0.75,2.5],center=true);
         translate([0,5.2,0]) rotate([45,0,0]) translate([0,0,1.25]) cube([21.7,0.75,2.5],center=true);
      }
   //   translate([0,0,-1.5]) cube([40,40,3],center=true);
   }
}
