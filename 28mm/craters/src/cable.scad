module nodule() {
    hull() rotate_extrude($fn=20) translate([1,0,0]) circle(r=1, $fn=20);
}

scale([1.05,1,1]) difference() {
    union() {
        rotate_extrude($fn=100) translate([20,0,0]) circle(r=1.5,$fn=20);
        for ($i=[0:50]) {
            rotate([0,0,$i * 5]) translate([20,0,0]) rotate([90,0,0]) nodule();
        }
    }

    translate([-25,-50,-10]) cube([50,50,20]);
}
