difference() {
   import("/Users/rross/git/models/misc/fairy-door/orig/door.stl");

   for (i=[0:5]) {
      translate([-28 + 10*i,-38,2.1]) rotate([0,45,0]) cube([1,78,1]);
   }
}

/* fill in behind window, etc. */
linear_extrude(height=0.6) hull() projection()
   import("/Users/rross/git/models/misc/fairy-door/orig/door.stl");


