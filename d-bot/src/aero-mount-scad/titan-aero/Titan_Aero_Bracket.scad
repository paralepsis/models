//Designed by techyg on Thingiverse, for the Reach3d Printer gantry.
//This design can be adapted for your own purposes. Please post a remix if you do!
//http://www.thingiverse.com/thing:2314348/

plate_thickness=3.75;
motor_holder_thickness=2;
gantry_hole=5.2;
motor_hole=3.6;
motor_cutout=24;

module gantry_mount_holes()
{

    translate([24,23,0])
    cylinder(r=gantry_hole/2, h=plate_thickness+5, $fn=100, center=true);
 
    translate([-16,23,0])
    cylinder(r=gantry_hole/2, h=plate_thickness+5, $fn=100, center=true);

    translate([24,-23,0])
    cylinder(r=gantry_hole/2, h=plate_thickness+5, $fn=100, center=true);
    
    translate([-16,-23,0])
    cylinder(r=gantry_hole/2, h=plate_thickness+5, $fn=100, center=true);

//Add some play for bottom holes
    
    translate([24.5,-23,0])
    cylinder(r=gantry_hole/2, h=plate_thickness+5, $fn=100, center=true);

    translate([24.5,23,0])
    cylinder(r=gantry_hole/2, h=plate_thickness+5, $fn=100, center=true);
 
              
}

module main_plate()
{
    
    rotate([0,0,90])
    translate([-12,25,3])
    linear_extrude(1.5)
    text("Titan Aero",  size=6);
    minkowski() //rounds the plate edges
    {
        $fn=50;
        cube([67.5,56,plate_thickness], center=true);
        cylinder(r=2,h=1);
    }   

}

module gear_cutout()
{
     rotate([90,0,0])
     translate([-5,8,8])
     cylinder(r=30/2,h=6.5, $fn=100, center=true);  
}

module gantry_top_cutout()
{ 
    translate([-25.5,0,-2.5])
    linear_extrude(4)
    square([6.5,20], center=true);
}

module motor_holder_supports()
{
     triangle_points =[[0,0],[48,2],[0,14]];
     triangle_paths =[[0,1,2]];
     linear_extrude(2)
     polygon(triangle_points,triangle_paths,10);    
}
module motor_holder()
{
    translate([0,4,0])
    linear_extrude(motor_holder_thickness)
    square([47.5,55], center=true);

    translate([21.75,-24,0])
    rotate([90,0,90])
    motor_holder_supports();
    
    translate([-23.75,-24,0])
    rotate([90,0,90])
    motor_holder_supports();
}

module motor_mount_holes()
{
    translate([15.5,15.5,0])
    cylinder(r=motor_hole/2, h=plate_thickness+5, $fn=100, center=true);
 
    translate([-15.5,15.5,0])
    cylinder(r=motor_hole/2, h=plate_thickness+5, $fn=100, center=true);

    translate([15.5,-15.5,0])
    cylinder(r=motor_hole/2, h=plate_thickness+5, $fn=100, center=true);
 
    translate([-15.5,-15.5,0])
    cylinder(r=motor_hole/2, h=plate_thickness+5, $fn=100, center=true);

    cylinder(r=motor_cutout/2, h=plate_thickness+5, $fn=100, center=true);
            
}

//Main assembly of components

    difference()
    {
        main_plate();
        gear_cutout();
        translate([-2,0,0])
        gantry_mount_holes();
        translate([-2,0,0])
        gantry_top_cutout();
    }

    rotate([90,0,0])
    translate([11,22+plate_thickness-1,15.5])
    difference()
    {
        motor_holder();
        translate([0,10,0])  
        motor_mount_holes();
    }

