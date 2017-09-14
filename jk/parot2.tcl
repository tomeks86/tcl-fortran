proc tilt_angle { ns nk m1 m2 mol} {

set licznik 0
set o1 0
set o2 0

for { set i $ns } { $i <= $nk } { incr i } {
    molinfo top set frame $i
    set atom1 [atomselect top "resname $mol and name C$m1 and resid > 100"]
    set atom2 [atomselect top "resname $mol and name C$m2 and resid > 100"]
     foreach r1 [ $atom1 get {x y z} ] r2 [ $atom2 get {x y z} ] {
      set r [vecsub $r2 $r1]
      set dz [ vecdot $r { 0.0 0.0 1.0 } ]
      set dy [ vecdot $r { 0.0 1.0 0.0 } ]
      set dx [ vecdot $r { 1.0 0.0 0.0 } ]
      set dr [ veclength $r ]
      set dw [expr sqrt($dx*$dx+$dy*$dy) ]
      set ss [expr $dy/$dw]
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
puts " tilt angle is equal to: [expr 180.0-$t1] "
puts "rotacyjne uporzadkowanie $rot "
}
