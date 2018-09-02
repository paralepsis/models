import sys
import bpy
sys.path.append("/Users/rross/personal-git/models/28mm/gloomhaven")

from tile import *
from hex import *

tilepoints = [[1,1], [2,1], [2,0], [3,0], [4,0], [5,0], [6,0], [7,0], [8,0],
              [9,0], [10,0], [11,0], [12,0], [13,0], [14,0], [14,1], [15,1],
              [15,2], [14,2], [13,2], [12,2], [11,2], [10,2], [10,3], [11,3],
              [11,4], [10,4], [10,5], [11,5], [11,6], [10,6], [10,7], [9,7],
              [8,7], [7,7], [6,7], [6,6], [5,6], [5,5], [6,5], [6,4], [5,4],
              [5,3], [6,3], [6,2], [5,2], [4,2], [3,2], [2,2], [1,2]
]

hexes = [[0,1,2],[0,1],[0,1,2],[0,1,],[0,1,2],[0,1],[0,1,2],
         [0,1],[0,1,2],[0,1,],[0,1,2], [0,1,2]]

def my_hexes():
    name = "hexes"
    tile = bpy.data.meshes.new(name+"Mesh")
    ob  = bpy.data.objects.new(name, tile)
    ob.location = [0,0,0]
    ob.show_name = True

    bpy.context.scene.objects.link(ob)

    [verts, faces] = tile_hexes_define(tilepoints, hexes, rad=38.1/2, z=3.2)
    tile.from_pydata(verts, [], faces)
    tile.update(calc_edges=True)

def my_tile():
    name = "tile"
    tile = bpy.data.meshes.new(name+"Mesh")
    ob  = bpy.data.objects.new(name, tile)
    ob.location = [0,0,-0.95]
    ob.show_name = True

    bpy.context.scene.objects.link(ob)

    [verts, faces] = tile_base_define(tilepoints, rad=38.1/2, z=1.2)
    tile.from_pydata(verts, [], faces)
    tile.update(calc_edges=True)
    
# my_hexes()
my_tile()