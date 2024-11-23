// Target internal dimensions
len = 153;
wid = 112;
dep = 47;

// Target card space; would allow for sleeves I think
card_len = 93;
card_wid = 68;

include <./polyround.scad>

bottomPts = [[-len/2, -wid/2, 2], [len/2, -wid/2, 2], [len/2, wid/2, 2], [-len/2, wid/2, 2]];
cardPts   = [[-card_len/2, -card_wid/2, 2],
             [card_len/2, -card_wid/2, 2],
             [card_len/2, card_wid/2, 2],
             [-card_len/2, card_wid/2, 2]];

// linear_extrude(height=1.2) polygon(polyRound(bottomPts,10));

difference() {
   linear_extrude(height=dep) polygon(polyRound(bottomPts,10));

   translate([-40,7,1.2]) rotate([0,0,90]) linear_extrude(height=dep+2) polygon(polyRound(cardPts,10));
   translate([40,7,1.2]) rotate([0,0,90]) linear_extrude(height=dep+2) polygon(polyRound(cardPts,10));
   translate([-10,-34,dep-7]) cube([20,82,10]);
   translate([-10,-15,1.2]) cube([20,30,dep]);
   translate([-len,-47.5,dep]) rotate([0,90,0]) cylinder(r=6,h=2*len, $fn=40);
}


