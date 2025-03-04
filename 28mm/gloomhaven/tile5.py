import sys
import bpy
sys.path.append("/Users/rross/personal-git/models/28mm/gloomhaven")

from tile import *
from hex import *
 
tilepoints = [[0,0], [1,0], [2,0], [3,0], [4,0],[4,1], [3,1],
              [3,2], [2,2], [1,2], [1,1], [0,1]]

hexes = [[0],[0],[0]]

# define the tile base
name = "tile"

tile = bpy.data.meshes.new(name+"Mesh")
ob  = bpy.data.objects.new(name, tile)
ob.location = [0,0,0]
ob.show_name = True

bpy.context.scene.objects.link(ob)

[verts, faces] = tile_define(tilepoints, hexes, rad=38.1/2, z=3.2)
tile.from_pydata(verts, [], faces)
tile.update(calc_edges=True)

