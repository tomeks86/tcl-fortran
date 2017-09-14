proc bcd { ns nk } {

set vec1 [ veczero ]
set licz1 0
set xd 0.0
set yd  0.0
set zd 0.0
set mu 0.0
set mux 0.0
set muy 0.0
set muz 0.0
set muxsuma 0.0
set muysuma 0.0
set muzsuma 0.0
set musuma  0.0


for { set i $ns } { $i <= $nk } { incr i } {

      molinfo top set frame $i
      puts " frame No $i "
for { set j 1} {$j <= 100} {incr j} {
      set mol1 [atomselect top "resname mol1 and resid $j"]
      set qtot 0.0
      set nat [$mol1 num]
if {$nat > 0 } {
foreach vec1 [$mol1 get {x y z} ] q1 [$mol1 get charge ] {

      set xd  [expr [vecdot $vec1 {1 0 0}]  ]
      set yd  [expr [vecdot $vec1 {0 1 0}]  ]
      set zd  [expr [vecdot $vec1 {0 0 1}]  ]

      set mux [expr $mux + $xd*$q1]
      set muy [expr $muy + $yd*$q1]
      set muz [expr $muz + $zd*$q1]
      set qtot [expr $qtot + $q1]
                                                         }
      set mu [expr sqrt($mux*$mux+$muy*$muy+$muz*$muz)]
      puts " $j $mux  $muy  $muz  ------ $mu ---- $qtot "
      set muxsuma [expr $muxsuma + $mux] 
      set muysuma [expr $muysuma + $muy] 
      set muzsuma [expr $muzsuma + $muz] 
      set musuma [expr $musuma+$mu]

      set licz1 [expr $licz1 + 1 ]
      set mux 0.0
      set muy 0.0
      set muz 0.0
               }
                                    } # koniec sumy po j
}

puts " $licz1 " 
puts  " [expr 2.54*$muxsuma/$licz1 ]  "
puts  " [expr 2.54*$muysuma/$licz1 ]  "
puts  " [expr 2.54*$muzsuma/$licz1 ]  "
puts  " [expr 2.54*$musuma/$licz1 ]  "


}
