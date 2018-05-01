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

[verts, faces] = tile_base_define(tilepoints, rad=38.1/2, z=2)
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
      ob.location = position_on_tile(i, hexes[i][j], z=2, rad=38.1/2)
      ob.show_name = True

      bpy.context.scene.objects.link(ob)

      [coords, faces] = simple_hex_define(z1=1.2, z0=0, rad1=37/2, rad0 = 38.1/2,refine = 2)
      hex.from_pydata(coords, [], faces)
      hex.update(calc_edges=True)
