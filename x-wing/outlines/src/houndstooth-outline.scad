
// Module names are of the form poly_<inkscape-path-id>().  As a result,
// you can associate a polygon in this OpenSCAD program with the corresponding
// SVG element in the Inkscape document by looking for the XML element with
// the attribute id="inkscape-path-id".

module houndstoothOutline(h=5)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[9.380000,5.652500],[9.275000,5.652500],[9.205000,5.617500],[9.205000,5.547500],[9.205000,5.407500],[9.135000,5.372500],[9.065000,5.302500],[8.995000,5.372500],[8.960000,5.442500],[8.680000,5.722500],[8.435000,5.967500],[8.365000,5.967500],[8.155000,6.212500],[7.980000,6.422500],[7.840000,6.527500],[7.840000,6.632500],[7.840000,6.702500],[7.875000,6.737500],[7.000000,7.577500],[6.230000,7.087500],[6.195000,7.017500],[6.160000,7.052500],[5.320000,6.492500],[5.320000,6.457500],[5.180000,6.422500],[5.110000,6.352500],[3.780000,5.512500],[3.815000,5.477500],[3.675000,5.477500],[2.800000,4.882500],[2.975000,4.497500],[-3.325000,-0.752500],[-3.045000,-0.962500],[-3.570000,-1.382500],[-3.605000,-1.417500],[-3.640000,-1.417500],[-3.675000,-1.452500],[-3.815000,-1.382500],[-4.025000,-1.452500],[-4.235000,-1.417500],[-4.620000,-1.242500],[-5.005000,-1.172500],[-5.215000,-1.207500],[-5.250000,-1.242500],[-5.285000,-1.277500],[-9.625000,-0.682500],[-9.800000,-0.647500],[-10.010000,-0.647500],[-10.325000,-0.892500],[-10.640000,-1.102500],[-10.640000,-1.172500],[-10.815000,-1.312500],[-10.780000,-1.312500],[-10.605000,-1.417500],[-10.360000,-1.522500],[-10.150000,-1.627500],[-9.870000,-1.767500],[-9.135000,-2.082500],[-9.135000,-2.152500],[-9.100000,-2.222500],[-9.065000,-2.257500],[-9.030000,-2.292500],[-8.960000,-2.327500],[-8.820000,-2.397500],[-8.750000,-2.362500],[-8.645000,-2.327500],[-8.400000,-2.432500],[-8.085000,-2.572500],[-6.720000,-3.202500],[-6.300000,-3.412500],[-6.055000,-3.552500],[-6.440000,-3.902500],[-6.755000,-4.287500],[-7.350000,-5.092500],[-7.490000,-5.512500],[-7.315000,-5.932500],[-6.825000,-6.247500],[-6.090000,-6.247500],[-5.320000,-5.792500],[-4.620000,-5.232500],[-4.340000,-4.987500],[-4.060000,-4.742500],[-3.990000,-4.357500],[-3.920000,-3.902500],[-3.885000,-3.867500],[-3.815000,-3.867500],[-3.640000,-3.972500],[-3.535000,-4.182500],[-3.465000,-4.427500],[-3.570000,-4.497500],[-3.640000,-4.567500],[-2.450000,-6.632500],[-2.660000,-6.842500],[-2.450000,-6.982500],[-2.380000,-6.912500],[-2.275000,-6.842500],[-2.205000,-7.017500],[-2.065000,-7.157500],[-2.030000,-7.367500],[-1.960000,-7.577500],[-1.750000,-7.437500],[-1.505000,-7.227500],[-1.260000,-7.052500],[-1.085000,-6.667500],[-0.875000,-6.282500],[-0.875000,-5.407500],[-0.805000,-4.532500],[-0.805000,-4.217500],[-0.770000,-3.937500],[-0.770000,-3.657500],[-0.805000,-3.342500],[-0.805000,-2.992500],[-0.840000,-2.642500],[-0.910000,-2.432500],[-0.980000,-2.432500],[-1.155000,-2.572500],[-1.330000,-2.677500],[-1.365000,-2.572500],[-1.400000,-2.502500],[-1.575000,-2.397500],[-1.540000,-2.362500],[-1.470000,-2.327500],[-1.400000,-2.222500],[-1.435000,-2.152500],[-1.400000,-2.152500],[-1.330000,-2.187500],[-1.295000,-2.117500],[-1.330000,-2.012500],[-1.295000,-2.012500],[-1.225000,-2.082500],[-1.155000,-1.977500],[-1.190000,-1.942500],[-1.120000,-1.942500],[-1.050000,-1.872500],[-1.085000,-1.837500],[-1.050000,-1.837500],[-0.980000,-1.872500],[-0.910000,-1.802500],[-0.805000,-1.732500],[-0.735000,-1.802500],[-0.665000,-1.872500],[-0.735000,-1.942500],[-0.700000,-2.187500],[-0.595000,-2.292500],[-0.525000,-2.397500],[-0.560000,-2.502500],[-0.525000,-2.572500],[-0.455000,-2.677500],[-0.105000,-2.957500],[0.315000,-3.272500],[0.455000,-3.377500],[0.630000,-3.482500],[0.665000,-3.447500],[0.910000,-3.657500],[1.225000,-3.832500],[1.225000,-3.797500],[1.225000,-3.692500],[1.260000,-3.692500],[1.225000,-3.552500],[1.470000,-3.412500],[1.680000,-3.272500],[2.100000,-2.992500],[2.555000,-2.677500],[3.395000,-2.117500],[4.270000,-1.522500],[4.445000,-1.312500],[4.620000,-1.067500],[4.690000,-0.892500],[4.760000,-0.717500],[4.830000,-0.682500],[4.900000,-0.647500],[6.895000,0.717500],[7.000000,0.822500],[7.140000,0.892500],[7.280000,0.822500],[7.350000,0.787500],[10.815000,3.167500],[10.640000,4.217500],[10.675000,4.252500],[10.745000,4.322500],[10.675000,4.392500],[10.605000,4.392500],[10.535000,4.392500],[9.415000,5.547500],[9.380000,5.582500],[9.380000,5.652500]]);
  }
}