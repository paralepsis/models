import sys
import bpy
sys.path.append("/Users/rross/personal-git/models/28mm/gloomhaven")

from tile import *
from hex import *

tilepoints = [[0,0], [1,0], [2,0], [3,0], [4,0],[5,0], [6,0], [7,0], [8,0],
              [9,0], [10,0], [11,0], [12,0], [12,1], [11,1], [11,2], [12,2],
              [12,3], [11,3], [11,4], [12,4], [12,5], [11,5], [10,5],
              [9,5], [8,5], [7,5], [6,5], [5,5], [4,5], [3,5], [2,5], [1,5],
              [0,5], [0,4], [1,4], [1,3], [0,3], [0,2], [1,2], [1,1], [0,1]]

hexes = [[0,1,2],[0,1],[0,1,2],[0,1,],[0,1,2],[0,1],[0,1,2],
         [0,1],[0,1,2],[0,1,],[0,1,2]]

def hexes():
    name = "hexes"
    tile = bpy.data.meshes.new(name+"Mesh")
    ob  = bpy.data.objects.new(name, tile)
    ob.location = [0,0,0]
    ob.show_name = True

    bpy.context.scene.objects.link(ob)

    [verts, faces] = tile_hexes_define(tilepoints, hexes, rad=38.1/2, z=3.2)
    tile.from_pydata(verts, [], faces)
    tile.update(calc_edges=True)

def tile():
    name = "tile"
    tile = bpy.data.meshes.new(name+"Mesh")
    ob  = bpy.data.objects.new(name, tile)
    ob.location = [0,0,-0.95]
    ob.show_name = True

    bpy.context.scene.objects.link(ob)

    [verts, faces] = tile_base_define(tilepoints, rad=38.1/2, z=1.2)
    tile.from_pydata(verts, [], faces)
    tile.update(calc_edges=True)
    
tile()
