$fn=100;

// import("./Oculus_Quest_2_Pistol_Grip_L.stl");
% base(rad=40,loc=[-12,-10,0]);
base(rad=42,loc=[-14,-7,0]);

module base(rad=40,loc=[0,0,0]) {
   difference() {
      minkowski() {
         translate(loc) scale([1,0.63,1]) cylinder(h=8,r=rad);
         sphere(r=1.5);
      }
      translate([-100,-100,-10]) cube([200,200,10]);
   }
}
