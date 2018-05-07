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
            faces += [[bv_st+i+1, bv_st+i, i], [bv_st+i+1, i, i+1]]
        else:
            # stitch start to end
            faces += [[bv_st, bv_st+i, i], [bv_st, i, 0]]

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

def duplicate(v1, v2, e=0.0001):
    if v1[0] > (v2[0]+e) or v1[0] < (v2[0]-e):
        return False
    elif v1[1] > (v2[1]+e) or v1[1] < (v2[1]-e):
        return False
    elif v1[2] > (v2[2]+e) or v1[2] < (v2[2]-e):
        return False
    else:
        return True

def remove_dup_vertices(verts, faces):
    new_verts = []
    new_faces = []
    mapping = {}

    for i in range(0,len(verts)):
        deduped = False
        for j in range(0,len(new_verts)):
            if duplicate(verts[i], new_verts[j]):
                # print("adding " + str(i) + " -> " + str(j))
                mapping[str(i)] = j
                # print("match: %s" % verts[i])
                deduped = True
                break
        
        if not deduped:
            # print("no match: %s" % verts[i])
            # print("adding " + str(i) + " -> " + str(len(new_verts)))
            mapping[str(i)] = len(new_verts)
            new_verts.append(verts[i])

    for f in faces:
        # replace indices in this face
        new_face = []
        for v in f:
            new_face.append(mapping[str(v)])

        # print(str(f) + " -> " + str(new_face))
        new_faces.append(new_face)

    return [ new_verts, new_faces ]

def tile_define(points, hexes, rad, z=3.2,type="simple"):
    # This builds the base and some basic hex tops as a single whole.
    # NOTE: hexes is a list of lists. List per row containing columns where
    #       hexes belong.
    [ verts, faces ] = tile_base_define(points, rad, z=1, top=False)

    for row in range(0,len(hexes)):
        for j in range(0,len(hexes[row])):
            loc = position_on_tile(row, hexes[row][j], z=1, rad=rad)
            [ h_verts, h_faces ] = simple_hex_define(z1=2.2, z0=0, rad1=rad-0.5,
                                                     rad0=rad, position = loc,
                                                     bottom = False)
            [ verts, faces ] = append_verts_and_faces([verts, faces],
                                                      [h_verts, h_faces])
            
    [ verts, faces ] = remove_dup_vertices(verts, faces)
    
    return [verts, faces]

def tile_hexes_define(points, hexes, rad, z=3.1, type="simple"):
    # This builds some basic hex tops as a single whole.
    # NOTE: hexes is a list of lists. List per row containing columns where
    #       hexes belong.
    verts = []
    faces = []

    for row in range(0,len(hexes)):
        for j in range(0,len(hexes[row])):
            loc = position_on_tile(row, hexes[row][j], z=0.0, rad=rad)
            if type == "simple":
                [ h_verts, h_faces ] = simple_hex_define(z1=z, z0=0,
                                                         rad1=rad-0.5,
                                                         rad0=rad-0.5,
                                                         position = loc,
                                                         bottom = True)
            elif type == "midpt":
                [ h_verts, h_faces ] = hex_define(z1 = z,
                                                  z0 = 0,
                                                  rad = rad-0.5,
                                                  position = loc,
                                                  st_refine = 4,
                                                  mp_refine = 2,
                                                  floor = 0.15,
                                                  peturb_mean = 0.0,
                                                  peturb_sd = 0.1)


            [ verts, faces ] = append_verts_and_faces([verts, faces],
                                                      [h_verts, h_faces])
            
    return [verts, faces]


[ verts, faces ] = tile_base_define(ex_points, rad=38.1/2, z=2)

print(faces)
