$fn=30;

realHt=25.4;
xyScaleFactor = (3*25.4)/57;

echo(xyScaleFactor);

/* build */
scale([xyScaleFactor,xyScaleFactor,1]) {
   translate([0,0,-8]) bottom();
   top();
   translate([0,0,8]) button();
}

module bottom() {
   difference() {
      hull() {
         cylinder(r=2,h=realHt);
         translate([57-4,0,0]) cylinder(r=2,h=realHt);
         translate([57-4,20-4,0]) cylinder(r=2,h=realHt);
         translate([0,20-4,0]) cylinder(r=2,h=realHt);
      }
      translate([0,0,realHt-2.0]) cube([53,16,2.05]);
      translate([1,1,1]) cube([51,14,realHt-0.9]);
      translate([37.5+13/2, 13/2+1, 1]) cylinder($fn=60,r=15/2, h=realHt-1);
   }
}

module top() {
   translate([0.25,0.25,realHt-2.0]) difference() {
      union() {
         cube([53-0.5,16-0.5,2.00]);
         translate([37.5+13/2, 13/2+1.0, -3]) cylinder($fn=60,r=14.5/2, h=5);
      }
   
      /* button hole */
      translate([37.5+13/2, 13/2+1.0, 0]) cylinder($fn=60,r=13/2, h=3.0);
      translate([37.5+13/2, 13/2+1.0, -3.1]) cylinder($fn=60,r=11/2, h=5);

      /* speaker holes */
      for (i=[0:3]) {
         for (j=[0:3]) {
            translate([2.5+2*i,2+1.8*j,-0.1]) cylinder(r=0.60,h=5);
         }
      }
   }
}

module button() {
   translate([0.25,0.25,realHt-3]) {
      translate([37.5+13/2, 13/2+1.0, 0])
         cylinder($fn=60,r=13/2-0.1, h=3.0);
      translate([37.5+13/2, 13/2+1.0, -3.0])
         cylinder($fn=60,r=11/2-0.1, h=5);
   }
}
