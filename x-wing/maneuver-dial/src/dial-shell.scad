/* dial-shell.scad
 *
 * Copyright (C) Robert B. Ross, 2016
 *
 * This software is released under the Creative Commons
 * Attribution-ShareAlike 4.0 International Public License.
 *
 * NOTE: partial-rotate-extrude is released under a separate license,
 *       described in that file.
 */

use <partial-rotate-extrude.scad>

$fn=120;

/* NOTES:
 * - dial is ~44.5mm in diameter, 2mm thick, 8mm dia. hole
 * - All measurements in mm 
 */

/*********** CONFIGURATION PARAMETERS ***********/

bodyRad=45.5/2+0.8; // radius of exterior of shell

faceThick=1.8;      // thickness of face with insert
shellFaceThick=0.9; // thickness of face of shell without insert
wheelThick=2.0;     // thickness of FFG dial wheel
totalThick=6.3;     // total thickness of the dial
wallThick=0.8;      // thickness of the walls of the dial

insertInset=2;      // red. in radius of insert from (bodyRad - wallThick)
armSlop = 0.2;      // red. in XY dims of arm from hole to receive it
insertSlop = 0.3;   // red. in radius of insert from inset cut

/*********** PARTS TO BUILD ***********/

translate([0,-45,0]) arm();
translate([20,-45,0]) arm();
translate([40,-45,0]) arm();
translate([60,-45,0]) arm();
translate([80,-45,0]) arm();
translate([100,-45,0]) arm();
translate([0,0,0]) tieFace();
translate([50,0,0]) smileyFace();
translate([100,0,0]) t70Face();
// insert();

/*********** CUSTOMIZATIONS OF SHELL BELOW ***********/

module t70Face() {
   shell() translate([0.8,-1,-0.1]) rotate([0,0,10]) scale([1.52,1.52,2])
      mirror([1,0,0]) import("./t70-outline.stl");
}

module tieFace() {
   shell() translate([0,0,-0.1]) rotate([0,0,10]) scale([0.9,0.9,2])
      mirror([1,0,0]) import("./tie-fighter-outline.stl");
}

module smileyFace(h=0.9) {
   shell() translate([0,0,-0.1]) mirror([1,0,0]) smiley(h=2);
}

/*********** BASIC PARTS BELOW ***********/

module insert(slop=insertSlop) {
   translate([0,0,-1*shellFaceThick]) intersection() {
      body();
      bodyInsertVolume(slop=slop);
   }
}

module shell() {
   difference() {
      body();
      bodyInsertVolume();
      children();
   }
}

module bodyInsertVolume(slop=0) {
   rad = bodyRad - wallThick - insertInset - slop;

   translate([0,0,shellFaceThick]) difference() {
      cylinder(r=rad, h=totalThick+0.1);

      /* NOTES:
       * - +10/-10 angles ensure that the insert only fits one way 
       * - +0.2 on totalThick simply cleans up the difference
       * - +slop recenters the cylinder at the position of the "un-slopped"
       *   version
       */
      rotate([0,0,-30+10]) translate([rad+slop,0,-0.1])
         cylinder(r=3+slop,h=totalThick+0.2);
      rotate([0,0,90]) translate([rad+slop,0,-0.1])
         cylinder(r=3+slop,h=totalThick+0.2);
      rotate([0,0,210-10]) translate([rad+slop,0,-0.1])
         cylinder(r=3+slop,h=totalThick+0.2);
   }
}

/* arm() -- this is the arm that holds the dial in place
 */
module arm(slop=armSlop) {
   difference() {
      union() {
         translate([-2+slop/2,-2+slop/2,0]) cube([4-slop,4-slop,4]);
         cylinder(r=12/2,h=2);
         translate([-6,0,0]) cube([12,20,1.2]);
      }

      /* cutout at end */
      translate([0,12.5,-0.1]) {
         cylinder(r=3,h=3);
         translate([-3,0,0]) cube([6,10,3]);
      }
   }
}

/* body() -- this is the basic form.
 */
module body() {
   difference() {
      cylinder(r=bodyRad,h=totalThick);
      translate([0,0,faceThick])
         cylinder(r=bodyRad-wallThick,h=totalThick-faceThick+0.1);
      rotate([0,0,-125]) cutout();
   }

   /* center peg */
   difference() {
      cylinder(h=faceThick+wheelThick,r=4);
      translate([-2.0,-2.0,1.8]) cube([4,4,10]);
   }
}

/* cutout() -- this simply deals with the cutout in one side 
 */
module cutout() {
   translate([0,0,-0.5]) partial_rotate_extrude(70, bodyRad, 100)
      translate([-2,0,0]) square([5,10]);
}

/*********** TEST PART BELOW ***********/

module insertSlopTest() {
   render() difference() {
      bodyInsertVolume();
      bodyInsertVolume(slop=insertSlop);
   }
}

/*************** SMILEY POLYS BELOW ***************/

module smiley(h=1) {
   translate([0,-0.25,0]) scale([0.9,0.9,1]) color("black") {
      poly_path14(h);
      poly_path8(h);
      poly_path10(h);
   }
}

module poly_path14(h)
{
   scale([25.4/90, -25.4/90, 1]) union()
   {
      linear_extrude(height=h)
      polygon([[-50.650000,23.307227], [-54.240625,25.357227],
               [-57.700000,28.007227],[-60.184375,30.507227],
               [-60.797266,31.466602],[-60.850000,32.107227],
               [-59.362500,32.694727],[-56.450000,32.907227],
               [-53.575000,32.582227],[-53.018750,32.147852],
               [-52.950000,31.507227],[-52.861523,31.380664],
               [-52.467188,31.582227],[-50.887500,32.857227],
               [-45.450000,38.107227],[-39.198438,43.935352],
               [-32.787500,48.732227],[-26.057812,52.591602],
               [-18.850000,55.607227],[-15.298047,56.618750],
               [-11.209375,57.399414],[-2.125000,58.244727],
               [6.996875,58.096289],[11.132422,57.634766],
               [14.750000,56.907227],[19.455469,55.474609],
               [24.156250,53.602539],[28.791406,51.329688],
               [33.300000,48.694727],[37.621094,45.736328],
               [41.693750,42.493164],[45.457031,39.003906],
               [48.850000,35.307227],[50.996875,32.855664],
               [52.525000,31.519727],[53.715625,31.102539],
               [54.850000,31.407227],[56.800000,32.138477],
               [58.750000,32.382227],[60.250000,32.138477],
               [60.690625,31.833789],[60.850000,31.407227],
               [60.356641,30.231055],[59.021875,28.747852],
               [54.700000,25.432227],[49.628125,22.604102],
               [47.355859,21.730273],[45.550000,21.407227],
               [44.723828,21.524219],[44.190625,21.855664],
               [43.943359,22.372266],[43.975000,23.044727],
               [44.846875,24.740039],[46.750000,26.707227],
               [49.750000,29.207227],[46.250000,33.207227],
               [42.497998,37.035034],[38.223047,40.415625],
               [33.490479,43.344751],[28.365625,45.818164],
               [22.913818,47.831616],[17.200391,49.380859],
               [11.290674,50.461646],[5.250000,51.069727],
               [-0.856299,51.200854],[-6.962891,50.850781],
               [-13.004443,50.015259],[-18.915625,48.690039],
               [-24.631104,46.870874],[-30.085547,44.553516],
               [-35.213623,41.733716],[-39.950000,38.407227],
               [-43.914062,34.965039],[-47.062500,31.569727],
               [-48.654687,29.168164],[-48.635742,28.635938],
               [-47.950000,28.707227],[-46.459375,28.700977],
               [-45.100000,27.757227],[-44.040625,26.063477],
               [-43.450000,23.807227],[-43.604687,22.097852],
               [-44.049414,21.645117],[-44.762500,21.457227],
               [-47.064063,21.866602],[-50.650000,23.307227]]);
   }
}

module poly_path8(h)
{
   scale([25.4/90, -25.4/90, 1]) union()
   {
      linear_extrude(height=h)
      polygon([[-31.450000,-56.792773],
               [-32.496094,-55.187109], [-33.443750,-52.853711],
               [-34.950000,-46.505273], [-35.781250,-38.750586],
               [-35.750000,-30.592773], [-35.171875,-23.514648],
               [-34.275000,-18.217773], [-32.965625,-14.308398],
               [-31.150000,-11.392773], [-29.150000,-9.092773],
               [-27.350000,-11.292773], [-26.267578,-12.878516],
               [-25.346875,-14.997461], [-24.000000,-20.755273],
               [-23.328125,-28.406836], [-23.350000,-37.792773],
               [-24.050000,-48.367773], [-24.700000,-51.545898],
               [-25.650000,-53.992773], [-27.259375,-56.764648],
               [-28.625000,-58.092773], [-29.280859,-58.244727],
               [-29.953125,-58.070898],[-31.450000,-56.792773]]);
   }
}

module poly_path10(h)
{
   scale([25.4/90, -25.4/90, 1]) union()
   {
      linear_extrude(height=h)
      polygon([[26.250000,-53.992773],[24.875000,-48.980273],
               [23.650000,-42.092773],[23.219141,-36.841797],
               [23.240625,-31.397461],[23.660547,-26.035156],
               [24.425000,-21.030273],[25.480078,-16.658203],
               [26.771875,-13.194336],[28.246484,-10.914062],
               [29.035498,-10.303833],[29.850000,-10.092773],
               [30.661157,-10.298364],[31.440820,-10.893750],
               [32.882812,-13.125586],[34.130273,-16.531641],
               [35.137500,-20.855273],[35.858789,-25.839844],
               [36.248438,-31.228711],[36.260742,-36.765234],
               [35.850000,-42.192773],[34.729687,-49.155273],
               [33.412500,-53.942773],[32.653711,-55.567773],
               [31.814063,-56.705273],[30.883008,-57.374023],
               [29.850000,-57.592773],[28.795312,-57.381836],
               [27.862500,-56.730273],[27.023438,-55.609961],
               [26.250000,-53.992773]]);
   }
}

/*
 * Local variables:
 *  mode: C
 *  c-indent-level: 3
 *  c-basic-offset: 3
 * End:
 *
 * vim: ts=8 sts=3 sw=3 expandtab
 */
