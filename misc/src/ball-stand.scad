ballRad=(30/12)*4.5 + 100;

$fn=400;

// % cube(size=[240, 153, 155], center=true);

// % color("white") translate([0,0,ballRad]) sphere($fn=40,r=ballRad);

difference() {
    cylinder(r1=ballRad*0.6, r2=ballRad*0.4, h = ballRad/4);
    translate([0,0,0.05]) cylinder(r2=ballRad*0.6 - 0.5, r1=ballRad*0.3 - 0.5, h = ballRad/4);
    translate([0,0,-0.05]) cylinder(r=ballRad*0.35, h=ballRad/5 + 0.1);
}

/*
 * Local variables:
 *  mode: C
 *  c-indent-level: 4
 *  c-basic-offset: 4
 * End:
 *
 * vim: ts=8 sts=4 sw=4 expandtab
 */

