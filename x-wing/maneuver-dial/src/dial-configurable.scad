/* dial-configurable.scad
 *
 * Copyright (C) Robert B. Ross, 2014
 *
 * This software is released under the Creative Commons
 * Attribution-ShareAlike 4.0 International Public License.
 *
 */

Maneuver_1 = "1L"; // [0X: Stop, 1L: 1 Left Turn, 1l: 1 Left Bank, 1S: 1 Straight, 1r: 1 Right Bank, 1R: 1 Right Turn, 1K: 1 K-Turn, 2L: 2 Left Turn, 2l: 2 Left Bank, 2S: 2 Straight, 2r: 2 Right Bank, 2R: 2 Right Turn, 2K: 2 K-Turn, 3L: 3 Left Turn, 3l: 3 Left Bank, 3S: 3 Straight, 3r: 3 Right Bank, 3R: 3 Right Turn, 3K: 3 K-Turn, 4S: 4 Straight, 4K: 4 K-Turn, 5S: 5 Straight, 5K: 5 K-Turn ]
Maneuver_2 = "1R"; // [0X: Stop, 1L: 1 Left Turn, 1l: 1 Left Bank, 1S: 1 Straight, 1r: 1 Right Bank, 1R: 1 Right Turn, 1K: 1 K-Turn, 2L: 2 Left Turn, 2l: 2 Left Bank, 2S: 2 Straight, 2r: 2 Right Bank, 2R: 2 Right Turn, 2K: 2 K-Turn, 3L: 3 Left Turn, 3l: 3 Left Bank, 3S: 3 Straight, 3r: 3 Right Bank, 3R: 3 Right Turn, 3K: 3 K-Turn, 4S: 4 Straight, 4K: 4 K-Turn, 5S: 5 Straight, 5K: 5 K-Turn ]
Maneuver_3 = "2L"; // [0X: Stop, 1L: 1 Left Turn, 1l: 1 Left Bank, 1S: 1 Straight, 1r: 1 Right Bank, 1R: 1 Right Turn, 1K: 1 K-Turn, 2L: 2 Left Turn, 2l: 2 Left Bank, 2S: 2 Straight, 2r: 2 Right Bank, 2R: 2 Right Turn, 2K: 2 K-Turn, 3L: 3 Left Turn, 3l: 3 Left Bank, 3S: 3 Straight, 3r: 3 Right Bank, 3R: 3 Right Turn, 3K: 3 K-Turn, 4S: 4 Straight, 4K: 4 K-Turn, 5S: 5 Straight, 5K: 5 K-Turn ]
Maneuver_4 = "2l"; // [0X: Stop, 1L: 1 Left Turn, 1l: 1 Left Bank, 1S: 1 Straight, 1r: 1 Right Bank, 1R: 1 Right Turn, 1K: 1 K-Turn, 2L: 2 Left Turn, 2l: 2 Left Bank, 2S: 2 Straight, 2r: 2 Right Bank, 2R: 2 Right Turn, 2K: 2 K-Turn, 3L: 3 Left Turn, 3l: 3 Left Bank, 3S: 3 Straight, 3r: 3 Right Bank, 3R: 3 Right Turn, 3K: 3 K-Turn, 4S: 4 Straight, 4K: 4 K-Turn, 5S: 5 Straight, 5K: 5 K-Turn ]
Maneuver_5 = "2S"; // [0X: Stop, 1L: 1 Left Turn, 1l: 1 Left Bank, 1S: 1 Straight, 1r: 1 Right Bank, 1R: 1 Right Turn, 1K: 1 K-Turn, 2L: 2 Left Turn, 2l: 2 Left Bank, 2S: 2 Straight, 2r: 2 Right Bank, 2R: 2 Right Turn, 2K: 2 K-Turn, 3L: 3 Left Turn, 3l: 3 Left Bank, 3S: 3 Straight, 3r: 3 Right Bank, 3R: 3 Right Turn, 3K: 3 K-Turn, 4S: 4 Straight, 4K: 4 K-Turn, 5S: 5 Straight, 5K: 5 K-Turn ]
Maneuver_6 = "2r"; // [0X: Stop, 1L: 1 Left Turn, 1l: 1 Left Bank, 1S: 1 Straight, 1r: 1 Right Bank, 1R: 1 Right Turn, 1K: 1 K-Turn, 2L: 2 Left Turn, 2l: 2 Left Bank, 2S: 2 Straight, 2r: 2 Right Bank, 2R: 2 Right Turn, 2K: 2 K-Turn, 3L: 3 Left Turn, 3l: 3 Left Bank, 3S: 3 Straight, 3r: 3 Right Bank, 3R: 3 Right Turn, 3K: 3 K-Turn, 4S: 4 Straight, 4K: 4 K-Turn, 5S: 5 Straight, 5K: 5 K-Turn ]
Maneuver_7 = "2R"; // [0X: Stop, 1L: 1 Left Turn, 1l: 1 Left Bank, 1S: 1 Straight, 1r: 1 Right Bank, 1R: 1 Right Turn, 1K: 1 K-Turn, 2L: 2 Left Turn, 2l: 2 Left Bank, 2S: 2 Straight, 2r: 2 Right Bank, 2R: 2 Right Turn, 2K: 2 K-Turn, 3L: 3 Left Turn, 3l: 3 Left Bank, 3S: 3 Straight, 3r: 3 Right Bank, 3R: 3 Right Turn, 3K: 3 K-Turn, 4S: 4 Straight, 4K: 4 K-Turn, 5S: 5 Straight, 5K: 5 K-Turn ]
Maneuver_8 = "3L"; // [0X: Stop, 1L: 1 Left Turn, 1l: 1 Left Bank, 1S: 1 Straight, 1r: 1 Right Bank, 1R: 1 Right Turn, 1K: 1 K-Turn, 2L: 2 Left Turn, 2l: 2 Left Bank, 2S: 2 Straight, 2r: 2 Right Bank, 2R: 2 Right Turn, 2K: 2 K-Turn, 3L: 3 Left Turn, 3l: 3 Left Bank, 3S: 3 Straight, 3r: 3 Right Bank, 3R: 3 Right Turn, 3K: 3 K-Turn, 4S: 4 Straight, 4K: 4 K-Turn, 5S: 5 Straight, 5K: 5 K-Turn ]
Maneuver_9 = "3l"; // [0X: Stop, 1L: 1 Left Turn, 1l: 1 Left Bank, 1S: 1 Straight, 1r: 1 Right Bank, 1R: 1 Right Turn, 1K: 1 K-Turn, 2L: 2 Left Turn, 2l: 2 Left Bank, 2S: 2 Straight, 2r: 2 Right Bank, 2R: 2 Right Turn, 2K: 2 K-Turn, 3L: 3 Left Turn, 3l: 3 Left Bank, 3S: 3 Straight, 3r: 3 Right Bank, 3R: 3 Right Turn, 3K: 3 K-Turn, 4S: 4 Straight, 4K: 4 K-Turn, 5S: 5 Straight, 5K: 5 K-Turn ]
Maneuver_10 = "3S"; //[0X: Stop, 1L: 1 Left Turn, 1l: 1 Left Bank, 1S: 1 Straight, 1r: 1 Right Bank, 1R: 1 Right Turn, 1K: 1 K-Turn, 2L: 2 Left Turn, 2l: 2 Left Bank, 2S: 2 Straight, 2r: 2 Right Bank, 2R: 2 Right Turn, 2K: 2 K-Turn, 3L: 3 Left Turn, 3l: 3 Left Bank, 3S: 3 Straight, 3r: 3 Right Bank, 3R: 3 Right Turn, 3K: 3 K-Turn, 4S: 4 Straight, 4K: 4 K-Turn, 5S: 5 Straight, 5K: 5 K-Turn ]
Maneuver_11 = "3r"; // [0X: Stop, 1L: 1 Left Turn, 1l: 1 Left Bank, 1S: 1 Straight, 1r: 1 Right Bank, 1R: 1 Right Turn, 1K: 1 K-Turn, 2L: 2 Left Turn, 2l: 2 Left Bank, 2S: 2 Straight, 2r: 2 Right Bank, 2R: 2 Right Turn, 2K: 2 K-Turn, 3L: 3 Left Turn, 3l: 3 Left Bank, 3S: 3 Straight, 3r: 3 Right Bank, 3R: 3 Right Turn, 3K: 3 K-Turn, 4S: 4 Straight, 4K: 4 K-Turn, 5S: 5 Straight, 5K: 5 K-Turn ]
Maneuver_12 = "3R"; // [0X: Stop, 1L: 1 Left Turn, 1l: 1 Left Bank, 1S: 1 Straight, 1r: 1 Right Bank, 1R: 1 Right Turn, 1K: 1 K-Turn, 2L: 2 Left Turn, 2l: 2 Left Bank, 2S: 2 Straight, 2r: 2 Right Bank, 2R: 2 Right Turn, 2K: 2 K-Turn, 3L: 3 Left Turn, 3l: 3 Left Bank, 3S: 3 Straight, 3r: 3 Right Bank, 3R: 3 Right Turn, 3K: 3 K-Turn, 4S: 4 Straight, 4K: 4 K-Turn, 5S: 5 Straight, 5K: 5 K-Turn ]
Maneuver_13 = "3K"; // [0X: Stop, 1L: 1 Left Turn, 1l: 1 Left Bank, 1S: 1 Straight, 1r: 1 Right Bank, 1R: 1 Right Turn, 1K: 1 K-Turn, 2L: 2 Left Turn, 2l: 2 Left Bank, 2S: 2 Straight, 2r: 2 Right Bank, 2R: 2 Right Turn, 2K: 2 K-Turn, 3L: 3 Left Turn, 3l: 3 Left Bank, 3S: 3 Straight, 3r: 3 Right Bank, 3R: 3 Right Turn, 3K: 3 K-Turn, 4S: 4 Straight, 4K: 4 K-Turn, 5S: 5 Straight, 5K: 5 K-Turn ]
Maneuver_14 = "4S"; // [0X: Stop, 1L: 1 Left Turn, 1l: 1 Left Bank, 1S: 1 Straight, 1r: 1 Right Bank, 1R: 1 Right Turn, 1K: 1 K-Turn, 2L: 2 Left Turn, 2l: 2 Left Bank, 2S: 2 Straight, 2r: 2 Right Bank, 2R: 2 Right Turn, 2K: 2 K-Turn, 3L: 3 Left Turn, 3l: 3 Left Bank, 3S: 3 Straight, 3r: 3 Right Bank, 3R: 3 Right Turn, 3K: 3 K-Turn, 4S: 4 Straight, 4K: 4 K-Turn, 5S: 5 Straight, 5K: 5 K-Turn ]
Maneuver_15 = "5S"; // [0X: Stop, 1L: 1 Left Turn, 1l: 1 Left Bank, 1S: 1 Straight, 1r: 1 Right Bank, 1R: 1 Right Turn, 1K: 1 K-Turn, 2L: 2 Left Turn, 2l: 2 Left Bank, 2S: 2 Straight, 2r: 2 Right Bank, 2R: 2 Right Turn, 2K: 2 K-Turn, 3L: 3 Left Turn, 3l: 3 Left Bank, 3S: 3 Straight, 3r: 3 Right Bank, 3R: 3 Right Turn, 3K: 3 K-Turn, 4S: 4 Straight, 4K: 4 K-Turn, 5S: 5 Straight, 5K: 5 K-Turn ]
Maneuver_16 = "5K"; // [0X: Stop, 1L: 1 Left Turn, 1l: 1 Left Bank, 1S: 1 Straight, 1r: 1 Right Bank, 1R: 1 Right Turn, 1K: 1 K-Turn, 2L: 2 Left Turn, 2l: 2 Left Bank, 2S: 2 Straight, 2r: 2 Right Bank, 2R: 2 Right Turn, 2K: 2 K-Turn, 3L: 3 Left Turn, 3l: 3 Left Bank, 3S: 3 Straight, 3r: 3 Right Bank, 3R: 3 Right Turn, 3K: 3 K-Turn, 4S: 4 Straight, 4K: 4 K-Turn, 5S: 5 Straight, 5K: 5 K-Turn ]


/*
 * Local variables:
 *  mode: C
 *  c-indent-level: 4
 *  c-basic-offset: 4
 * End:
 *
 * vim: ts=8 sts=4 sw=4 expandtab
 */
