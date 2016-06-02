/* shanty-2.scad
 *
 * Copyright (C) Robert B. Ross, 2016
 *
 * This software is released under the Creative Commons
 * Attribution-ShareAlike 4.0 International Public License.
 */

use <shanty-2a.scad>
use <shanty-2b.scad>

shanty2A();
translate([-92,-30,0]) shanty2B();
