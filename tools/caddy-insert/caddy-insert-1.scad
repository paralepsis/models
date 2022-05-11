wid=101.6*2;
dep=95.25;
ht =152.4;
thk=2.52;

$fn=40;

linear_extrude(height=thk) hull() {
   translate([-wid/2+2,-dep/2+2,0]) circle(d=4);
   translate([wid/2-2,-dep/2+2,0]) circle(d=4);
   translate([-wid/2+2,dep/2-2,0]) circle(d=4);
   translate([wid/2-2,dep/2-2,0]) circle(d=4);
}

translate([wid/2-25.4-thk/2,-dep/2,0]) cube([2.52,dep,ht]);
translate([-wid/2+25.4+thk/2,-dep/2,0]) cube([2.52,dep,ht]);
translate([-thk/2,-dep/2,0]) cube([2.52,dep,ht]);

translate([-wid/2+25.4+thk/2,-dep/2,0]) cube([wid-2*25.4,thk,ht]);
translate([-wid/2+25.4+thk/2,dep/2-thk,0]) cube([wid-2*25.4,thk,ht]);
translate([-wid/2+25.4+thk/2,-thk/2,0]) cube([wid-2*25.4,thk,ht]);

translate([0,dep/4-thk/2,0]) cube([wid/2-25.4,thk,ht]);
translate([0,-dep/4-thk/2,0]) cube([wid/2-25.4,thk,ht]);

for (i=[1:3]) {
   translate([-wid/2,-(dep-10)/7 * i,0]) cube([25.4+thk/2,2.52,ht]);
   translate([-wid/2,+(dep-10)/7 * i-thk,0]) cube([25.4+thk/2,2.52,ht]);
}

translate([-wid/2,-dep/2+11,0]) cube([2.52,dep-22,ht]);
