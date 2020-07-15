/* dimensions: 25mm x 3mm
 * slot: 20mm x 2.5mm wide x 2mm deep
 */

$fn=80;

difference() {
   cylinder(d=25,h=3);
   translate([0,0,-0.01]) cylinder(d=25-4.8,h=1.2);
   translate([-10,0,-0.01]) cube([20,2.5,5]);
}

difference() {
   translate([-10.5,-2.4,0.0]) cube([21,2.5+4.8,3]);
   translate([-10,0,-0.01]) cube([20,2.5,5]);
}
