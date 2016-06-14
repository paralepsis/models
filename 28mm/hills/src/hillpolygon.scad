module hillFromPolygon(height = 23, angle = 30, convexity = 5) {
   $fn = 100;

   // estRadius calculates an estimated radius for the hill assuming that I've filled most of the
   // depth of the build plate (Y dimension) with the polygon. This is then used to scale the roof of
   // the polyhedral.
   estRadius = 0.95 * 150 / 2;
   inset = height * tan(angle);
   scaleFactor = (estRadius - inset) / estRadius;

   linear_extrude(height = height, convexity = convexity, scale=scaleFactor) child(0);
}
