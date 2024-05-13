rad = 0.2;
pt1 = [-11+rad,0+rad,0];
pt2 = [-9+rad,7.5-rad,0];
pt3 = [9-rad,7.5-rad,0];
pt4 = [11-rad,0+rad,0];

ipt1 = [-11+rad+1.5,0+rad+0.5,-0.1];
ipt2 = [-9+rad+1,7.5-rad-1.5,-0.1];
ipt3 = [9-rad-1,7.5-rad-1.5,-0.1];
ipt4 = [11-rad-1.5,0+rad+0.5,-0.1];

difference() {
   flatForm();
   scale([1,1,.04]) translate([0,-2.2,0]) rotate([-90,0,0]) cylinder($fn=30,r=11,h=12);
}



module flatForm() {
   difference() {
      hull() {
         translate(pt1) cylinder(r=rad,h=1);
         translate(pt2) cylinder(r=rad,h=1);
         translate(pt3) cylinder(r=rad,h=1);
         translate(pt4) cylinder(r=rad,h=1);
         scale([1,1/11*1.3,1]) cylinder($fn=30,r=11,h=1);
      }
   
      hull() {
         translate(ipt1) cylinder(r=rad,h=1.7);
         translate(ipt2) cylinder(r=rad,h=1.7);
         translate(ipt3) cylinder(r=rad,h=1.7);
         translate(ipt4) cylinder(r=rad,h=1.7);
      }
   }

   translate([-.75,0,0]) cube([1.5,7.5,1]);
   
   translate([0,0,0.3]) difference() {
      union() {
         translate([0,3.6,0]) rotate([45,0,0]) translate([0,0,1.25]) cube([19.8,0.75,2.5],center=true);
         translate([0,7,0]) rotate([45,0,0]) translate([0,0,1.25]) cube([18.0,0.75,2.5],center=true);
      }
   //   translate([0,0,-1.5]) cube([40,40,3],center=true);
   }
}
