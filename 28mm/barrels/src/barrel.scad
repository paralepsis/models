
/* barrel()
 * - extend - if "1", extends cylinder downward to connect with terrain.
 */
module barrel(mm=35,extend=0) {
        assign(relscale = mm / 30) // relative to 30mm
        {
        color("grey") {
                translate([0,0,(7.15 - extend) * relscale])
                cylinder($fa=5,$fs=.1,
                                h = (14.3 + 2 * extend) * relscale,
                                r1 = 5 * relscale,
                                r2 = 5 * relscale,
                                center = true);

                // circular cap
                //
                translate([2.2 * relscale,0,14.1 * relscale])
                cylinder($fs=.3,h=1 * relscale,
                                r1=1.2 * relscale,
                                r2=1.2 * relscale,
                                center = true);

                translate([0,0,14.3 * relscale])
                torus(5.3 * relscale, 1 * relscale);

                translate([0,0,14.3 * .65 * relscale])
                torus(5.3 * relscale, 1 * relscale);

                translate([0,0,14.3 * .35 * relscale])
                torus(5.3 * relscale, 1 * relscale);

                torus(5.3 * relscale, 1 * relscale);
        }
        }
}

module torus(radius, height) {
        rotate_extrude($fa=5,$fs=.3,convexity = 10)
        translate([radius - height/2, 0, 0])
        circle($fs=.3,r = height/2);
}

