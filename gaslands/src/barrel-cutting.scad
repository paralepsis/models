cutLine = 5.8;

% import("./gaslands-dungeonsticks-85perc-barrel.stl");

bottomCut();

module topCut() {
   translate([0,0,-0.2]) cylinder(r=15,h=cutLine+0.2);
   translate([0,0,cutLine-0.01]) cylinder($fn=30, r1=3.3, r2=3.2,h=2.51);
   translate([0,0,cutLine-0.01+2.5]) cylinder($fn=30, r1=3.2, r2=1,h=2.5);
}

module bottomCut() {
   translate([0,0,cutLine-0.4]) cylinder($fn=50,r=6.5,h=13);
   translate([0,0,cutLine-0.4-2.2]) cylinder($fn=30,r1=3.2,r2=3.3,h=2.21);
}
