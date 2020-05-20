// import("./orig/laplace-mid.stl");

xDim    = 263.62;
yDim    = 92.14;
zDimMax = 15;
cRad    = 4;

angle   = 5;
botThick= 2;

xIntDim = xDim-16;
yIntDim = yDim-16;
zIntOff = 1.2;
cIntRad = 2;



$fn=20;

/* no angle */
if (0) difference() {
   form();
   interior();
   cutouts();
}

/* angled */
if (1) {
   difference() {
      translate([0,yDim/2,0]) rotate([angle,0,0]) translate([0,-yDim/2,0]) midExt();
      translate([-xDim/2-1,-yDim/2-1,-30]) cube([xDim+2,yDim+2,30]);
   }
   difference() {
      bot();
      if (1) testCutout();
   }
}

module testCutout() {
   hull() {
      translate([-xDim/2+cRad+50,-yDim/2+cRad+20,-0.1]) cylinder(r=cRad,h=botThick+0.2);
      translate([-xDim/2+cRad+50,yDim/2-cRad-20,-0.1]) cylinder(r=cRad,h=botThick+0.2);
      translate([xDim/2-cRad-20,-yDim/2+cRad+20,-0.1]) cylinder(r=cRad,h=botThick+0.2);
      translate([xDim/2-cRad-20,yDim/2-cRad-20,-0.1]) cylinder(r=cRad,h=botThick+0.2);
   }
}

module bot() {
   hull() {
      translate([-xDim/2+cRad,-yDim/2+cRad+2,0]) cylinder(r=cRad,h=botThick);
      translate([-xDim/2+cRad,yDim/2-cRad-2,0]) cylinder(r=cRad,h=botThick);
      translate([xDim/2-cRad,-yDim/2+cRad+2,0]) cylinder(r=cRad,h=botThick);
      translate([xDim/2-cRad,yDim/2-cRad-2,0]) cylinder(r=cRad,h=botThick);
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
   translate([-xDim/2-0.01,3.92,zIntOff]) cube([10,12.1,zDimMax]);
   translate([-xDim/2-0.01,-8.6,zIntOff]) cube([10,7,zDimMax]);
}

module screwHoles() {
   translate([126.87,-41.168,0]) cylinder(d=3.3,h=25);
   translate([127.82,0.000497,0]) cylinder(d=3.3,h=25);
   translate([-127.82,0.000497,0]) cylinder(d=3.3,h=25);
   translate([126.87,41.132,0]) cylinder(d=3.3,h=25);
   translate([42.278,42.155,0]) cylinder(d=3.3,h=25);
   translate([42.278,-42.121,0]) cylinder(d=3.3,h=25);
   translate([-42.314,42.155,0]) cylinder(d=3.3,h=25);
   translate([-42.314,-42.121,0]) cylinder(d=3.3,h=25);
   translate([-126.87,-41.168,0]) cylinder(d=3.3,h=25);
   translate([-126.87,41.132,0]) cylinder(d=3.3,h=25);
}

module altBot() {
linear_extrude(height=botThick) projection(cut=true) translate([0,yDim/2,-botThick]) rotate([angle,0,0]) translate([0,-yDim/2,0]) form();
}

