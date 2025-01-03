// See https://gist.github.com/lorennorman/1534990

module hexagon(radius)
{
  circle(r=radius,$fn=6);
}
 
module shell(radius)
{
  difference()
  {
    hexagon(radius*1.4); // base, was 1.2
    scale([1, 1, 1.1]) hexagon(radius*0.98); // hole, rad was * 0.85
  }
}
 
module piece(radius)
{
  translate([0, 0, -radius/12])
  {
    scale([1,1,0.5])
    {
      hexagon(radius);
    }
  }
}
 
module shell_with_piece(radius)
{
  shell(radius);
  piece(radius);
}
 
function column_to_offset(column, offset) = (column % 2) * offset;
 
module translate_to_hex(x_coord, y_coord, hex_width)
{
  translate([x_coord*hex_width*1.75, y_coord*hex_width*2+column_to_offset(x_coord, hex_width), 0])
  {
    children(0);
  }
}

module replacementLattice(rows, columns, hex_width)
{
   translate_to_hex(3,0,hex_width) shell(hex_width);
   for (x = [1:5]) translate_to_hex(x,1,hex_width) shell(hex_width);
   for (x = [1:5]) translate_to_hex(x,2,hex_width) shell(hex_width);
   for (x = [1:5]) translate_to_hex(x,3,hex_width) shell(hex_width);
   for (x = [2:4]) translate_to_hex(x,4,hex_width) shell(hex_width);
}
 
module lattice(rows, columns, hex_width)
{
  for(x = [0:columns-1])
  {
    for(y = [0:rows-1])
    {
      translate_to_hex(x, y, hex_width)
      {
        shell(hex_width);
      }
    }
  }
}
 
linear_extrude(height=4)
{
  lattice(4, 5, 8);
 
  // translate_to_hex(2, 2, 4)
  // {
  //   piece(4);
  // }
}
