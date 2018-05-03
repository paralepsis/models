import math
from hex import *

ex_points = [[0,0], [1,0], [2,0], [3,0], [4,0],[4,1], [3,1],
              [3,2], [2,2], [1,2], [1,1], [0,1]]

ex_hexes = [[0],[0],[0]]

def position_on_tile(row, col, rad=15, z=1):
    # NOTE: assumes that we're moving a hex sitting at [0,0,0], also,
    #       numbering is for full hexes, so [1,0] is the first hex in the second
    #       row, which ought to have its bottom left corner at [2*rad,rad*cos(30deg)]
    x_inc = rad * math.sin(30/180*math.pi)
    x_short = 2*x_inc
    x_long = 2*rad
    y_inc = rad * math.cos(30/180*math.pi)

    if row % 2:
        # x starts at zero and on long edge
        x = col * (x_short + x_long) + x_long + x_inc 
    else:
        # x starts at x_inc and on short edge
        x = col * (x_short + x_long) + rad

    y = (row+1) * y_inc
    
    return [x,y,z]

def append_verts_and_faces(vf1, vf2):
    [ verts, faces ] = vf1
    [ v2, f2 ] = vf2
    offset = len(verts)

    verts += v2
    
    for i in range(0,len(f2)):
        new_face = []
        for j in range(0,len(f2[i])):
            new_face.append(f2[i][j]+offset)

        faces.append(new_face)

    return [ verts, faces ]

def tile_base_define(desc, rad=15, z=1, top=True):
    # NOTE: coordinates in the desc are in [row, col] order, so x and y
    #       are swapped. This makes sense if you're used to staring at my
    #       hex code, but maybe not otherwise...
    x_inc = rad * math.sin(30/180*math.pi)
    x_short = 2*x_inc
    x_long = 2*rad
    y_inc = rad * math.cos(30/180*math.pi)

    top_verts = []
    bottom_verts = []
    faces = []
    for xy in desc:
        if xy[0] % 2:
            # x starts at zero and on long edge
            x = int(xy[1]/2) * (x_short + x_long) + (xy[1]%2) * x_long
        else:
            # x starts at x_inc and on short edge
            x = x_inc + int(xy[1]/2) * (x_short + x_long) + (xy[1]%2) * x_short
        
        y = xy[0] * y_inc

        top_verts.append([x,y,z])
        bottom_verts.append([x,y,0])

    bv_st = len(desc)
    for i in range(0,len(desc)):
        if i < len(desc)-1:
            faces += [[bv_st+i, bv_st+i+1, i], [bv_st+i+1, i+1, i]]
        else:
            # stitch start to end
            faces += [[bv_st+i, bv_st, i], [bv_st, 0, i]]

    top_face = []
    bottom_face = []
    for i in range(0,len(desc)):
        if top:
            top_face.append(len(desc)-i-1)
        bottom_face.append(i + len(desc))
            
    verts = top_verts + bottom_verts

    if top:
        faces += [ top_face ] + [ bottom_face ]
    else:
        faces += [ bottom_face ]
    return [ verts, faces ]

def tile_define(points, hexes, rad, z=2):
    # This builds the base and some basic hex tops as a single whole.
    # NOTE: hexes is a list of lists. List per row containing columns where
    #       hexes belong.
    [ verts, faces ] = tile_base_define(points, rad, z, top=False)

    for row in range(0,len(hexes)):
        for j in range(0,len(hexes[row])):
            loc = position_on_tile(row, hexes[row][j], z=2, rad=rad)
            [ h_verts, h_faces ] = simple_hex_define(z1=1.2, z0=0, rad1=rad-0.5,
                                                     rad0=rad, position = loc,
                                                     bottom = False)
            print("hex " + str(row) + str(j))
            print(faces)
            [ verts, faces ] = append_verts_and_faces([verts, faces],
                                                      [h_verts, h_faces])
            
    
    return [verts, faces]

# [ verts, faces ] = tile_define(ex_points, ex_hexes, rad=38.1/2, z=2)
