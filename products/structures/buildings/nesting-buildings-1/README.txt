This file contains notes on the nesting building models.

All models here are released under the Creative Commons
Attribution-ShareAlike 4.0 International Public license:
  http://creativecommons.org/licenses/by-sa/4.0/

Getting Happy Corners:

I *highly* suggest ears on corners of these models to prevent warping
of the model on the corners. I tend to print with either a glass
plate and Garnier Fructis #5 spray or on a BuildTak plate, and ~1cm
radius ears make a huge difference.

A brim might work also; however, some software (e.g., Simplify3D)
will cause trouble with the removable back wall of Building 2 if
you use a brim (i.e., it fills in the gap between back wall and
floor, and a difficult cutting process is then required). So maybe
spend the time to put the ears on that one, at least.

Building 1:
- The corresponding source models are in
  src/structures/buildings/favela-4.scad.
- All model components have been passed through NetFabb Basic.
- The roof, when generated from OpenSCAD, has a little stray volume
  near a corner. This was removed with MeshLab.
- All model components were centered with Pleasant3D.

Building 2:
- The corresponding source models are in
  src/structures/buildings/favela-3.scad.
- This version adds a window on the left side of the building.
- All model components have been passed through NetFabb Basic.
- There are two versions of the building core, with and without ears.
- All model components were centered with Pleasant3D.

Building 3:
- The corresponding source model is in
  src/structures/buildings/favela-ruins-1.scad.
- Model has been passed through NetFabb Basic.
- Model was centered with Pleasant3D.

Building 4:
- The corresponding source model is in
  src/structures/buildings/favela-ruins-2.scad.
- Model has been passed through NetFabb Basic.
- Model was centered with Pleasant3D.
