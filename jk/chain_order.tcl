proc order_par { ns nk m1 j1 j2} {

set licznik 0
set o1 0

for { set i $ns } { $i <= $nk } { incr i } {
      molinfo top set frame $i
set atom1 [atomselect top "resname mol1 and resid $m1 and name C$j1"]
set atom2 [atomselect top "resname mol1 and resid $m1 and name C$j2"]
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
      set ss [expr (3*$cc*$cc-1.0)/2.0]
      set o1 [expr $o1+$ss]
      set licznik [expr $licznik+1]
      puts " $licznik :  $ss "

}
set order [expr $o1/$licznik]
puts " $order "
}
