import sys
# import bpy
sys.path.append("/Users/rross/personal-git/models/28mm/gloomhaven")

from tile import *
from hex import *

hexes = [[0,2,4]]

def point_hex_define(z1_center=4.2-1.2,
                     z1_edge=3.2-1.2,
                     z0=0,
                     position=[0,0,0],
                     mp_refine=3,
                     rad=38.1/2-0.1,
                     perturb_mean=0.0,
                     perturb_sd=0.2):
   # NOTE: For some reason not passing perturb_sd to random_face(), so it
   #       uses default of 0.05. Doing this to be consistent with other
   #       code building tile tops (hexes).
   hex_top_verts_2d = random_face(refine=3, z=z1_edge, rad = rad,
                                  position=position)

   rows = len(hex_top_verts_2d)
   for i in range(0,rows):
      if i < (len(hex_top_verts_2d) / 2):
         add = (z1_center - z1_edge) * ( i / (rows/2))
         
      else:
         add = (z1_center - z1_edge) * ((rows - i - 1)/(rows/2))
      
      for j in range(0,len(hex_top_verts_2d[i])):
         hex_top_verts_2d[i][j][2] += add

   # bits from hex_define(), st_refine defined to be 3
   for i in range(0, mp_refine):
      hex_top_verts_2d = midpt_disp(hex_top_verts_2d, 3+i, perturb_sd = perturb_sd / (2**i))
      if (3+ i + 1 > 3):
         hex_top_verts_2d = bevel_face(hex_top_verts_2d, refine=3+i+1, div=1.5)


   hex_top_verts_1d = coords_2d_to_1d(hex_top_verts_2d, refine=3+mp_refine)
   hex_top_faces_1d = vert_list_faces_1d(refine=3+mp_refine)

   hex_bottom_verts_2d = vert_list_coords_2d(refine=3+mp_refine, z=0,
                                             rad = rad,
                                             position = position)
   hex_bottom_verts_1d = coords_2d_to_1d(hex_bottom_verts_2d, refine=3+mp_refine)
   hex_bottom_faces_1d = vert_list_faces_1d(refine=3+mp_refine, flip = True, offset=len(hex_top_verts_1d))
   hex_side_faces_1d = faces_to_stitch_faces(3+mp_refine)

   verts = hex_top_verts_1d + hex_bottom_verts_1d
   faces = hex_top_faces_1d + hex_bottom_faces_1d + hex_side_faces_1d

   return [verts, faces]

point_hex_define()
