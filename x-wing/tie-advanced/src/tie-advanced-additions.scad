
% import("/Users/rross/git/models/x-wing/tie-advanced/src/tie-advanced.stl");

/*
        2.14 little dia
        4.48 big dia
        4.32 ht
*/
littleRad = 2.14/2;
littleHt  = 4.32;
bigRad    = 4.48/2;
bigHt     = 3.3; // was 4 originally

$fn=20;

connectorOutline();
// connectorComplete();

// customRaft();

module customRaft() {
   linear_extrude(height=0.3) hull() {
      translate([-11.5,2]) circle(r=2);
      translate([11.5,2]) circle(r=2);
      translate([11.5,-2]) circle(r=2);
      translate([-11.5,-2]) circle(r=2);
      translate([2,-9]) circle(r=2);
      translate([-2,-9]) circle(r=2);
   }
}

/* connectorOutline() -- a base shape for cutting out of an existing STL,
   so that the connector can then be "unioned" back in. Note that it is scaled
   just a bit smaller so that there will be some overlap when the connector
   is "unioned".
*/
module connectorOutline() {
   translate([0,-9,26]) rotate([-90,0,0]) {
      scale([0.998,0.998,1])
         cylinder(r1=bigRad+0.4,r2=bigRad+0.8,h=littleRad+littleHt + bigHt + 1);
   }
}

module connectorComplete() {
   translate([0,-9,26]) rotate([-90,0,0]) difference() {
      cylinder(r1=bigRad+0.4,r2=bigRad+0.8,h=littleRad+littleHt + bigHt + 1);
      translate([0,0,-0.05]) internals();
   }
}

module additionalSupport() {
   translate([-19,-7.2,13]) rotate([0,90,0]) scale([1,1.35,1])
      cylinder(r1=3,r2=1.55,h=4);
   mirror([1,0,0]) translate([-19,-7.2,13]) rotate([0,90,0]) scale([1,1.35,1])
      cylinder(r1=3,r2=1.55,h=4);
}

/* INTERNALLY USED MODULES */

/* internals -- this is the common inside of a connector I've been using */
module internals() {
        translate([0,0,bigHt]) {
                translate([0,0,littleHt]) sphere(r=littleRad);
                cylinder(r=littleRad, h=littleHt);
                translate([0,0,-1*bigHt]) cylinder(r=bigRad, h = bigHt);
        }
}
