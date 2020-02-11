% translate([-47,-198,0]) projection() import("./quick-water-hexes.stl");
// import("./water-outlines.svg");

include <water-outlines.scad>

minkowski() {
   water1(2);
   sphere(r=1);
}

