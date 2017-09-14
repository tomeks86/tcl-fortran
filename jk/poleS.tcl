proc surf { ns} {
set mol1 [atomselect top all]
set nf [molinfo top get numframes]
set suma2 0
set suma3 0
for { set i $ns } { $i <= [expr $nf-1] } { incr i } {
$mol1 frame $i
molinfo top set frame $i
set aa [molinfo top  get a]
set bb [molinfo top  get b]
set cc [molinfo top  get c]

set area [expr $aa*$bb]
set volu [expr $aa*$bb*$cc]
set suma2 [expr $suma2+$area]
set suma3 [expr $suma3+$volu]
puts "klatka $i powierzchnia: $area objetosc: $volu "
}
puts [expr $suma2/($nf-$ns+1)]
puts [expr $suma3/($nf-$ns+1)]
}
