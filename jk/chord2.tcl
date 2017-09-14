proc order_par { ns nk mol } {

set licznik 0
set dv1 [ veczero ]
set dv2 [ veczero ]
set v1 [ veczero ]
set v2 [ veczero ]
set v3 [ veczero ]
set v4 [ veczero ]
set order1 0.0
set order2 0.0

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
      foreach v1 [$atom1 get {x y z} ] v2 [$atom2 get {x y z} ] v3 [$atom3 get {x y z} ] v4 [$atom4 get {x y z} ] {

      set dv1 [vecsub $vec2 $vec1 ] 
      set dv2 [vecsub $vec4 $vec3 ] 
      set o1 [expr [vecdot $dv1 {0 0 1}]/[veclength $dv1 ]  ]
      set o2 [expr [vecdot $dv2 {0 0 1}]/[veclength $dv2 ]  ]
      set order1 [expr $order1 + (3*$o1*$o1-1.0)/2.0]
      set order2 [expr $order2 + (3*$o2*$o2-1.0)/2.0]
      set licznik [expr $licznik+1]
}
}
puts " $licznik " 
puts  " [expr $order1/$licznik ] [expr $order2/$licznik ]"

}
