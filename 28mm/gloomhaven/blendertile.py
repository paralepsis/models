import sys
sys.path.append("/Users/rross/personal-git/models/28mm/gloomhaven")

from tile import *
import bpy

[verts, faces] = tile_define(example)

name = "tile"

tile = bpy.data.meshes.new(name+"Mesh")
ob  = bpy.data.objects.new(name, tile)
ob.location = [0,0,0]
ob.show_name = True

bpy.context.scene.objects.link(ob)

tile.from_pydata(verts, [], faces)
tile.update(calc_edges=True)
