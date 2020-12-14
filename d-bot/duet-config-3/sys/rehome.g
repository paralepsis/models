; rehome.g -- output some information on stall, then rehome X and Y
;
; Assumptions:
; - Print has already been paused
; - Either pause.g or X and Y home gcode handle ensuring we are
;   clear in the Z of any printed material.
;

; Announce the event
M291 P"Attempting recovery from stall." S0 T5

; Output possibly useful information
echo "Stall detected:"
echo "  Current position:", move.axes[0].letter, move.axes[0].userPosition, move.axes[1].letter, move.axes[1].userPosition, move.axes[2].letter, move.axes[2].userPosition
echo "  Current object:", job.build.currentObject, "[",job.build.objects[job.build.currentObject].name, "]"
echo "  Note: stall could have occurred on an object transition (?)."
echo "  Note: Use M496 P", job.build.currentObject, "to cancel the individual object."

; Actually rehome
echo "Rehoming and resuming."
G28 X Y
