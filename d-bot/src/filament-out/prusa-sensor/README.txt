I wanted a filament out sensor that I thought would be reliable and easy to build from available parts. I didn't want the fancy features available in many such sensors because I didn't want to deal with configuration parameters, and simple versions that use just a switch didn't seem that robust, at least the ones I found.

This is an IR filament sensor derived from the Prusa MK3S IR Filament
Sensor, which relies on a sort of "beam cutter" approach that only
catches filament out but ought to be quite reliable:
  https://help.prusa3d.com/en/article/ir-filament-sensor-mk2-5s-mk3s_112214
  https://www.prusa3d.com/downloads/others/Original-Prusa-i3-MK3S.zip

The STLs from Prusa are released under a GNU GPL v3 license, so that's
the license for these parts also.

In addition to the printable parts, you will need a MK3S sensor kit (e.g.,
https://smile.amazon.com/IR-Sensor-Filament-Magnets-Printer-Upgrade/dp/B07PYQWGK1
), as well as two M3x35mm screws, a couple of M3 heat set inserts, and a button head M5x10 bolt to attach to the frame.

I use McMaster heat set inserts (94180A333), which are awesome. In fact, the design is such that someone could modify the "sensor mount.stl" part to use something other than heat set inserts, or to mount in a different manner, but I'm not going to spend more time on this.

