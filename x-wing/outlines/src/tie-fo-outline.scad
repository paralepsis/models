
// Module names are of the form poly_<inkscape-path-id>().  As a result,
// you can associate a polygon in this OpenSCAD program with the corresponding
// SVG element in the Inkscape document by looking for the XML element with
// the attribute id="inkscape-path-id".

// fudge value is used to ensure that subtracted solids are a tad taller
// in the z dimension than the polygon being subtracted from.  This helps
// keep the resulting .stl file manifold.
fudge = 0.1;

module poly_path4404(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-4.025000,-0.665000],[-3.255000,-1.225000],[-3.255000,-3.360000],[-2.870000,-3.360000],[-2.870000,-1.435000],[-2.625000,-1.750000],[-2.275000,-2.135000],[-1.452500,-2.633750],[-0.455000,-2.800000],[-0.350000,-2.800000],[0.901250,-2.563750],[1.785000,-1.995000],[2.485000,-1.260000],[2.520000,-1.225000],[3.955000,-0.525000],[5.355000,-0.490000],[5.320000,-8.820000],[8.050000,-10.815000],[9.310000,0.735000],[8.225000,10.815000],[5.915000,8.015000],[5.285000,0.770000],[3.850000,0.910000],[2.485000,1.610000],[1.925000,2.380000],[0.866250,3.062500],[-0.140000,3.290000],[-0.210000,3.290000],[-1.303750,3.062500],[-2.345000,2.380000],[-2.870000,1.715000],[-3.990000,1.015000],[-5.705000,0.840000],[-5.740000,7.420000],[-8.470000,10.745000],[-9.310000,-0.735000],[-8.435000,-10.675000],[-5.810000,-8.785000],[-5.740000,-0.560000],[-4.025000,-0.665000]]);
  }
}

poly_path4404(5);
