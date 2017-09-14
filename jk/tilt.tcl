proc tilt_angle { ns nk j1 j2 m1 m2} {

set licznik 0
set o1 0

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
      set dr [expr ($dx*$dx+$dy*$dy+$dz*$dz)**0.5]
      set cc [expr $dz/$dr]
      set o1 [expr $o1+$cc]
      set licznik [expr $licznik+1]

}

}
set order [expr $o1/$licznik]
puts " $order "
set pi [expr 4.0*atan(1.0)]
set t1 [expr acos($order)*180/$pi]
puts " tilt angle is equal to: $t1 "
}
