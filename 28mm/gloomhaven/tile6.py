import sys
import bpy
sys.path.append("/Users/rross/personal-git/models/28mm/gloomhaven")

from tile import *
from hex import *

tilepoints = [[0,0], [1,0], [2,0], [3,0], [4,0],[5,0], [6,0], [7,0], [8,0],
              [8,1], [7,1], [7,2], [8,2], [8,3], [7,3], [7,4], [6,4], [5,4],
              [4,4], [3,4], [2,4], [1,4], [1,3], [0,3], [0,2], [1,2], [1,1],
              [0,1]
]

hexes = [[0,1],[0,1],[0,1],[0,1],[0,1],[0,1],[0,1]]
 
def tile():
    # define the tile base
    name = "tile"
    
    tile = bpy.data.meshes.new(name+"Mesh")
    ob  = bpy.data.objects.new(name, tile)
    ob.location = [0,0,0]
    ob.show_name = True
    
    bpy.context.scene.objects.link(ob)
    
    [verts, faces] = tile_base_define(tilepoints, rad=38.1/2, z=1.2)
    tile.from_pydata(verts, [], faces)
    tile.update(calc_edges=True)

def my_hexes():
    # define the hexes
    name = "hexes"
    
    tile = bpy.data.meshes.new(name+"Mesh")
    ob  = bpy.data.objects.new(name, tile)
    ob.location = [0,0,0]
    ob.show_name = True
    
    bpy.context.scene.objects.link(ob)
    
    [verts, faces] = tile_hexes_define(points=tilepoints, hexes=hexes,
                                       rad=38.1/2, z1=3.0, z0=1.2,
                                       type="midpt",
                                       st_refine=3, mp_refine=3, perturb_sd=0.2)
    tile.from_pydata(verts, [], faces)
    tile.update(calc_edges=True)

def my_midpt_hexes_split():
   for i in range(0,len(hexes)):
      for j in range(0,len(hexes[i])):
         name = "mhex"+"."+str(i)+"."+str(j)

         hex = bpy.data.meshes.new(name+"Mesh")
         ob  = bpy.data.objects.new(name, hex)
         ob.location = position_on_tile(i, hexes[i][j], z=1.2, rad=38.1/2)
         ob.show_name = True

         bpy.context.scene.objects.link(ob)

         [ coords, faces ] = hex_define(z1 = 1.8,
                                        z0 = 0,
                                        rad = 38.1/2-0.1,
                                        position = [0,0,0],
                                        st_refine = 3,
                                        mp_refine = 3,
                                        floor = 1.5,
                                        perturb_mean = 0.0,
                                        perturb_sd = 0.4)
         hex.from_pydata(coords, [], faces)
         hex.update(calc_edges=True)

def my_simple_hexes_split():
   for i in range(0,len(hexes)):
      for j in range(0,len(hexes[i])):
         name = "shex"+"."+str(i)+"."+str(j)

         hex = bpy.data.meshes.new(name+"Mesh")
         ob  = bpy.data.objects.new(name, hex)
         ob.location = position_on_tile(i, hexes[i][j], z=1.2, rad=38.1/2)
         ob.show_name = True

         bpy.context.scene.objects.link(ob)

         [coords, faces] = simple_hex_define(z1=0.8, z0=0, rad1=34/2, rad0 = 38.1/2,refine = 1)
         hex.from_pydata(coords, [], faces)
         hex.update(calc_edges=True)



# tile()
# my_hexes()
my_midpt_hexes_split()
my_simple_hexes_split()

