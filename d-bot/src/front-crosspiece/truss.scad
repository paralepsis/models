$fn=80;

totLen = 271;

//Length
l=totLen-15;
//Width
w=30;
n=floor(l/w);

//Wall 
wall=12;
//Beam
beam=2.5;
//Horizontal bars
horizontal=1;//[0,1]
//Diagonal bars
diagonal=1;//[0,1]
// Connecting holes radius
holer=4;
// Connecting holes length
holesl=20;
// Connecting holes offset from corner: holer+x 
holeo=1;
w2=l/n;
h=wall;
s=beam;
echo(l,w,n,h,s);

translate([0,20,0]) cylinder($fn=80,d=25,h=0.6);
translate([0,-9,0]) cylinder($fn=80,d=25,h=0.6);
translate([271,-9,0]) cylinder($fn=80,d=25,h=0.6);
translate([271,20,0]) cylinder($fn=80,d=25,h=0.6);

difference() {
   union() {
      /* THE TRUSS */
      translate([7.5,5,0]) t();

      translate([0,-10,0]) cube([10,30,25]);
      translate([10,-10,8]) difference() {
        translate([-0.1,0,0]) cube([2.6,30,2.5]);
        translate([2.5,-0.5,2.5]) rotate([-90,0,0]) cylinder(d=5,h=31);
      }
      translate([totLen-10,-10,0]) cube([10,30,25]);
      translate([totLen-10,20,8]) rotate([0,0,180]) difference() {
        translate([-0.1,0,0]) cube([2.6,30,2.5]);
        translate([2.5,-0.5,2.5]) rotate([-90,0,0]) cylinder(d=5,h=31);
      }

      translate([totLen,4.5,0]) rotate([0,0,-90])
               linear_extrude(height=25)
               polygon(points=[[-0.1,0],[0,0],[1,1],[8,1],[9,0],[9,-0.1]]);
      translate([0,-4.5,0]) rotate([0,0,90])
               linear_extrude(height=25)
               polygon(points=[[-0.1,0],[0,0],[1,1],[8,1],[9,0],[9,-0.1]]);
   }

   /* bolt holes */
   translate([0,0,17.2]) rotate([90,0,-90]) {
      /* bolt holes */
      translate([0,0,-25+6.2]) cylinder(h=25,d=5.2);

      /* cap holes (with a little gap to allow bridging */
      translate([0,0,-15-4.2]) cylinder(h=15,d=9);
   }

   translate([totLen,0,17.2]) rotate([90,0,90]) {
      /* bolt holes */
      translate([0,0,-25+6.2]) cylinder(h=25,d=5.2);

      /* cap holes (with a little gap to allow bridging */
      translate([0,0,-15-4.2]) cylinder(h=15,d=9);
   }
}

module t(){
 linear_extrude(h,center=false){truss();}
}

function clamp(  b = 0, c = 1,a) = min(max(abs(a), b), c);
module truss(){


intersection(){
 translate([0,-w/2])square([l,w]);

offset(-s,$fn=20)
offset(s)
for(a=[-w2:w2:l+w2]){

if (horizontal==1)hull() {
translate([clamp(s,l-s,a),abs(a/w2)%(2)*w-w*0.5])circle(s);
translate([clamp(s,l-s,a),abs(b/w2)%(2)*w-w*0.5])circle(s);
}

b=a+w2;
if (diagonal==1)hull() {
translate([clamp(0,l,a),abs(a/w2)%(2)*w-w*0.5])circle(s);
translate([clamp(0,l,b),abs(b/w2)%(2)*w-w*0.5])circle(s);
}
c=b+w2;
hull() {
translate([a,abs(a/w2)%(2)*w-w*0.5])circle(s*2);
translate([c,abs(c/w2)%(2)*w-w*0.5])circle(s*2);
}
}
}}
