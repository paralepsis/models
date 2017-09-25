boltHoleDia = 3.2;

c0 = [3,3,0];
c1 = [3,327-3-3.2,0];
c2 = [327-3-3.2,327-3-3.2,0];
c3 = [327-3-3.2,3,0];

s0 = [3 + 327/2,3,0];
s1 = [3 + 327/2,327-3-3.2,0];
s2 = [327-3-3.2,3+327/2,0];
s3 = [3,3+327/2,0];

// color("gray") bed();
translate([0,0,-3]) corner0();

module corner0($fn=30,cHeight=3) {
   p0 = [3+50,3,0]; /* point along short side */

   difference() {
      union() {
         /* main structure */
         hull() {
            translate(c0) cylinder(r=10,h=cHeight);
            translate(p0) cylinder(r=10,h=cHeight);
         }
         hull() {
            translate(c0) cylinder(r=10,h=cHeight);
            translate(s3) cylinder(r=10,h=cHeight);
         }
         hull() {
            translate(p0) cylinder(r=10,h=cHeight);
            translate(s3) cylinder(r=10,h=cHeight);
         }
      }

      /* bits to difference out */
      translate([0,0,-0.5]) {
         translate(c0) cylinder(h=cHeight+1,d=boltHoleDia);
         translate(s3) cylinder(h=cHeight+1,d=boltHoleDia);
      }
   }
}

module bed($fn=30) {
   difference() {
      cube([327,327,3]);

      translate([3.2/2,3.2/2,-0.5]) {
         /* corners */
         translate(c0) cylinder(h=5,d=boltHoleDia);
         translate(c1) cylinder(h=5,d=boltHoleDia);
         translate(c2) cylinder(h=5,d=boltHoleDia);
         translate(c3) cylinder(h=5,d=boltHoleDia);

         /* sides */
         translate(s0) cylinder(h=5,d=boltHoleDia);
         translate(s1) cylinder(h=5,d=boltHoleDia);
         translate(s2) cylinder(h=5,d=boltHoleDia);
         translate(s3) cylinder(h=5,d=boltHoleDia);
      }
   }
}
