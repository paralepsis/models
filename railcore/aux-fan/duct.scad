use <BOSL2/std.scad>


$fn=40;

// Built for 120x32mm blower fan

inlet_od = [56.5, 28.5];
inlet_id = [54, 26];
split_gap = 2;

csection = inlet_id[0] * inlet_id[1];
wide_id  = [csection/5, 5];


module cuts() {
    up(0) square(inlet_id);
    up(5) square(inlet_id);
    up(10) rsquare(r=1,d=inlet_id);
    up(15) rsquare(r=2,d=inlet_id);

    for (i=[1:9]) {
        up (15+5*i) round2d(2) square([csection/(inlet_id[1]-2*i), inlet_id[1]-2*i]);
    }
}

// cuts();
