x=130;
y=90;
n=2;

difference() {
   translate([-x/2,-y/2,0]) cube([x,y,0.3]);
   translate([-(x-2*n*0.4)/2,-(y-2*n*0.4)/2,-0.05])
      cube([x-2*n*0.4,y-2*n*0.4,0.4]);
}
