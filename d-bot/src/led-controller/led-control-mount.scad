use <bevel.scad>
use <attach.scad>

$fn=40;


if (1) mirror([1,0,0]) difference() {
   union() {
      linear_extrude(height=3.8+2.35) form();

      /* angled bit to fit in v-slot */
      translate([-4.5+35/2,-16,0]) rotate([-90,0,0]) {
         linear_extrude(height=90)
         polygon(points=[[-0.1,0],[0,0],[1,1],[8,1],[9,0],[9,-0.1]]);
      }
      translate([0,0,(3.8+2.35)/2]) {
         bevel(e1,n1,cr=1,cres=10,l=3.8+2.35);
         bevel(e4,n4,cr=1,cres=10,l=3.8+2.35);
         bevel(e7,n7,cr=1,cres=10,l=3.8+2.35);
         bevel(e10,n10,cr=1,cres=10,l=3.8+2.35);
      }
   }
   cuts();
}

function pt2d(pt3d) = [pt3d[0], pt3d[1]];
function pEdge(pt) = [pt, [0,0,1], 0];

/* form.
 * note: i'm not really using the Z height of connectors appropriately here
 */
pt0 = [0,5,0];
e0 = pEdge(pt0);
n0 = [pt0,[-1,-1,0],0];

pt1 = [35/2-10,5,0];
e1 = [pt1, [0,0,1], 0];
n1 = [pt1, [1,1,0], 0]; /* buttress */

pt2 = [35/2-10,-16,0];
e2 = [pt2, [0,0,1], 0];
n2 = [pt2, [-1,-1,0],0];

pt3 = [35/2+10,-16,0];
e3 = [pt3, [0,0,1], 0];
n3 = [pt3, [1,-1,0], 0];

pt4 = [35/2+10,-6,0];
e4 = [pt4, [0,0,1], 0];
n4 = [pt4, [-1,1,0], 0];  /* buttress */

pt5 = [35,-6,0];
e5 = [pt5, [0,0,1], 0];
n5 = [pt5, [1,-1,0], 0];

pt6 = [35,56,0];
e6 = pEdge(pt6);
n6 = [pt6, [1,1,0], 0];

pt7 = [35/2+10,56,0];
e7 = pEdge(pt7);
n7 = [pt7, [-1,-1,0], 0]; /* buttress */

pt8 = [35/2+10,74,0];
e8 = pEdge(pt8);
n8 = [pt8, [1,1,0], 0];

pt9 = [35/2-10,74,0];
e9 = pEdge(pt9);
n9 = [pt9, [-1,1,0], 0];

pt10 = [35/2-10,64,0];
e10 = pEdge(pt10);
n10 = [pt10, [1,-1,0], 0]; /* buttress */

pt11 = [0,64,0];
e11 = pEdge(pt11);
n11 = [pt11, [-1,1,0], 0];

module form() {
   if (0) {
      /* old version before conversion while I try to do bevels */
      polygon(points=[[0,5],[35/2-10,5],[35/2-10,-16],[35/2+10,-16],
                      [35/2+10,-6],[35,-6],[35,56],[35/2+10,56],
                      [35/2+10,74],[35/2-10,74], [35/2-10,64],[0,64]]);
   }
   polygon(points=[pt2d(pt0),
                   pt2d(pt1),
                   pt2d(pt2),
                   pt2d(pt3),
                   pt2d(pt4),
                   pt2d(pt5),
                   pt2d(pt6),
                   pt2d(pt7),
                   pt2d(pt8),
                   pt2d(pt9),
                   pt2d(pt10),
                   pt2d(pt11)]);
}

module cuts() {
   translate([0,0,-3]) {
      hull() {
         translate([6,58.5,0]) cylinder(h=10,d=3.2);
         translate([6,57.5,0]) cylinder(h=10,d=3.2);
      }
      hull() {
         translate([6,58.5,0]) cylinder($fn=6,h=5.05,d=6.2);
         translate([6,57.5,0]) cylinder($fn=6,h=5.05,d=6.2);
      }
      hull() {
         translate([35-6,-0.5,0]) cylinder(h=10,d=3.2);
         translate([35-6,0.5,0]) cylinder(h=10,d=3.2);
      }
      hull() {
         translate([35-6,-0.5,0]) cylinder($fn=6,h=5.05,d=6.2);
         translate([35-6,0.5,0]) cylinder($fn=6,h=5.05,d=6.2);
      }
      /* wonky -3 in the Z causes odd sizes here */
      translate([35/2,66,0]) cylinder(h=6.5,d=5.2);
      translate([35/2,66,6.8]) cylinder(h=10,d=9.4);
      translate([35/2,-8,0]) cylinder(h=6.5,d=5.2);
      translate([35/2,-8,6.8]) cylinder(h=10,d=9.4);

   }

   translate([0,0,1.9]) {
      bevel(e0,n0,cr=1,cres=10,l=10);
      bevel(e2,n2,cr=1,cres=10,l=10);
      bevel(e3,n3,cr=1,cres=10,l=10);
      bevel(e5,n5,cr=5,cres=10,l=10);
      bevel(e6,n6,cr=1,cres=10,l=10);
      bevel(e8,n8,cr=1,cres=10,l=10);
      bevel(e9,n9,cr=1,cres=10,l=10);
      bevel(e11,n11,cr=5,cres=10,l=10);
   }
}
