import sys
import bpy
sys.path.append("/Users/rross/personal-git/models/28mm/gloomhaven")

from tile import *
from hex import *

tilepoints = [[4,0], [5,0], [6,0], [7,0], [8,0],[9,0], [10,0],
              [10,1], [9,1], [9,2], [10,2], [10,3], [9,3], [9,4], 
              [10,4], [10,5], [9,5], [9,6], [10,6], [10,7], [9,7],
              [9,8], [10,8], [10,9], [9,9], [8,9], [7,9], [6,9],
              [5,9], [4,9], [4,8], [5,8], [5,7], [4,7], [4,6], 
              [5,6], [5,5], [4,5], [4,4], [5,4], [5,3], [4,3],
              [4,2], [5,2], [5,1], [4,1]]

hexes = [[],[],[],[],[0,1,2,3,4],[0,1,2,3],[0,1,2,3,4],[0,1,2,3],[0,1,2,3,4]]

def my_hexes():
    name = "hexes"
    tile = bpy.data.meshes.new(name+"Mesh")
    ob  = bpy.data.objects.new(name, tile)
    ob.location = [0,0,0]
    ob.show_name = True

    bpy.context.scene.objects.link(ob)

    [verts, faces] = tile_hexes_define(tilepoints, hexes, rad=38.1/2, z1=3.2)
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
    
my_tile()
my_hexes()
