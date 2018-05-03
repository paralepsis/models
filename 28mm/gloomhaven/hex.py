# refine = 0 corresponds to a six-triangle hex
import math
import random

def rows_in_hex(refine):
   # NOTE: This is the number of rows of triangles, which is 1 less than the
   #       number of rows of points. Also, this is just for a single hexagonal face.
   return 2**(refine+1)

def tris_in_hex(refine):
   # in a single hexagonal face
   return 6 * 4**refine

def verts_in_hex(refine):
   # in a single hexagonal face
   verts = 0
   for i in range(0,rows_in_hex(refine)+1):
      verts += points_in_row(i, refine)
   return verts

def valid_row_col(row, col, refine):
   if row < 0 or col < 0:
      print("*** Invalid row or col value: ", row, col)
      return 0
   elif row > rows_in_hex(refine) - 1:
      print("*** Invalid row: ", row)
      return 0
   elif col >= tris_in_row(row, refine):
      print("*** Invalid col: ", col)
      return 0
   else:
      return 1
   
def tris_in_row(row, refine):
   if row > rows_in_hex(refine) - 1:
      print("*** Invalid row: ", row)

   if refine == 0:
      return 3
   else:
      if row >= (rows_in_hex(refine) / 2):
         # exploit symmetry
         row = rows_in_hex(refine) - row - 1 

      return 1 + 2*row + 2**(refine+1)

def vert_indices_2d(row, col, refine):
   valid_row_col(row, col, refine)
   
   if (row < rows_in_hex(refine)/2 and (col % 2 == 0)) or (row >= rows_in_hex(refine)/2 and (col % 2 == 1)):
      # point down
      return [[row,int(col/2)], [row+1,int(col/2)+1], [row+1,int(col/2)]]
   else:
      # point up
      return [[row,int(col/2)], [row+1,int(col/2)], [row,int(col/2)+1]]

def points_in_row(row, refine):
   # note: this is using the row value differently than when referencing
   #       tiles, because we can have a value one higher than the max.
   #       tile value...

   if row > (rows_in_hex(refine) / 2):
      # exploit symmetry
      row = rows_in_hex(refine) - row

   return row + 2**refine + 1
   
def points_in_rows_before(row, refine):
   if row == 0:
      return 0
   else:
      points = 0
      for i in range(0,row):
         points += points_in_row(i,refine)
      return points

def tri_point_up(row, col, refine):
   if (row < rows_in_hex(refine)/2 and (col % 2 == 0)) or (row >= rows_in_hex(refine)/2 and (col % 2 == 1)):
      return 0
   else:
      return 1
   
def vert_indices_1d(row, col, refine, flip = False, offset = 0):
   valid_row_col(row, col, refine)

   if row < (rows_in_hex(refine) / 2) and tri_point_up(row, col, refine):
      # point up in bottom half
      pt1 = points_in_rows_before(row, refine) + int(col/2)
      pt2 = points_in_rows_before(row, refine) + int(col/2) + 1
      pt3 = points_in_rows_before(row+1, refine) + int(col/2) + 1
   elif row < (rows_in_hex(refine) / 2):
      # point down in bottom half
      pt1 = points_in_rows_before(row, refine) + int(col/2)
      pt2 = points_in_rows_before(row+1, refine) + int(col/2) + 1
      pt3 = points_in_rows_before(row+1, refine) + int(col/2)
   elif tri_point_up(row, col, refine):
      # point up in top half
      pt1 = points_in_rows_before(row, refine) + int(col/2)
      pt2 = points_in_rows_before(row, refine) + int(col/2) + 1
      pt3 = points_in_rows_before(row+1, refine) + int(col/2)
   else:
      # point down in top half
      pt1 = points_in_rows_before(row, refine) + int(col/2) + 1
      pt2 = points_in_rows_before(row+1, refine) + int(col/2) + 1
      pt3 = points_in_rows_before(row+1, refine) + int(col/2) 

   if flip == False:
      return [pt1 + offset, pt2 + offset, pt3 + offset]
   else:
      return [pt1 + offset, pt3 + offset, pt2 + offset]

def vert_list_coords_2d(refine, rad=15, z=0, position=[0,0,0]):
   # ordered from bottom left to top right, row-major
   radxsin30 = rad * math.sin(30/180*math.pi)
   radxcos30 = rad * math.cos(30/180*math.pi)
   
   count = 0
   verts_2d = []
   for i in range (0, rows_in_hex(refine)+1):
      row = []
      start_x = -1 * rad + (abs(int(i - rows_in_hex(refine)/2))) / (2**(refine)) * radxsin30
      
      for j in range(0,points_in_row(i, refine)):
         x = start_x + j * radxsin30 / (2**(refine-1))
         y = (i - int((rows_in_hex(refine)+1)/2))/ ((rows_in_hex(refine))/2) * radxcos30
         row.append([x + position[0] ,y + position[1], z + position[2]])
      verts_2d.append(row)

   return verts_2d

def vert_list_coords_1d(refine, rad=15, z=0):
   verts_2d = vert_list_coords_2d(refine, rad, z)
   verts_1d = []

   for row in verts_2d:
      for vert in row:
         verts_1d.append(vert)

   # print(verts_1d)
   return verts_1d

def prettyprint_coords_2d(coords):
   for row in coords:
      pp_row = ""
      for vert in row:
         pp_row += str("[%.2f, %.2f, %.2f] " % (vert[0], vert[1], vert[2]))

      print(pp_row)
   return 0

def prettyprint_coords_1d(coords):
   pp_row = ""
   for vert in coords:
      pp_row += str("[%.2f, %.2f, %.2f]" % (vert[0], vert[1], vert[2]))

   print(pp_row)
   return 0

def dump_stats(refine):
   refine = i
   print("refine = ", refine)
   print("  tris = ", tris_in_hex(refine))
   print("  rows = ", rows_in_hex(refine))
   for j in range (0,rows_in_hex(refine)):
      print("  tris in row ", j, ": ", tris_in_row(j, refine))

def dump_mapping(refine):
   for i in range(0,rows_in_hex(refine)):
      for j in range(0,tris_in_row(i,refine)):
         print(vert_indices_2d(i,j,refine), " -> ", vert_indices_1d(i,j,refine))

def coords_2d_to_1d(coords_2d, refine):
   coords_1d = []
   
   for i in range(0,rows_in_hex(refine)+1):
      for coord in coords_2d[i]:
         coords_1d.append(coord)

   return coords_1d


def vert_list_faces_1d(refine, offset=0, flip = False):
   faces = []
   
   for i in range(0,rows_in_hex(refine)):
      for j in range(0,tris_in_row(i,refine)):
         faces.append(vert_indices_1d(i, j, refine, offset=offset, flip = flip))

   return faces

def random_face(refine, z=1, peturb_mean=0.0, peturb_sd=0.05, floor = 0.3):
   # returns 2d vert list with beveled edge and some randomness thrown in
   verts_2d = vert_list_coords_2d(refine, z=1)
   
   for j in range(0,rows_in_hex(refine)+1):
      for k in range (0, points_in_row(refine=refine, row=j)):

         verts_2d[j][k][2] = z + random.gauss(peturb_mean, peturb_sd)
         if verts_2d[j][k][2] < floor:
            verts_2d[j][k][2] = floor

   return verts_2d

def bevel_face(coords_2d, refine, floor = 0.3, div=2.0):
   # returns 2d vert list with beveled edge and some randomness thrown in
   
   for j in range(0,rows_in_hex(refine)+1):
      for k in range (0, points_in_row(refine=refine, row=j)):
         if k == 0 or (k == points_in_row(refine=refine, row=j) - 1):
            # ends
            coords_2d[j][k][2] = coords_2d[j][k][2] / 2.0
         elif j == 0 or j == rows_in_hex(refine):
            coords_2d[j][k][2] = coords_2d[j][k][2] / 2.0

         if coords_2d[j][k][2] < floor:
            coords_2d[j][k][2] = floor

   return coords_2d

def midpt_disp(orig_2d, refine, peturb_mean=0, peturb_sd=0.05, floor = 0.3):
   # midpoint displacement algorithm -- adds points between vertices and averages with noise
   new_2d =[]

   if len(orig_2d) != rows_in_hex(refine)+1:
      print("Oh no!")
      
   for i in range(0,len(orig_2d)):
      new_row = []
      for j in range(0,len(orig_2d[i])-1):
         new_row.append(orig_2d[i][j])
         new_row.append([(orig_2d[i][j][0] + orig_2d[i][j+1][0])/2,
                         (orig_2d[i][j][1] + orig_2d[i][j+1][1])/2,
                         (orig_2d[i][j][2] + orig_2d[i][j+1][2] + random.gauss(peturb_mean, peturb_sd))/2])

      new_row.append(orig_2d[i][len(orig_2d[i])-1])
      new_2d.append(new_row)

      new_row = []
      if i < (len(orig_2d)-1)/2:
         for j in range(0,len(orig_2d[i])):
            print("(1) adding for ",i)
            # new next row is bigger than current original row
            new_row.append([(orig_2d[i][j][0] + orig_2d[i+1][j][0])/2,
                            (orig_2d[i][j][1] + orig_2d[i+1][j][1])/2,
                            (orig_2d[i][j][2] + orig_2d[i+1][j][2] + random.gauss(peturb_mean, peturb_sd))/2])
            new_row.append([(orig_2d[i][j][0] + orig_2d[i+1][j+1][0])/2,
                            (orig_2d[i][j][1] + orig_2d[i+1][j+1][1])/2,
                            (orig_2d[i][j][2] + orig_2d[i+1][j+1][2] + random.gauss(peturb_mean, peturb_sd))/2])
         new_2d.append(new_row)
      elif i < (len(orig_2d)-1):
         for j in range(0,len(orig_2d[i])):
            print("(2) adding for ", i)
            if j > 0:
               new_row.append([(orig_2d[i][j][0] + orig_2d[i+1][j-1][0])/2,
                               (orig_2d[i][j][1] + orig_2d[i+1][j-1][1])/2,
                               (orig_2d[i][j][2] + orig_2d[i+1][j-1][2] + random.gauss(peturb_mean, peturb_sd))/2])
            if j < (len(orig_2d[i]) - 1):
               new_row.append([(orig_2d[i][j][0] + orig_2d[i+1][j][0])/2,
                               (orig_2d[i][j][1] + orig_2d[i+1][j][1])/2,
                               (orig_2d[i][j][2] + orig_2d[i+1][j][2] + random.gauss(peturb_mean, peturb_sd))/2])
         new_2d.append(new_row)

   return new_2d

def faces_to_stitch_faces(refine, bottom=True):
   bf_st = verts_in_hex(refine) # starting index for bottom verts
   faces = []

   # bottom edge
   for i in range(0, points_in_row(0, refine)-1):
      faces += [[bf_st+i, bf_st+i+1, i], [bf_st+i+1, i+1, i]]

   # top edge
   for i in range(verts_in_hex(refine) - points_in_row(0, refine), verts_in_hex(refine)-1):
      faces += [[bf_st+i+1, bf_st+i, i], [bf_st+i+1, i, i+1]]

   # left and right edges
   for i in range(0, rows_in_hex(refine)):
      pir = points_in_row(i, refine)
      pnr = points_in_row(i+1, refine)
      left = points_in_rows_before(i, refine)
      right = left + pir - 1
      next_left = left + pir
      next_right = right + pnr
      faces += [[bf_st+next_left, bf_st+left, left], [bf_st+next_left, left, next_left]]
      faces += [[bf_st+right, bf_st+next_right, right], [bf_st+next_right, next_right, right]]
   
   return faces

def simple_hex_define(z1 = 1,
                      z0 = 0,
                      rad1 = 37/2,
                      rad0 = 38.1/2,
                      refine = 0,
                      position = [0,0,0],
                      bottom=True):
   hex_top_verts_2d = vert_list_coords_2d(refine=refine, z=z1, rad=rad1,
                                          position=position)
   hex_top_verts_1d = coords_2d_to_1d(hex_top_verts_2d, refine=refine)
   hex_top_faces_1d = vert_list_faces_1d(refine=refine)

   hex_bottom_verts_2d = vert_list_coords_2d(refine=refine, z=z0, rad=rad0,
                                             position = position)
   hex_bottom_verts_1d = coords_2d_to_1d(hex_bottom_verts_2d, refine=refine)
   hex_side_faces_1d = faces_to_stitch_faces(refine, bottom)

   verts = hex_top_verts_1d + hex_bottom_verts_1d

   if bottom:
      hex_bottom_faces_1d = vert_list_faces_1d(refine=refine, flip = True,
                                               offset=len(hex_top_verts_1d))
      faces = hex_top_faces_1d + hex_bottom_faces_1d + hex_side_faces_1d
   else:
      faces = hex_top_faces_1d + hex_side_faces_1d

   return [verts, faces]

def hex_define(z1 = 1,
               z0 = 0,
               rad = 15,
               st_refine = 3,
               mp_refine = 0,
               floor = 0.3,
               peturb_mean = 0.0,
               peturb_sd = 0.1):
   hex_top_verts_2d = random_face(st_refine)
   # print("before: ")
   # prettyprint_coords_2d(hex_top_verts_2d)

   for i in range(0, mp_refine):
      hex_top_verts_2d = midpt_disp(hex_top_verts_2d, st_refine+i, peturb_sd = peturb_sd / (2**i))
      if (st_refine + i + 1 > 3):
         hex_top_verts_2d = bevel_face(hex_top_verts_2d, refine=st_refine+i+1, div=1.5)


   # print("midpt: ")
   # prettyprint_coords_2d(hex_top_verts_2d)

   # hex_top_verts_2d = bevel_face(hex_top_verts_2d, refine=st_refine+mp_refine)

   # print("bevel: ")
   # prettyprint_coords_2d(hex_top_verts_2d)
   
   hex_top_verts_1d = coords_2d_to_1d(hex_top_verts_2d, refine=st_refine+mp_refine)
   hex_top_faces_1d = vert_list_faces_1d(refine=st_refine+mp_refine)

   hex_bottom_verts_2d = vert_list_coords_2d(refine=st_refine+mp_refine, z=0)
   hex_bottom_verts_1d = coords_2d_to_1d(hex_bottom_verts_2d, refine=st_refine+mp_refine)
   hex_bottom_faces_1d = vert_list_faces_1d(refine=st_refine+mp_refine, flip = True, offset=len(hex_top_verts_1d))
   hex_side_faces_1d = faces_to_stitch_faces(st_refine+mp_refine)

   verts = hex_top_verts_1d + hex_bottom_verts_1d
   faces = hex_top_faces_1d + hex_bottom_faces_1d + hex_side_faces_1d

   return [verts, faces]

[ coords, faces ] = simple_hex_define()

# coords2d = random_face(0)
# new2d=midpt_disp(coords2d, refine=0)
# print("orig:")
# prettyprint_coords_2d(coords2d)
# print("midpt:")
# prettyprint_coords_2d(new2d)

# print(faces)
# prettyprint_coords_1d(coords)

# prettyprint_coords_2d(beveled_face(refine=2))
