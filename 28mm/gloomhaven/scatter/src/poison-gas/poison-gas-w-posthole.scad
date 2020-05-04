botPostDia = 3.1;
botPostHt  = 4;
postDia = 5.20; // including space
postHt  = 40;

difference() {
   translate([-1.5,-2.5,0]) form();
   postHole();
}

module form() {
   import("./files/Poison_Gas_Trap.stl");
}

module postHole() {
   translate([0,0,1.6])
      cylinder($fn=40, d=botPostDia, h=botPostHt);
   translate([0,0,1.6+botPostHt-0.01])
      cylinder($fn=40, d=postDia, h=postHt-botPostHt);

   // translate([0,-0.5,1.6]) cube([botPostDia/2+2, 1, 5]);
   // rotate([0,0,120]) translate([0,-0.5,1.6]) cube([botPostDia/2+2, 1, 5]);
   // rotate([0,0,240]) translate([0,-0.5,1.6]) cube([botPostDia/2+2, 1, 5]);
}
