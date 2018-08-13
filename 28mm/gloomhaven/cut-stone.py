import sys
import bpy
sys.path.append("/Users/rross/personal-git/models/28mm/gloomhaven")

from tile import *
from hex import *

hexes = [[0],[],[0]]
 
def my_tile_bits():
   for i in range(0,len(hexes)):
      for j in range(0,len(hexes[i])):
         name = "bot"+"."+str(i)+"."+str(j)+"."

         hex = bpy.data.meshes.new(name+"Mesh")
         ob  = bpy.data.objects.new(name, hex)
         ob.location = position_on_tile(i, hexes[i][j], z=0, rad=38.1/2)
         ob.show_name = False

         bpy.context.scene.objects.link(ob)

         [coords, faces] = simple_hex_define(z1=1.2, z0=0, rad1=38.1/2, rad0 = 38.1/2, refine = 0)
         hex.from_pydata(coords, [], faces)
         hex.update(calc_edges=True)

def my_simple_hexes_split():
   for i in range(0,len(hexes)):
      for j in range(0,len(hexes[i])):
         name = "s"+"."+str(i)+"."+str(j)+"."

         hex = bpy.data.meshes.new(name+"Mesh")
         ob  = bpy.data.objects.new(name, hex)
         ob.location = position_on_tile(i, hexes[i][j], z=1.2, rad=38.1/2)
         ob.show_name = False

         bpy.context.scene.objects.link(ob)

         [coords, faces] = simple_hex_define(z1=2.0, z0=0, rad1=38.1/2-0.5, rad0 = 38.1/2-0.5,refine = 5)
         hex.from_pydata(coords, [], faces)
         hex.update(calc_edges=True)

def my_midpt_hexes_split():
   for i in range(0,len(hexes)):
      for j in range(0,len(hexes[i])):
         name = "top"+"."+str(i)+"."+str(j)

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
                                        perturb_sd = 0.2)
         hex.from_pydata(coords, [], faces)
         hex.update(calc_edges=True)

#my_tile_bits()
#my_simple_hexes_split()
my_midpt_hexes_split()

