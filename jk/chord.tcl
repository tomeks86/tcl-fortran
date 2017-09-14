proc order_par { ns nk k1 k2 k3 k4 mol } {

set licznik 0
set dv1 [ veczero ]
set dv2 [ veczero ]
set vec1 [ veczero ]
set vec2 [ veczero ]
set vec3 [ veczero ]
set vec4 [ veczero ]
set order1 0.0
set order2 0.0

for { set i $ns } { $i <= $nk } { incr i } {
      molinfo top set frame $i
      set atom1 [atomselect top "resname $mol and name C$k1 and resid <=100"]
      set atom2 [atomselect top "resname $mol and name C$k2 and resid <=100"]
      set atom3 [atomselect top "resname $mol and name C$k3 and resid <=100"]
      set atom4 [atomselect top "resname $mol and name C$k4 and resid <=100"]
      foreach vec1 [$atom1 get {x y z} ] vec2 [$atom2 get {x y z} ] vec3 [$atom3 get {x y z} ] vec4 [$atom4 get {x y z} ] {

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
