proc dipole { ns nk } {

set vec1 [ veczero ]
set licz1 0
set xd1 0.0
set yd1  0.0
set zd1 0.0
set mu1 0.0
set mux1 0.0
set muy1 0.0
set muz1 0.0
set muxsuma1 0.0
set muysuma1 0.0
set muzsuma1 0.0
set musuma1  0.0
#
set vec2 [ veczero ]
set licz2 0
set xd2 0.0
set yd2  0.0
set zd2 0.0
set mu2 0.0
set mux2 0.0
set muy2 0.0
set muz2 0.0
set muxsuma2 0.0
set muysuma2 0.0
set muzsuma2 0.0
set musuma2  0.0
#
for { set i $ns } { $i <= $nk } { incr i } {

      molinfo top set frame $i
      puts " frame No $i "
for { set j 1} {$j <= 100} {incr j} {
      set mol1 [atomselect top "resname mol1 and resid $j"]
      set qtot1 0.0
      set nat1 [$mol1 num]
if {$nat1 > 0 } {
foreach vec1 [$mol1 get {x y z} ] q1 [$mol1 get charge ] {

      set xd1  [expr [vecdot $vec1 {1 0 0}]  ]
      set yd1  [expr [vecdot $vec1 {0 1 0}]  ]
      set zd1  [expr [vecdot $vec1 {0 0 1}]  ]

      set mux1 [expr $mux1 + $xd1*$q1]
      set muy1 [expr $muy1 + $yd1*$q1]
      set muz1 [expr $muz1 + $zd1*$q1]
      set qtot1 [expr $qtot1 + $q1]
                                                         }
      set mu1 [expr sqrt($mux1*$mux1+$muy1*$muy1+$muz1*$muz1)]
#      puts " $j $mux1  $muy1  $muz1  ------ $mu1 ---- $qtot1 "
      set muxsuma1 [expr $muxsuma1 + $mux1] 
      set muysuma1 [expr $muysuma1 + $muy1] 
      set muzsuma1 [expr $muzsuma1 + $muz1] 
      set musuma1 [expr $musuma1+$mu1]

      set licz1 [expr $licz1 + 1 ]
      set mux1 0.0
      set muy1 0.0
      set muz1 0.0
               }
      set mol2 [atomselect top "resname mol2 and resid $j"]
      set qtot2 0.0
      set nat2 [$mol2 num]
if {$nat2 > 0 } {
foreach vec2 [$mol2 get {x y z} ] q2 [$mol2 get charge ] {

      set xd2  [expr [vecdot $vec2 {1 0 0}]  ]
      set yd2  [expr [vecdot $vec2 {0 1 0}]  ]
      set zd2  [expr [vecdot $vec2 {0 0 1}]  ]

      set mux2 [expr $mux2 + $xd2*$q2]
      set muy2 [expr $muy2 + $yd2*$q2]
      set muz2 [expr $muz2 + $zd2*$q2]
      set qtot2 [expr $qtot2 + $q2]
                                                         }
      set mu2 [expr sqrt($mux2*$mux2+$muy2*$muy2+$muz2*$muz2)]
#      puts " $j $mux2  $muy2  $muz2  ------ $mu2 ---- $qtot2 "
      set muxsuma2 [expr $muxsuma2 + $mux2] 
      set muysuma2 [expr $muysuma2 + $muy2] 
      set muzsuma2 [expr $muzsuma2 + $muz2] 
      set musuma2 [expr $musuma2+$mu2]

      set licz2 [expr $licz2 + 1 ]
      set mux2 0.0
      set muy2 0.0
      set muz2 0.0
               }
                                    } 
}

puts " -----------------------------------------------------------------------------"
puts " $licz1 " 
 set mux1 0.0
 set muy1 0.0
 set muz1 0.0
 set mu1  0.0
if { $licz1 > 0 } {
 set mux1 [expr 2.54*$muxsuma1/$licz1]
 puts  " $mux1  "
 set muy1 [expr 2.54*$muysuma1/$licz1]
 puts  " $muy1  "
 set muz1 [expr 2.54*$muzsuma1/$licz1]
 puts  " $muz1  "
 set mu1 [expr 2.54*$musuma1/$licz1]
 puts  " $mu1  "
                  }
puts " -----------------------------------------------------------------------------"
puts " $licz2 " 
 set mux2 0.0
 set muy2 0.0
 set muz2 0.0
 set mu2  0.0
if { $licz2 > 0 } {
set mux2 [expr 2.54*$muxsuma2/$licz2]
puts  " $mux2  "
set muy2 [expr 2.54*$muysuma2/$licz2]
puts  " $muy2  "
set muz2 [expr 2.54*$muzsuma2/$licz2]
puts  " $muz2  "
set mu2 [expr 2.54*$musuma2/$licz2]
puts  " $mu2  "
                  }
puts " -----------------------------------------------------------------------------"
set licz [expr $licz1+$licz2]
set mu [expr $mu1*$licz1.0/$licz.0 +$mu2*$licz2.0/$licz.0 ]
set mux [expr $mux1*$licz1.0/$licz.0 +$mux2*$licz2.0/$licz.0 ]
set muy [expr $muy1*$licz1.0/$licz.0 +$muy2*$licz2.0/$licz.0 ]
set muz [expr $muz1*$licz1.0/$licz.0 +$muz2*$licz2.0/$licz.0 ]
puts  " $mux  "
puts  " $muy  "
puts  " $muz  "
puts  " $mu  "
puts " -----------------------------------------------------------------------------"
set muz [expr abs($muz1)*$licz1.0/$licz.0 +abs($muz2)*$licz2.0/$licz.0 ]
puts  " $muz  "
}
