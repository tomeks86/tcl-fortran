proc order_par3 { ns nk mol } {

set licznik 0

set dv1  [ veczero ]
set dv2  [ veczero ]
set dv3  [ veczero ]
set dv4  [ veczero ]
set dv5  [ veczero ]
set dv6  [ veczero ]
set dv7  [ veczero ]
set dv8  [ veczero ]
set dv9  [ veczero ]
set dv10 [ veczero ]
set dv11 [ veczero ]
set dv12 [ veczero ]

set v1  [ veczero ]
set v2  [ veczero ]
set v3  [ veczero ]
set v4  [ veczero ]
set v5  [ veczero ]
set v6  [ veczero ]
set v7  [ veczero ]
set v8  [ veczero ]
set v9  [ veczero ]
set v10 [ veczero ]
set v11 [ veczero ]
set v12 [ veczero ]
set v13 [ veczero ]

set order1  0.0
set order2  0.0
set order3  0.0
set order4  0.0
set order5  0.0
set order6  0.0
set order7  0.0
set order8  0.0
set order9  0.0
set order10 0.0
set order11 0.0
set order12 0.0

for { set i $ns } { $i <= $nk } { incr i } {
      molinfo top set frame $i
      set atom1 [atomselect top "resname $mol and name C9 and resid <=100"]
      set atom2 [atomselect top "resname $mol and name C17 and resid <=100"]
      set atom3 [atomselect top "resname $mol and name C18 and resid <=100"]
      set atom4 [atomselect top "resname $mol and name C19 and resid <=100"]
      set atom5 [atomselect top "resname $mol and name C20 and resid <=100"]
      set atom6 [atomselect top "resname $mol and name C21 and resid <=100"]
      set atom7 [atomselect top "resname $mol and name C22 and resid <=100"]
      set atom8 [atomselect top "resname $mol and name C23 and resid <=100"]
      set atom9 [atomselect top "resname $mol and name C24 and resid <=100"]
      set atom10 [atomselect top "resname $mol and name C25 and resid <=100"]
      set atom11 [atomselect top "resname $mol and name C26 and resid <=100"]
      set atom12 [atomselect top "resname $mol and name C27 and resid <=100"]
      set atom13 [atomselect top "resname $mol and name C28 and resid <=100"]
      puts " $i -frame "

foreach v1 [$atom1 get {x y z} ] v2 [$atom2 get {x y z} ] v3 [$atom3 get {x y z} ] v4 [$atom4 get {x y z} ] v5 [$atom5 get {x y z} ] v6 [$atom6 get {x y z} ] v7 [$atom7 get {x y z} ] v8 [$atom8 get {x y z} ] v9 [$atom9 get {x y z} ] v10 [$atom10 get {x y z} ] v11 [$atom11 get {x y z} ] v12 [$atom12 get {x y z} ] v13 [$atom13 get {x y z} ]  {

      set dv1  [vecsub $v2 $v1 ] 
      set dv2  [vecsub $v3 $v2 ] 
      set dv3  [vecsub $v4 $v3 ] 
      set dv4  [vecsub $v5 $v4 ] 
      set dv5  [vecsub $v6 $v5 ] 
      set dv6  [vecsub $v7 $v6 ] 
      set dv7  [vecsub $v8 $v7 ] 
      set dv8  [vecsub $v9 $v8 ] 
      set dv9  [vecsub $v10 $v9 ] 
      set dv10 [vecsub $v11 $v10 ] 
      set dv11 [vecsub $v12 $v11 ] 
      set dv12 [vecsub $v13 $v12 ] 

      set o1 [expr [vecdot $dv1 {0 0 1}]/[veclength $dv1 ]  ]
      set o2 [expr [vecdot $dv2 {0 0 1}]/[veclength $dv2 ]  ]
      set o3 [expr [vecdot $dv3 {0 0 1}]/[veclength $dv3 ]  ]
      set o4 [expr [vecdot $dv4 {0 0 1}]/[veclength $dv4 ]  ]
      set o5 [expr [vecdot $dv5 {0 0 1}]/[veclength $dv5 ]  ]
      set o6 [expr [vecdot $dv6 {0 0 1}]/[veclength $dv6 ]  ]
      set o7 [expr [vecdot $dv7 {0 0 1}]/[veclength $dv7 ]  ]
      set o8 [expr [vecdot $dv8 {0 0 1}]/[veclength $dv8 ]  ]
      set o9 [expr [vecdot $dv9 {0 0 1}]/[veclength $dv9 ]  ]
      set o10 [expr [vecdot $dv10 {0 0 1}]/[veclength $dv10 ]  ]
      set o11 [expr [vecdot $dv11 {0 0 1}]/[veclength $dv11 ]  ]
      set o12 [expr [vecdot $dv12 {0 0 1}]/[veclength $dv12 ]  ]

      set order1 [expr $order1 + (3*$o1*$o1-1.0)/2.0]
      set order2 [expr $order2 + (3*$o2*$o2-1.0)/2.0]
      set order3 [expr $order3 + (3*$o3*$o3-1.0)/2.0]
      set order4 [expr $order4 + (3*$o4*$o4-1.0)/2.0]
      set order5 [expr $order5 + (3*$o5*$o5-1.0)/2.0]
      set order6 [expr $order6 + (3*$o6*$o6-1.0)/2.0]
      set order7 [expr $order7 + (3*$o7*$o7-1.0)/2.0]
      set order8 [expr $order8 + (3*$o8*$o8-1.0)/2.0]
      set order9 [expr $order9 + (3*$o9*$o9-1.0)/2.0]
      set order10 [expr $order10 + (3*$o10*$o10-1.0)/2.0]
      set order11 [expr $order11 + (3*$o11*$o11-1.0)/2.0]
      set order12 [expr $order12 + (3*$o12*$o12-1.0)/2.0]

      set licznik [expr $licznik+1]
}
}
set lord [ open "lord2.dat" w ]
puts " $licznik " 
puts  $lord " 1 [expr $order1/$licznik ] "
puts  $lord " 2 [expr $order2/$licznik ] "
puts  $lord " 3 [expr $order3/$licznik ] "
puts  $lord " 4 [expr $order4/$licznik ] "
puts  $lord " 5 [expr $order5/$licznik ] "
puts  $lord " 6 [expr $order6/$licznik ] "
puts  $lord " 7 [expr $order7/$licznik ] "
puts  $lord " 8 [expr $order8/$licznik ] "
puts  $lord " 9 [expr $order9/$licznik ] "
puts  $lord " 10 [expr $order10/$licznik ] "
puts  $lord " 11 [expr $order11/$licznik ] "
puts  $lord " 12 [expr $order12/$licznik ] "
close $lord
}
