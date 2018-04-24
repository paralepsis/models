# refine = 0 corresponds to a six-triangle hex

def rows_in_hex(refine):
   return 2**(refine+1)

def tris_in_hex(refine):
   return 6 * 4**refine

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
   
def vert_indices_1d(row, col, refine):
   valid_row_col(row, col, refine)

   if row < (rows_in_hex(refine) / 2) and tri_point_up(row, col, refine):
      # point up in bottom half
      pt1 = points_in_rows_before(row, refine) + int(col/2)
      pt2 = points_in_rows_before(row, refine) + int(col/2) + 1
      pt3 = points_in_rows_before(row+1, refine) + int(col/2) + 1
      return ["u", pt1, pt2, pt3]
   elif row < (rows_in_hex(refine) / 2):
      # point down in bottom half
      pt1 = points_in_rows_before(row, refine) + int(col/2)
      pt2 = points_in_rows_before(row+1, refine) + int(col/2) + 1
      pt3 = points_in_rows_before(row+1, refine) + int(col/2)
      return ["d", pt1, pt2, pt3]
   elif tri_point_up(row, col, refine):
      # point up in top half
      pt1 = points_in_rows_before(row, refine) + int(col/2)
      pt2 = points_in_rows_before(row, refine) + int(col/2) + 1
      pt3 = points_in_rows_before(row+1, refine) + int(col/2)
      return ["u", pt1, pt2, pt3]
   else:
      # point down in top half
      pt1 = points_in_rows_before(row, refine) + int(col/2) + 1
      pt2 = points_in_rows_before(row+1, refine) + int(col/2) + 1
      pt3 = points_in_rows_before(row+1, refine) + int(col/2) 
      return ["d", pt1, pt2, pt3]

def dump1():
   for i in range(2,4):
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
      
dump_mapping(1)
