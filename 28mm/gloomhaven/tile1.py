import sys
import bpy
sys.path.append("/Users/rross/personal-git/models/28mm/gloomhaven")

from tile import *
from hex import *

tilepoints = [[0,0], [1,0], [2,0], [3,0], [4,0],[5,0], [6,0], [7,0], [8,0],
              [8,1], [7,1], [7,2], [8,2], [8,3], [7,3], [7,4], [6,4], [5,4],
              [4,4], [3,4], [2,4], [1,4], [1,3], [0,3], [0,2], [1,2], [1,1],
              [0,1]]

hexes = [[0,1],[0,1],[0,1],[0,1],[0,1],[0,1],[0,1]]

# define the tile base
name = "tile"

tile = bpy.data.meshes.new(name+"Mesh")
ob  = bpy.data.objects.new(name, tile)
ob.location = [0,0,0]
ob.show_name = True

bpy.context.scene.objects.link(ob)

[verts, faces] = tile_base_define(example)
tile.from_pydata(verts, [], faces)
tile.update(calc_edges=True)

ref = 5

# generate and position hexes

tot = 0
for row in hexes:
    tot += len(row)

print(tot)

for i in range(0,len(hexes)):
   print(i)
   for j in range(0,len(hexes[i])):
      name = "hex"+"."+str(i)+"."+str(j)

      hex = bpy.data.meshes.new(name+"Mesh")
      ob  = bpy.data.objects.new(name, hex)
      ob.location = position_on_tile(i, hexes[i][j], z=1)
      ob.show_name = True

      bpy.context.scene.objects.link(ob)

      [coords, faces] = hex_define(st_refine = 2, mp_refine=3, peturb_sd=0.1)
      hex.from_pydata(coords, [], faces)
      hex.update(calc_edges=True)
