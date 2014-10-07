Terrain generated with something like this:
  ./genheightmap.pl --rows 257 --cols 257 --height=100 --random=4 | \
  ./genterrain.pl --scale=100 | head -100 | tail -8 | \
  ./height2scad.pl > map-257x8-h100t8-h100-s100.scad

or:
  ./genheightmap.pl --rows 257 --cols 257 --height=10 --random=3 | \
  ./genterrain.pl --scale=8 | head -200 | tail -50 | \
  ./height2scad.pl --min=6 > map-257x50-h200t50-h10-s8-m6.scad
