$fn=50;
outDia=25.5;
inDia = 3.5;
thick=1.8;

difference() {
   cylinder(h=thick, d=outDia);
   translate([0,0,-0.1]) cylinder(h=thick+ 0.2, d=inDia);
}
