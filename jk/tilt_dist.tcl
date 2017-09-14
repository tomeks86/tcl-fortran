proc tilt_rot { ns nk j1 j2 m1 m2 obiekt} {

set pi [expr 4.0*atan(1.0)]
set licznik 0
set o1 0
set o2 0
set mol1 $obiekt 

for { set i 0 } { $i <=30 } { incr i } {
set dist($i) 0
}

for { set i $ns } { $i <= $nk } { incr i } {
      molinfo top set frame $i
for { set j $j1 } { $j <= $j2 } { incr j } {

     set atom1 [atomselect top "resid $j and name C$m1 and not waters"]
     set atom2 [atomselect top "resid $j and name C$m2 and not waters"]
     set czy [$atom1 get resname]
     if { $czy == $mol1 } {
         set x1 [$atom1 get x]
         set x2 [$atom2 get x]
         set y1 [$atom1 get y]
         set y2 [$atom2 get y]
         set z1 [$atom1 get z]
         set z2 [$atom2 get z]
         set dx [expr $x2-$x1]
         set dy [expr $y2-$y1]
         set dz [expr $z2-$z1]
         set dw [expr sqrt($dx*$dx+$dy*$dy)]
         set ss [expr $dy/$dw]
         set dr [expr sqrt($dx*$dx+$dy*$dy+$dz*$dz)]
         set cc [expr $dz/$dr]

         set angle [expr acos($cc)*180/$pi ]
          if { $angle > 170} {
            set dist(17) [expr $dist(17)+1]
          } elseif {$angle >160} {
            set dist(16) [expr $dist(16)+1]
          } elseif {$angle >150} {
            set dist(15) [expr $dist(15)+1]
          } elseif {$angle >140} {
            set dist(14) [expr $dist(14)+1]
          } elseif {$angle >130} {
            set dist(13) [expr $dist(13)+1]
          } elseif {$angle >120} {
            set dist(12) [expr $dist(12)+1]
          } elseif {$angle >110} {
            set dist(11) [expr $dist(11)+1]
          } elseif {$angle >100} {
            set dist(10) [expr $dist(10)+1]
          } elseif {$angle >90} {
            set dist(9) [expr $dist(9)+1]
          } elseif {$angle >80} {
            set dist(8) [expr $dist(8)+1]
          } elseif {$angle >70} {
            set dist(7) [expr $dist(7)+1]
          } elseif {$angle >60} {
            set dist(6) [expr $dist(6)+1]
          } elseif {$angle >50} {
            set dist(5) [expr $dist(5)+1]
          } elseif {$angle >40} {
            set dist(4) [expr $dist(4)+1]
          } elseif {$angle >30} {
            set dist(3) [expr $dist(3)+1]
          } elseif {$angle >20} {
            set dist(2) [expr $dist(2)+1]
          } elseif {$angle >10} {
            set dist(1) [expr $dist(1)+1]
          } else {
            set dist(0) [expr $dist(0)+1]
          }

         set o1 [expr $o1+$cc]
         set o2 [expr $o2+(2*$ss*$ss-1)]
         set licznik [expr $licznik+1]
                      }

}

}

for { set i 0 } { $i <=15 } { incr i } {
puts " $dist($i) "
}

set order [expr $o1/$licznik]
set rot [expr $o2/$licznik]
puts " $order "
puts " wczytano $licznik czasteczek"
set t1 [expr acos($order)*180/$pi]
puts " tilt angle is equal to: $t1 [expr 180.0-$t1] "
puts "rotacyjne uporzadkowanie $rot "
}
