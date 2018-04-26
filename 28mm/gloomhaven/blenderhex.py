import sys
sys.path.append("/Users/rross/personal-git/models/28mm/gloomhaven")

from hex import *
import bpy

# prettyprint_coords_2d(beveled_face(refine=2))

ref = 5

[coords, faces] = hex_define(st_refine = 2, mp_refine=3, peturb_sd=0.1)

name = "hex"

hex = bpy.data.meshes.new(name+"Mesh")
ob  = bpy.data.objects.new(name, hex)
ob.location = [0,0,0]
ob.show_name = True

bpy.context.scene.objects.link(ob)

hex.from_pydata(coords, [], faces)
hex.update(calc_edges=True)
