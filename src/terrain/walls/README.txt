Terrain generated with something like this:
  ./genheightmap.pl --rows 257 --cols 257 --height=100 --random=4 | \
  ./genterrain.pl --scale=100 | head -100 | tail -8 | \
  ./height2scad.pl > map-257x8-h100t8-h100-s100.scad
