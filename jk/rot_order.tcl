proc tilt_angle { ns nk j1 j2 m1 m2} {

set licznik 0
set o1 0
set o2 0

for { set i $ns } { $i <= $nk } { incr i } {
      molinfo top set frame $i
for { set j $j1 } { $j <= $j2 } { incr j } {

set atom1 [atomselect top "resid $j and name C$m1 and not waters"]
set atom2 [atomselect top "resid $j and name C$m2 and not waters"]
      set x1 [$atom1 get x]
      set x2 [$atom2 get x]
      set y1 [$atom1 get y]
      set y2 [$atom2 get y]
      set z1 [$atom1 get z]
      set z2 [$atom2 get z]
      set dx [expr $x2-$x1]
      set dy [expr $y2-$y1]
      set dz [expr $z2-$z1]
      set dw [expr sqrt($dx*$dx+$dy*$dy) ]
      set ss [expr $dy/$dw]
      set dr [expr sqrt($dx*$dx+$dy*$dy+$dz*$dz) ]
      set cc [expr $dz/$dr]
      set o1 [expr $o1+$cc]
      set o2 [expr $o2+(2*$ss*$ss-1)]
      set licznik [expr $licznik+1]

}

}
set order [expr $o1/$licznik]
set rot [expr $o2/$licznik]
puts " $order "
puts " wczytano $licznik czasteczek"
set pi [expr 4.0*atan(1.0)]
set t1 [expr acos($order)*180/$pi]
puts " tilt angle is equal to: $t1 "
puts "rotacyjne uporzadkowanie $rot "
}
