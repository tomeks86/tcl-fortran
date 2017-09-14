proc order_par { ns nk j1 j2 mol } {

set licznik 0

set l1(1)  C6
set l1(2)  C10
set l1(3)  C11
set l1(4)  C12 
set l1(5)  C13
set l1(6)  C14
set l1(7)  C15
set l1(8)  C16
set l1(9)  C29
set l1(10) C30 
set l1(11) C31
set l1(12) C32
set l1(13) C33 

set l2(1)  C9
set l2(2)  C17
set l2(3)  C18
set l2(4)  C19 
set l2(5)  C20
set l2(6)  C21
set l2(7)  C22
set l2(8)  C23
set l2(9)  C24
set l2(10) C25 
set l2(11) C26
set l2(12) C27
set l2(13) C28

set mol1 $mol
set dv1 [ veczero ]
set dv2 [ veczero ]
set vec1 [ veczero ]
set vec2 [ veczero ]
set vec3 [ veczero ]
set vec4 [ veczero ]

for {set i 1} { $i <=13 } {incr i} {
set order1($i) 0.0
set order2($i) 0.0
                                   } 

for { set i $ns } { $i <= $nk } { incr i } {
      puts " klatka nr $i "
      molinfo top set frame $i
for { set j $j1 } { $j <= $j2 } { incr j } {
for { set k 1 } { $k <=12} { incr k } {
     set atom1 [atomselect top "resid $j and name $l1($k) and not waters"]
     set czy [$atom1 get resname]
     if { $czy == $mol1 } {
     set atom2 [atomselect top "resid $j and name $l1([expr $k+1]) and not waters"]
     set atom3 [atomselect top "resid $j and name $l2($k) and not waters"]
     set atom4 [atomselect top "resid $j and name $l2([expr $k+1]) and not waters"]
      foreach vec1 [$atom1 get {x y z} ] vec2 [$atom2 get {x y z} ] vec3 [$atom3 get {x y z} ] vec4 [$atom4 get {x y z} ] {

      set dv1 [vecsub $vec2 $vec1 ] 
      set dv2 [vecsub $vec4 $vec3 ] 
      set o1 [expr [vecdot $dv1 {0 0 1}]/[veclength $dv1 ]  ]
      set o2 [expr [vecdot $dv2 {0 0 1}]/[veclength $dv2 ]  ]
      set order1($k) [expr $order1($k) + (3*$o1*$o1-1.0)/2.0]
      set order2($k) [expr $order2($k) + (3*$o2*$o2-1.0)/2.0]
      if {$k == 1} {
            set licznik [expr $licznik+1]
            }
}
                          }

}
}
}
puts " $licznik " 
set plik1 [ open "order_par.dat" w ]
for {set i 1} { $i <13 } {incr i} {
puts $plik1 " $i [expr $order1($i)/$licznik ] [expr $order2($i)/$licznik ]"
} 

close $plik1
}
