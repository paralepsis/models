$fn=40;
xExtrusionDepthSections = 1;
xExtrusionLength = 70;
yExtrusionWidthSections = 2;
yExtrusionDepthSections = 1;
yExtrusionLength = 70;
zExtrusionWidthSections = 1;
zExtrusionDepthSections = 1;
zExtrusionLength = 40;
tolerance=0.55;
lengthHoleSpacing=30;
wallWidth=5;
vslotIndentHeight=1;
sectionWidth=20;

/* V0 */
% difference() {
   hull() {
      scale([0.85,1,1]) cylinder(d=20,h=34.5);
      translate([38.3+2,0,0]) scale([1,1,1]) cylinder(d=12.5,h=34.5);
   }

   /* all the stuff to remove */

   M4slot();
   translate([38.3,0,0]) M4slot();

   translate([5.5,10.5,14.5]) rotate([90,0,0]) linear_extrude(height=21)
      VSlot2dProfile(
         sectionCountWidth=zExtrusionWidthSections, 
         sectionCountDepth=zExtrusionDepthSections,
         indentHeight=vslotIndentHeight,
         tolerance=tolerance
      );
   translate([10+5.5,0,-0.1]) union() {
      cylinder(h=30, d=5.2);
      cylinder(h=15.225-4.8+0.1, d=9);
   }
}

difference() {
   hull() {
      scale([0.85,1,1]) cylinder(d=20,h=30.5);
      translate([38.3+2.5,0,0]) scale([1,1,1]) cylinder(d=14.5,h=30.5);
   }

   /* all the stuff to remove */

   M4slot();
   translate([38.3,0,0]) M4slot();

   translate([6.0,10.5,10.5]) rotate([90,0,0]) linear_extrude(height=21)
      VSlot2dProfile(
         sectionCountWidth=zExtrusionWidthSections, 
         sectionCountDepth=zExtrusionDepthSections,
         indentHeight=vslotIndentHeight,
         tolerance=tolerance
      );

   /* M5 */
   translate([10+5.5,0,0]) union() {
      translate([0,0,15.225-4.8-4+.2]) cylinder(h=30, d=5.2);
      translate([0,0,-0.1]) cylinder(h=15.225-4.8+0.1-4, d=9.2);
   }
}



module M4slot() {
   translate([0,0,-0.1]) {
      hull() {
         translate([0,0,0]) {
            translate([0,0,5.4]) cylinder(d=4.2,h=25.9);
         }
         translate([2.5,0,0]) {
            translate([0,0,5.4]) cylinder(d=4.2,h=25.9);
         }
      }
      hull() {
         translate([0,0,0]) {
            cylinder(d=9.2,h=5.2);
         }
         translate([2.5,0,0]) {
            cylinder(d=9.2,h=5.2);
         }
      }
   }
}

module extrusionIndent(_indentWidthInside, _indentWidthOutside, _indentHeight) {
    polygon(points=[
            [0,0], 
            [(_indentWidthOutside-_indentWidthInside)/2, _indentHeight], 
            [_indentWidthInside + (_indentWidthOutside-_indentWidthInside)/2, _indentHeight],
            [_indentWidthOutside, 0]
        ]);
};

module VSlot2dProfile(
    extrusionLength = 50,
    sectionWidth = 20,
    indentWidthOutside = 9,
    indentWidthInside = 7,
    indentHeight = 1,
    sectionCountWidth = 3,
    sectionCountDepth = 1,
    topIndent = false,
    bottomIndent = true,
    leftIndent = false,
    rightIndent = false,
    tolerance = 0.8
)
{
    translate([-tolerance/2,-tolerance/2,0]) difference() {
        
            square(
                size=[
                    sectionWidth*sectionCountWidth+tolerance, 
                    sectionWidth*sectionCountDepth+tolerance
                ]
            );
        for(i = [0:sectionCountWidth]) {
            // bottom indents
            if (bottomIndent) 
                translate([i * sectionWidth + (sectionWidth-indentWidthOutside)/2, 0, 0])
                extrusionIndent(indentWidthInside,indentWidthOutside,indentHeight);
            
            // top indents
            if (topIndent)
                translate([
                    i * sectionWidth + (sectionWidth-indentWidthOutside)/2, 
                    sectionWidth*sectionCountDepth+tolerance, 
                    0
                ])
                rotate([180,0,0])
                extrusionIndent(indentWidthInside,indentWidthOutside,indentHeight);
        }
        for(i = [0:sectionCountDepth]) {
            // left side indent
            if (leftIndent)
                translate([0, (i+1) * sectionWidth - (sectionWidth-indentWidthOutside)/2, 0])
                rotate([0,0,-90]) 
                extrusionIndent(indentWidthInside,indentWidthOutside,indentHeight);
            
            // right side inden
            if (rightIndent)
                translate([
                    sectionWidth*sectionCountWidth + tolerance, 
                    i * sectionWidth + (sectionWidth-indentWidthOutside)/2, 
                    0
                ])
                rotate([0,0,90]) 
                extrusionIndent(indentWidthInside,indentWidthOutside,indentHeight);
        }
    }
};

