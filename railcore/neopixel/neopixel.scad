
difference() {
  translate([0,5,0]) rotate ([90,0,0])
    linear_extrude(height=10) polygon([[0,0], [17,0], [17,8.5], [3,8.5], [0,5.5]]);
  translate([10.6,0,4]) rotate([0,90,0]) cylinder(d=4.9,h=6.5,$fn=20);

  translate([3,0,-1]) cylinder(d=2.8,h=12,$fn=20);
  translate([3,0,7]) cylinder(d=4,h=4, $fn=30);
}

