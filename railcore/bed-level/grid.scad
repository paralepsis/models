$fn=80;

/* magnet locations (I think!) */
for (i=[40:125:290]) {
   for (j=[40:115:290]) {
      translate([i,j,0]) color("red") cylinder(d=35,h=0.1);
   }
}

/* original bed.g points */
// translate([15,45]) color("green") cylinder(d=2,h=2);
// translate([15,275]) color("green") cylinder(d=2,h=2);
// translate([275,275]) color("green") cylinder(d=2,h=2);
// translate([275,45]) color("green") cylinder(d=2,h=2);

/* revised bed.g points */
translate([10,65]) color("green") cylinder(d=3,h=2);
translate([10,297]) color("green") cylinder(d=3,h=2);
translate([265,297]) color("green") cylinder(d=3,h=2);
translate([265,65]) color("green") cylinder(d=3,h=2);

/* mesh probe points
 * 
 * Notes:
 * - X range is [0:295]
 * - Y range is [35:303]
 */
/* Originals from macro */
X0 = [10:30:280];
Y0 = [50:30:280];

/* My first real try */
X1 = [10:50:260];
Y1 = [50:25:303];

/* Conservative */
X2 = [21:42:278]; // was 23:280
Y2 = [50:30:280];

/* Conservative */
X3 = [18:42:275];
Y3 = [57:39:291];

for (i=X3) {
   for (j=Y3) {
      translate([i,j,0.1]) color("blue") cylinder(d=2,h=3);
   }
}

