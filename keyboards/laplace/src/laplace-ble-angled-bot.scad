// import("./orig/laplace-mid.stl");

xDim    = 263.62;
yDim    = 92.14;
zDimMax = 17.6;
cRad    = 4;

angle   = 5;
botThickBack  = 2;
botThickFront = 1.2;

xIntDim = xDim-16;
yIntDim = yDim-16;
zIntOff = 1.2;
cIntRad = 2;

insertDim = 3.0;

$fn=20;

intersection() {
   angled();
   translate([-xDim/2-1, -yDim/2-1,-1]) cube([60,yDim+2,zDimMax+1]);
}

module angled() {
   /* body */
   difference() {
      translate([0,yDim/2,0]) rotate([angle,0,0]) translate([0,-yDim/2,0]) midExt();
      translate([-xDim/2-1,-yDim/2-1,-30]) cube([xDim+2,yDim+2,30]);
   }
   /* bottom */
   bot();
}

module testCutout() {
   hull() {
      translate([-xDim/2+cRad+50,-yDim/2+cRad+20,-0.1]) cylinder(r=cRad,h=botThickBack+0.2);
      translate([-xDim/2+cRad+50,yDim/2-cRad-20,-0.1]) cylinder(r=cRad,h=botThickBack+0.2);
      translate([xDim/2-cRad-20,-yDim/2+cRad+20,-0.1]) cylinder(r=cRad,h=botThickBack+0.2);
      translate([xDim/2-cRad-20,yDim/2-cRad-20,-0.1]) cylinder(r=cRad,h=botThickBack+0.2);
   }
}

module bot() {
   difference() {
      hull() {
         translate([-xDim/2+cRad,-yDim/2+cRad+2,0]) cylinder(r=cRad,h=botThickFront);
         translate([-xDim/2+cRad,yDim/2-cRad-2,0]) cylinder(r=cRad,h=botThickBack);
         translate([xDim/2-cRad,-yDim/2+cRad+2,0]) cylinder(r=cRad,h=botThickFront);
         translate([xDim/2-cRad,yDim/2-cRad-2,0]) cylinder(r=cRad,h=botThickBack);
      }

      /* clean out a little extra space for controller, reset, and power switch */
      translate([10-xDim/2,45-yDim/2,0.9]) cube([43,22,5]);
      translate([10-xDim/2,35-yDim/2,0.9]) cube([7,10.1,5]);
      switch();
   }
}



module midExt() {
   difference() {
      form();
      interior();
      cutouts();
      screwHoles();
   }
}


module form() {
   hull() {
      translate([-xDim/2+cRad,-yDim/2+cRad,0]) cylinder(r=cRad,h=zDimMax);
      translate([-xDim/2+cRad,yDim/2-cRad,0]) cylinder(r=cRad,h=zDimMax);
      translate([xDim/2-cRad,-yDim/2+cRad,0]) cylinder(r=cRad,h=zDimMax);
      translate([xDim/2-cRad,yDim/2-cRad,0]) cylinder(r=cRad,h=zDimMax);
   }
}

module interior() {
   hull() {
      translate([-xIntDim/2+cIntRad,yIntDim/2-cIntRad,zIntOff]) cylinder(r=cIntRad,h=zDimMax);
      translate([xIntDim/2-cIntRad,-yIntDim/2+cIntRad,zIntOff]) cylinder(r=cIntRad,h=zDimMax);
      translate([-xIntDim/2+cIntRad,-yIntDim/2+cIntRad,zIntOff]) cylinder(r=cIntRad,h=zDimMax);
      translate([xIntDim/2-cIntRad,yIntDim/2-cIntRad,zIntOff]) cylinder(r=cIntRad,h=zDimMax);
   }
}

module cutouts() {
   translate([-xDim/2-0.01,3.92,zIntOff]) translate([0,0,zDimMax-12]) cube([10,12.1,12]); // USB
   translate([-xDim/2-0.01,-8.6,zIntOff]) translate([0,0,zDimMax-11]) cube([10,7,11]); // reset
   switch();
}

module switch() {
   translate([-xDim/2+15,yDim/2-19.9,3]) {
      translate([1,0,1]) cube([14,15.1,10.0]);
      translate([0,15,0]) cube([16,5,12]);
   }
}

module screwHoles() {
   translate([126.87,-41.168,0]) cylinder(d=insertDim,h=25);
   translate([127.82,0.000497,0]) cylinder(d=insertDim,h=25);
   translate([-127.82,0.000497,0]) cylinder(d=insertDim,h=25);
   translate([126.87,41.132,0]) cylinder(d=insertDim,h=25);
   translate([42.278,42.155,0]) cylinder(d=insertDim,h=25);
   translate([42.278,-42.121,0]) cylinder(d=insertDim,h=25);
   translate([-42.314,42.155,0]) cylinder(d=insertDim,h=25);
   translate([-42.314,-42.121,0]) cylinder(d=insertDim,h=25);
   translate([-126.87,-41.168,0]) cylinder(d=insertDim,h=25);
   translate([-126.87,41.132,0]) cylinder(d=insertDim,h=25);
}

module altBot() {
linear_extrude(height=botThick) projection(cut=true) translate([0,yDim/2,-botThick]) rotate([angle,0,0]) translate([0,-yDim/2,0]) form();
}

