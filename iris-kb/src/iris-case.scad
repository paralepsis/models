/* bintools.scad
 *
 * Copyright (C) Robert B. Ross, 2016
 *
 * This software is released under the Creative Commons
 * Attribution-ShareAlike 4.0 International Public License.
 */

/* NOTES:
 * - first cut at 1.01 scale in X and Y was a little loose.
 *   - going to try 1.005 next
 *   - was a little tight, moved to 1.007
 * - height of 5mm was nearly perfect for reaching top of bottom plate when
 *   feet are attached (surface guard 13mm vinyl bumbers round)
 *   - going to try 6mm next
 */

$fn=60;

yAngle = 5;
xAngle = 7;

difference() {
   union() {
      linear_extrude(height=30) outline(outlineScale=2) projection(cut=false)
         rotate([xAngle, -1*yAngle, 0]) blankOutline(height=6, outlineScale=2) 
         scale([1.007, 1.007, 1.0]) bottomOutline(h=7);
   }
   translate([0,0,10]) rotate([xAngle, -1*yAngle, 0])
      scale([1.007, 1.007, 1.0]) bottomOutline(h=30);

   rotate([xAngle, -1*yAngle, 0]) translate([-100,-100,16]) cube([200,200,50]);

   hull() {
      translate([-40,0,-0.5]) cylinder(r=10, h=50);
      translate([10,0,-0.5]) cylinder(r=10, h=50);
      translate([-40,25,-0.5]) cylinder(r=10, h=50);
      translate([10,25,-0.5]) cylinder(r=10, h=50);
   }
}


module solidBottomBox(xDim=10, yDim=10, ht=10, inset=0,filled=0,
                      locations=[],outlineScale=1.2,cornerRad=3.75,
                      bottomThick=1.2,wallThick=1.6)
{
   offsetFromTop = 0.1; /* amount of space to move the outline from the top of the form; helps keep model clean */

   /* flip right-side up and place on XY plane */
   translate([0,0,ht]) rotate([180,0,0]) {
      /* parallel-sided box, complete bottom */
      /* Note: because of the way we're building it, the "top" is the bottom
       *       from the roundShapedBox perspective.
       */
      roundShapedBox(xDimTop=xDim - inset, yDimTop=yDim - inset,
                     xDimBottom=xDim, yDimBottom=yDim,
                     ht=ht, wallThick=wallThick, cornerRad=cornerRad);
      translate([0,0,ht-bottomThick]) roundBoxBottom(xDim=xDim-inset,yDim=yDim-inset,
                                             ht=bottomThick, cornerRad=cornerRad);

      /* spaces to hold ships */
      difference() {
         union() {
            /* base form */
            if (filled) {
               fillHtDiff = 2; // difference between top of box and top of fill

               /* Note: just fill with the same shape for the filled version */
               hull() translate([0,0,bottomThick-0.1+fillHtDiff]) roundShapedBox(xDimTop=xDim - inset, yDimTop=yDim - inset,
                                     xDimBottom=xDim, yDimBottom=yDim,
                                     ht=ht-bottomThick+0.1-fillHtDiff, wallThick=1.6, cornerRad=cornerRad);
            }
            for (loc = locations) {
                   translate([0,0,offsetFromTop]) translate(loc[0]) rotate(loc[1])
                      blankOutline(height=ht-offsetFromTop, outlineScale=outlineScale) children();
            }
         }
         union() {
            /* what will be differenced out */
            for (loc = locations) {
                translate(loc[0]) rotate(loc[1]) children();
            }
         }
      }
   }
}


/* blankCutout() - extrudes an outline of children() to a given height
 *                 and then difference()s out the children(), leaving
 *                 only the outline.
 */
module blankCutout(height=48.6, epsilon=0.1, outlineScale=1.4) {
   difference() {
      translate([0,0,epsilon]) linear_extrude(height=height-epsilon)
         outline(outlineScale=outlineScale) projection(cut=false) children();
      children();
   }
}

/* blankOutline() - extrudes an outline (enclosing form) of children()
 *                  to a given height.
 *
 * Notes: Intended to allow for taking a form (the "blank") and create a
 *        supporting shape around it.
 */
module blankOutline(height=48.6) {
   linear_extrude(height=height) outline() projection(cut=false) children();
}


/* outline() - generates an outline of an object
 *
 * Note: This is intended to be used on a 2D shape, such as one created
 *       using the projection() operator.
 */
module outline(outlineIterations = 60,outlineScale=1.4) {
   for (i=[0:outlineIterations]) {
      translate([outlineScale*cos(360*i/outlineIterations),
                 outlineScale*sin(360*i/outlineIterations),0]) children();
   }
}

// Module names are of the form poly_<inkscape-path-id>().  As a result,
// you can associate a polygon in this OpenSCAD program with the corresponding
// SVG element in the Inkscape document by looking for the XML element with
// the attribute id="inkscape-path-id".

// fudge value is used to ensure that subtracted solids are a tad taller
// in the z dimension than the polygon being subtracted from.  This helps
// keep the resulting .stl file manifold.
fudge = 0.1;

module bottomShape() {
   difference() {
      poly_path3414(1); // main form
      translate([0,0,-0.1]) scale ([1,1,1.5]) poly_path3398(1); // hole (top left)
      translate([0,0,-0.1]) scale ([1,1,1.5]) poly_path3402(1); // hole (top right)
   // poly_path3418(1); // main form (again?)
      translate([0,0,-0.1]) scale ([1,1,1.5]) poly_path3394(1); // hole (bottom right thumb)
      translate([0,0,-0.1]) scale ([1,1,1.5]) poly_path3410(1); // hole (bottom left)
      translate([0,0,-0.1]) scale ([1,1,1.5]) poly_path3406(1); // hole (bottom right)
   }
}

module bottomOutline(h) {
   poly_path3414(h=h); // main form
}

module poly_path3398(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-179.249875,-107.272625],[-177.732805,-106.966336],[-176.493937,-106.131062],[-175.658664,-104.892195],[-175.352375,-103.375125],[-175.658664,-101.858055],[-176.493937,-100.619187],[-177.732805,-99.783914],[-179.249875,-99.477625],[-180.766945,-99.783914],[-182.005812,-100.619187],[-182.841086,-101.858055],[-183.147375,-103.375125],[-182.841086,-104.892195],[-182.005812,-106.131062],[-180.766945,-106.966336],[-179.249875,-107.272625]]);
  }
}

module poly_path3402(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[90.750125,-119.897500],[92.267195,-119.591211],[93.506062,-118.755937],[94.341336,-117.517070],[94.647625,-116.000000],[94.341336,-114.482930],[93.506062,-113.244062],[92.267195,-112.408789],[90.750125,-112.102500],[89.233055,-112.408789],[87.994188,-113.244062],[87.158914,-114.482930],[86.852625,-116.000000],[87.158914,-117.517070],[87.994188,-118.755937],[89.233055,-119.591211],[90.750125,-119.897500]]);
  }
}

module poly_path3418(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[2.125125,-216.999875],[-18.874875,-214.874875],[-44.249875,-212.749875],[-69.499875,-210.624875],[-109.624875,-206.374875],[-149.624875,-200.124875],[-187.624875,-193.749875],[-246.624875,-178.999875],[-246.749875,-178.999875],[-248.124875,-178.874875],[-250.874875,-177.874875],[-252.999875,-176.124875],[-254.374875,-173.624875],[-254.874875,-170.749875],[-254.874875,99.125125],[-254.749875,100.625125],[-253.874875,103.250125],[-251.999875,105.500125],[-249.499875,106.875125],[-246.749875,107.375125],[-27.374875,107.375125],[-24.499875,107.875125],[-24.374875,107.875125],[-21.874875,109.375125],[-21.749875,109.375125],[-19.874875,111.625125],[-19.874875,111.750125],[-18.874875,114.500125],[-18.749875,114.625125],[-18.624875,116.000125],[-18.624875,158.250125],[-18.499875,159.625125],[-17.624875,162.375125],[-15.749875,164.500125],[-13.249875,165.875125],[-10.499875,166.375125],[31.625125,166.375125],[31.750125,166.375125],[67.625125,170.625125],[95.000125,177.000125],[124.625125,187.500125],[143.625125,198.125125],[173.125125,215.000125],[174.625125,215.875125],[178.125125,217.000125],[181.625125,216.750125],[185.000125,215.375125],[187.625125,212.875125],[253.500125,96.000125],[253.875125,95.375125],[254.875125,92.000125],[254.750125,88.375125],[253.375125,85.125125],[250.875125,82.500125],[223.500125,65.625125],[204.500125,53.000125],[189.750125,42.500125],[189.750125,42.375125],[181.250125,34.000125],[172.750125,23.375125],[168.500125,8.500125],[166.375125,-10.499875],[166.375125,-179.249875],[166.250125,-180.624875],[165.375125,-183.374875],[163.500125,-185.499875],[161.000125,-186.874875],[158.250125,-187.374875],[158.125125,-187.499875],[111.750125,-204.249875],[67.500125,-212.749875],[52.750125,-214.874875],[25.375125,-216.999875]]);
  }
}

module poly_path3394(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[149.750125,110.102500],[151.267195,110.408789],[152.506062,111.244063],[153.341336,112.482930],[153.647625,114.000000],[153.341336,115.517070],[152.506062,116.755938],[151.267195,117.591211],[149.750125,117.897500],[148.233055,117.591211],[146.994188,116.755938],[146.158914,115.517070],[145.852625,114.000000],[146.158914,112.482930],[146.994188,111.244063],[148.233055,110.408789],[149.750125,110.102500]]);
  }
}

module poly_path3410(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-179.249875,27.727500],[-177.732805,28.033789],[-176.493937,28.869063],[-175.658664,30.107930],[-175.352375,31.625000],[-175.658664,33.142070],[-176.493937,34.380938],[-177.732805,35.216211],[-179.249875,35.522500],[-180.766945,35.216211],[-182.005812,34.380938],[-182.841086,33.142070],[-183.147375,31.625000],[-182.841086,30.107930],[-182.005812,28.869063],[-180.766945,28.033789],[-179.249875,27.727500]]);
  }
}

module poly_path3406(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[90.750125,15.102500],[92.267195,15.408789],[93.506062,16.244063],[94.341336,17.482930],[94.647625,19.000000],[94.341336,20.517070],[93.506062,21.755938],[92.267195,22.591211],[90.750125,22.897500],[89.233055,22.591211],[87.994188,21.755938],[87.158914,20.517070],[86.852625,19.000000],[87.158914,17.482930],[87.994188,16.244063],[89.233055,15.408789],[90.750125,15.102500]]);
  }
}

module poly_path3414(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[178.000000,217.500000],[178.000000,217.500000],[174.500000,216.375000],[174.375000,216.375000],[172.875000,215.375000],[143.375000,198.500000],[124.375000,188.000000],[94.875000,177.500000],[67.500000,171.125000],[31.625000,167.000000],[-10.500000,167.000000],[-13.375000,166.500000],[-13.500000,166.375000],[-16.000000,164.875000],[-16.125000,164.875000],[-18.000000,162.625000],[-18.000000,162.500000],[-19.000000,159.750000],[-19.125000,159.750000],[-19.250000,158.250000],[-19.250000,116.125000],[-19.375000,114.625000],[-20.250000,112.000000],[-22.125000,109.750000],[-24.625000,108.375000],[-27.375000,107.875000],[-246.750000,107.875000],[-249.625000,107.375000],[-249.750000,107.375000],[-252.250000,105.875000],[-252.375000,105.875000],[-254.250000,103.625000],[-254.250000,103.500000],[-255.250000,100.750000],[-255.375000,100.750000],[-255.375000,100.625000],[-255.500000,99.250000],[-255.500000,99.125000],[-255.500000,-170.875000],[-255.000000,-173.750000],[-254.875000,-173.875000],[-253.500000,-176.375000],[-253.375000,-176.500000],[-251.125000,-178.375000],[-251.000000,-178.375000],[-248.250000,-179.375000],[-246.750000,-179.500000],[-187.750000,-194.250000],[-149.750000,-200.625000],[-109.750000,-207.000000],[-109.625000,-207.000000],[-69.625000,-211.125000],[-44.250000,-213.250000],[-19.000000,-215.375000],[2.125000,-217.500000],[25.375000,-217.500000],[52.750000,-215.375000],[52.875000,-215.375000],[67.625000,-213.250000],[111.875000,-204.875000],[158.375000,-188.000000],[161.125000,-187.500000],[161.250000,-187.375000],[163.750000,-186.000000],[163.875000,-185.875000],[165.750000,-183.625000],[165.750000,-183.500000],[166.750000,-180.750000],[166.875000,-180.750000],[167.000000,-179.250000],[167.000000,-10.500000],[169.000000,8.375000],[173.250000,23.125000],[181.625000,33.625000],[190.000000,42.000000],[204.750000,52.500000],[223.750000,65.250000],[251.250000,82.125000],[253.750000,84.750000],[253.750000,84.875000],[255.250000,88.250000],[255.250000,88.375000],[255.500000,92.000000],[255.500000,92.125000],[254.375000,95.625000],[254.000000,96.250000],[188.000000,213.250000],[185.250000,215.750000],[185.250000,215.875000],[181.875000,217.250000],[181.750000,217.250000],[178.125000,217.500000]]);
  }
}

/*
 * Local variables:
 *  mode: C
 *  c-indent-level: 3
 *  c-basic-offset: 3
 * End:
 *
 * vim: ts=8 sts=3 sw=3 expandtab
 */

