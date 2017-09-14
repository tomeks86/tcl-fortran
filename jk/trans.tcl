puts "trans1  ns nk mol " 
puts " "
puts "ns  - pierwszy slajd"
puts "nk  -  ostatni slajd"
puts "mol - nazwa segmentu"
puts " "
puts "opisuje DMPE - zmieniajac numeracje mozna uzyc do innych ukladow"
puts " "

proc trans1 { ns nk mol } {

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
      set atom1 [atomselect top "resname $mol and name C6 and resid <=100"]
      set atom2 [atomselect top "resname $mol and name C10 and resid <=100"]
      set atom3 [atomselect top "resname $mol and name C11 and resid <=100"]
      set atom4 [atomselect top "resname $mol and name C12 and resid <=100"]
      set atom5 [atomselect top "resname $mol and name C13 and resid <=100"]
      set atom6 [atomselect top "resname $mol and name C14 and resid <=100"]
      set atom7 [atomselect top "resname $mol and name C15 and resid <=100"]
      set atom8 [atomselect top "resname $mol and name C16 and resid <=100"]
      set atom9 [atomselect top "resname $mol and name C29 and resid <=100"]
      set atom10 [atomselect top "resname $mol and name C30 and resid <=100"]
      set atom11 [atomselect top "resname $mol and name C31 and resid <=100"]
      set atom12 [atomselect top "resname $mol and name C32 and resid <=100"]
      set atom13 [atomselect top "resname $mol and name C33 and resid <=100"]
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

      set o1a [expr [vecdot $dv1 $dv3]/([veclength $dv1 ]*[veclength $dv3])  ]
      set o1b [expr [vecdot $dv1 $dv5]/([veclength $dv1 ]*[veclength $dv5])  ]
      set o1c [expr [vecdot $dv1 $dv7]/([veclength $dv1 ]*[veclength $dv7])  ]
      set o1d [expr [vecdot $dv1 $dv9]/([veclength $dv1 ]*[veclength $dv9])  ]
      set o1e [expr [vecdot $dv1 $dv11]/([veclength $dv1 ]*[veclength $dv11])  ]

      set o2a [expr [vecdot $dv2 $dv4]/([veclength $dv2 ]*[veclength $dv4])  ]
      set o2b [expr [vecdot $dv2 $dv6]/([veclength $dv2 ]*[veclength $dv6])  ]
      set o2c [expr [vecdot $dv2 $dv8]/([veclength $dv2 ]*[veclength $dv8])  ]
      set o2d [expr [vecdot $dv2 $dv10]/([veclength $dv2 ]*[veclength $dv10])  ]
      set o2e [expr [vecdot $dv2 $dv12]/([veclength $dv2 ]*[veclength $dv12])  ]

      set o3a [expr [vecdot $dv3 $dv1]/([veclength $dv3 ]*[veclength $dv1])  ]
      set o3b [expr [vecdot $dv3 $dv5]/([veclength $dv3 ]*[veclength $dv5])  ]
      set o3c [expr [vecdot $dv3 $dv7]/([veclength $dv3 ]*[veclength $dv7])  ]
      set o3d [expr [vecdot $dv3 $dv9]/([veclength $dv3 ]*[veclength $dv9])  ]
      set o3e [expr [vecdot $dv3 $dv1]/([veclength $dv3 ]*[veclength $dv11])  ]

      set o4a [expr [vecdot $dv4 $dv6]/([veclength $dv4 ]*[veclength $dv6])  ]
      set o4b [expr [vecdot $dv4 $dv2]/([veclength $dv4 ]*[veclength $dv2])  ]
      set o4c [expr [vecdot $dv4 $dv8]/([veclength $dv4 ]*[veclength $dv8])  ]
      set o4d [expr [vecdot $dv4 $dv10]/([veclength $dv4 ]*[veclength $dv10])  ]
      set o4e [expr [vecdot $dv4 $dv12]/([veclength $dv4 ]*[veclength $dv12])  ]

      set o5a [expr [vecdot $dv5 $dv7]/([veclength $dv5 ]*[veclength $dv7])  ]
      set o5b [expr [vecdot $dv5 $dv3]/([veclength $dv5 ]*[veclength $dv3])  ]
      set o5c [expr [vecdot $dv5 $dv1]/([veclength $dv5 ]*[veclength $dv1])  ]
      set o5d [expr [vecdot $dv5 $dv9]/([veclength $dv5 ]*[veclength $dv9])  ]
      set o5e [expr [vecdot $dv5 $dv11]/([veclength $dv5 ]*[veclength $dv11])  ]

      set o6a [expr [vecdot $dv6 $dv8]/([veclength $dv6 ]*[veclength $dv8])  ]
      set o6b [expr [vecdot $dv6 $dv10]/([veclength $dv6 ]*[veclength $dv10])  ]
      set o6c [expr [vecdot $dv6 $dv12]/([veclength $dv6 ]*[veclength $dv12])  ]
      set o6d [expr [vecdot $dv6 $dv2]/([veclength $dv6 ]*[veclength $dv2])  ]
      set o6e [expr [vecdot $dv6 $dv4]/([veclength $dv6 ]*[veclength $dv4])  ]

      set o7a [expr [vecdot $dv7 $dv9]/([veclength $dv7 ]*[veclength $dv9])  ]
      set o7b [expr [vecdot $dv7 $dv11]/([veclength $dv7 ]*[veclength $dv11])  ]
      set o7c [expr [vecdot $dv7 $dv1]/([veclength $dv7 ]*[veclength $dv1])  ]
      set o7d [expr [vecdot $dv7 $dv3]/([veclength $dv7 ]*[veclength $dv3])  ]
      set o7e [expr [vecdot $dv7 $dv5]/([veclength $dv7 ]*[veclength $dv5])  ]

      set o8a [expr [vecdot $dv8 $dv10]/([veclength $dv8 ]*[veclength $dv10])  ]
      set o8b [expr [vecdot $dv8 $dv12]/([veclength $dv8 ]*[veclength $dv12])  ]
      set o8c [expr [vecdot $dv8 $dv2]/([veclength $dv8 ]*[veclength $dv2])  ]
      set o8d [expr [vecdot $dv8 $dv4]/([veclength $dv8 ]*[veclength $dv4])  ]
      set o8e [expr [vecdot $dv8 $dv6]/([veclength $dv8 ]*[veclength $dv6])  ]

      set o9a [expr [vecdot $dv9 $dv11]/([veclength $dv9 ]*[veclength $dv11])  ]
      set o9b [expr [vecdot $dv9 $dv1]/([veclength $dv9 ]*[veclength $dv1])  ]
      set o9c [expr [vecdot $dv9 $dv3]/([veclength $dv9 ]*[veclength $dv3])  ]
      set o9d [expr [vecdot $dv9 $dv5]/([veclength $dv9 ]*[veclength $dv5])  ]
      set o9e [expr [vecdot $dv9 $dv7]/([veclength $dv9 ]*[veclength $dv7])  ]

      set o10a [expr [vecdot $dv10 $dv12]/([veclength $dv10 ]*[veclength $dv12])  ]
      set o10b [expr [vecdot $dv10 $dv2]/([veclength $dv10 ]*[veclength $dv2])  ]
      set o10c [expr [vecdot $dv10 $dv4]/([veclength $dv10 ]*[veclength $dv4])  ]
      set o10d [expr [vecdot $dv10 $dv6]/([veclength $dv10 ]*[veclength $dv6])  ]
      set o10e [expr [vecdot $dv10 $dv8]/([veclength $dv10 ]*[veclength $dv8])  ]

      set o1 [expr ($o1a+$o1b+$o1c+$o1d+$o1e)/5]
      set o2 [expr ($o2a+$o2b+$o2c+$o2d+$o2e)/5]
      set o3 [expr ($o3a+$o3b+$o3c+$o3d+$o3e)/5]
      set o4 [expr ($o4a+$o4b+$o4c+$o4d+$o4e)/5]
      set o5 [expr ($o5a+$o5b+$o5c+$o5d+$o5e)/5]
      set o6 [expr ($o6a+$o6b+$o6c+$o6d+$o6e)/5]
      set o7 [expr ($o7a+$o7b+$o7c+$o7d+$o7e)/5]
      set o8 [expr ($o8a+$o8b+$o8c+$o8d+$o8e)/5]
      set o9 [expr ($o9a+$o9b+$o9c+$o9d+$o9e)/5]
      set o10 [expr ($o10a+$o10b+$o10c+$o10d+$o10e)/5]

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

      set licznik [expr $licznik+1]
}
}

set lord [ open "trans1all.dat" w ]
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
close $lord
set order [expr $order1+$order2+$order3+$order4+$order5+$order6]
set order [expr $order+$order7+$order8+$order9+$order10]
puts " calkowity parametr [expr $order/(10*$licznik)] "
}





proc trans2 { ns nk mol } {

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

      set o1a [expr [vecdot $dv1 $dv3]/([veclength $dv1 ]*[veclength $dv3])  ]
      set o1b [expr [vecdot $dv1 $dv5]/([veclength $dv1 ]*[veclength $dv5])  ]
      set o1c [expr [vecdot $dv1 $dv7]/([veclength $dv1 ]*[veclength $dv7])  ]
      set o1d [expr [vecdot $dv1 $dv9]/([veclength $dv1 ]*[veclength $dv9])  ]
      set o1e [expr [vecdot $dv1 $dv11]/([veclength $dv1 ]*[veclength $dv11])  ]

      set o2a [expr [vecdot $dv2 $dv4]/([veclength $dv2 ]*[veclength $dv4])  ]
      set o2b [expr [vecdot $dv2 $dv6]/([veclength $dv2 ]*[veclength $dv6])  ]
      set o2c [expr [vecdot $dv2 $dv8]/([veclength $dv2 ]*[veclength $dv8])  ]
      set o2d [expr [vecdot $dv2 $dv10]/([veclength $dv2 ]*[veclength $dv10])  ]
      set o2e [expr [vecdot $dv2 $dv12]/([veclength $dv2 ]*[veclength $dv12])  ]

      set o3a [expr [vecdot $dv3 $dv1]/([veclength $dv3 ]*[veclength $dv1])  ]
      set o3b [expr [vecdot $dv3 $dv5]/([veclength $dv3 ]*[veclength $dv5])  ]
      set o3c [expr [vecdot $dv3 $dv7]/([veclength $dv3 ]*[veclength $dv7])  ]
      set o3d [expr [vecdot $dv3 $dv9]/([veclength $dv3 ]*[veclength $dv9])  ]
      set o3e [expr [vecdot $dv3 $dv1]/([veclength $dv3 ]*[veclength $dv11])  ]

      set o4a [expr [vecdot $dv4 $dv6]/([veclength $dv4 ]*[veclength $dv6])  ]
      set o4b [expr [vecdot $dv4 $dv2]/([veclength $dv4 ]*[veclength $dv2])  ]
      set o4c [expr [vecdot $dv4 $dv8]/([veclength $dv4 ]*[veclength $dv8])  ]
      set o4d [expr [vecdot $dv4 $dv10]/([veclength $dv4 ]*[veclength $dv10])  ]
      set o4e [expr [vecdot $dv4 $dv12]/([veclength $dv4 ]*[veclength $dv12])  ]

      set o5a [expr [vecdot $dv5 $dv7]/([veclength $dv5 ]*[veclength $dv7])  ]
      set o5b [expr [vecdot $dv5 $dv3]/([veclength $dv5 ]*[veclength $dv3])  ]
      set o5c [expr [vecdot $dv5 $dv1]/([veclength $dv5 ]*[veclength $dv1])  ]
      set o5d [expr [vecdot $dv5 $dv9]/([veclength $dv5 ]*[veclength $dv9])  ]
      set o5e [expr [vecdot $dv5 $dv11]/([veclength $dv5 ]*[veclength $dv11])  ]

      set o6a [expr [vecdot $dv6 $dv8]/([veclength $dv6 ]*[veclength $dv8])  ]
      set o6b [expr [vecdot $dv6 $dv10]/([veclength $dv6 ]*[veclength $dv10])  ]
      set o6c [expr [vecdot $dv6 $dv12]/([veclength $dv6 ]*[veclength $dv12])  ]
      set o6d [expr [vecdot $dv6 $dv2]/([veclength $dv6 ]*[veclength $dv2])  ]
      set o6e [expr [vecdot $dv6 $dv4]/([veclength $dv6 ]*[veclength $dv4])  ]

      set o7a [expr [vecdot $dv7 $dv9]/([veclength $dv7 ]*[veclength $dv9])  ]
      set o7b [expr [vecdot $dv7 $dv11]/([veclength $dv7 ]*[veclength $dv11])  ]
      set o7c [expr [vecdot $dv7 $dv1]/([veclength $dv7 ]*[veclength $dv1])  ]
      set o7d [expr [vecdot $dv7 $dv3]/([veclength $dv7 ]*[veclength $dv3])  ]
      set o7e [expr [vecdot $dv7 $dv5]/([veclength $dv7 ]*[veclength $dv5])  ]

      set o8a [expr [vecdot $dv8 $dv10]/([veclength $dv8 ]*[veclength $dv10])  ]
      set o8b [expr [vecdot $dv8 $dv12]/([veclength $dv8 ]*[veclength $dv12])  ]
      set o8c [expr [vecdot $dv8 $dv2]/([veclength $dv8 ]*[veclength $dv2])  ]
      set o8d [expr [vecdot $dv8 $dv4]/([veclength $dv8 ]*[veclength $dv4])  ]
      set o8e [expr [vecdot $dv8 $dv6]/([veclength $dv8 ]*[veclength $dv6])  ]

      set o9a [expr [vecdot $dv9 $dv11]/([veclength $dv9 ]*[veclength $dv11])  ]
      set o9b [expr [vecdot $dv9 $dv1]/([veclength $dv9 ]*[veclength $dv1])  ]
      set o9c [expr [vecdot $dv9 $dv3]/([veclength $dv9 ]*[veclength $dv3])  ]
      set o9d [expr [vecdot $dv9 $dv5]/([veclength $dv9 ]*[veclength $dv5])  ]
      set o9e [expr [vecdot $dv9 $dv7]/([veclength $dv9 ]*[veclength $dv7])  ]

      set o10a [expr [vecdot $dv10 $dv12]/([veclength $dv10 ]*[veclength $dv12])  ]
      set o10b [expr [vecdot $dv10 $dv2]/([veclength $dv10 ]*[veclength $dv2])  ]
      set o10c [expr [vecdot $dv10 $dv4]/([veclength $dv10 ]*[veclength $dv4])  ]
      set o10d [expr [vecdot $dv10 $dv6]/([veclength $dv10 ]*[veclength $dv6])  ]
      set o10e [expr [vecdot $dv10 $dv8]/([veclength $dv10 ]*[veclength $dv8])  ]

      set o1 [expr ($o1a+$o1b+$o1c+$o1d+$o1e)/5]
      set o2 [expr ($o2a+$o2b+$o2c+$o2d+$o2e)/5]
      set o3 [expr ($o3a+$o3b+$o3c+$o3d+$o3e)/5]
      set o4 [expr ($o4a+$o4b+$o4c+$o4d+$o4e)/5]
      set o5 [expr ($o5a+$o5b+$o5c+$o5d+$o5e)/5]
      set o6 [expr ($o6a+$o6b+$o6c+$o6d+$o6e)/5]
      set o7 [expr ($o7a+$o7b+$o7c+$o7d+$o7e)/5]
      set o8 [expr ($o8a+$o8b+$o8c+$o8d+$o8e)/5]
      set o9 [expr ($o9a+$o9b+$o9c+$o9d+$o9e)/5]
      set o10 [expr ($o10a+$o10b+$o10c+$o10d+$o10e)/5]

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

      set licznik [expr $licznik+1]
}
}

set lord [ open "trans2all.dat" w ]
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
close $lord
set order [expr $order1+$order2+$order3+$order4+$order5+$order6]
set order [expr $order+$order7+$order8+$order9+$order10]
puts " calkowity parametr [expr $order/(10*$licznik)] "
}

