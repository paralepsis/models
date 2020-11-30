use <scad-utils/transformations.scad>
use <scad-utils/shapes.scad>
use <skin.scad>

fn=20;
$fn=60;

r1 = 166/2;
r2 = 97/2;
R = 85;
th = 3.2;

module tube()
{
    difference()
    {
        skin([for(i=[0:fn]) 
              transform(rotation([0,90/fn*i,0])*translation([-R,0,0]), 
                        circle(r1-(r1-r2)/fn*i))]);
        assign(r1 = r1-th, r2 = r2-th)
        skin([for(i=[0:fn]) 
              transform(rotation([0,90/fn*i,0])*translation([-R,0,0]), 
                        circle(r1-(r1-r2)/fn*i))]);
    }
}

translate([0,0,3]) tube();
translate([0,0,3]) outlet();
plate();

module plate()
{
    translate([-R,0,0]) difference() {
        hull() {
            y=90;
            x=110;
            d=30;
            translate([-x+d/2,-y+d/2,0]) cylinder(d=d,h=3);
            translate([x-d/2,-y+d/2,0]) cylinder(d=d,h=3);
            translate([-x+d/2,y-d/2,0]) cylinder(d=d,h=3);
            translate([x-d/2,y-d/2,0]) cylinder(d=d,h=3);
        }
        translate([0,0,-0.1]) cylinder(d=162,h=3.2);
    }
}

module outlet()
{
    rotate([0,90,0]) translate([-R,0,0]) difference() {
        cylinder(d=97,h=20);
        translate([0,0,-0.1]) cylinder(d=93,h=20.2);
    }
}


