proc bcd { ns nk mol m1 m2 m3 m4 kat } {

set dv1  [ veczero ]
set dv2  [ veczero ]
set vec1 [ veczero ]
set vec2 [ veczero ]
set vec3 [ veczero ]
set vec4 [ veczero ]
set ang1sum 0.0
set ang1  0.0
set iang1 0
set ang2sum 0.0
set ang2  0.0
set iang2 0
set dim [expr 180.0/$kat ]
set dim [expr int($dim)] 
set licz1 0
set pi [expr 4.0*atan(1.0) ]
puts " $pi " 

for { set i 0 } { $i <= $dim } { incr i } {
    set rozklad1($i) 0
    set rozklad2($i) 0
}

for { set i $ns } { $i <= $nk } { incr i } {

      molinfo top set frame $i
      set atom1 [atomselect top "resname $mol and name C$m1 and resid <=100"]
      set atom2 [atomselect top "resname $mol and name C$m2 and resid <=100"]
      set atom3 [atomselect top "resname $mol and name C$m3 and resid <=100"]
      set atom4 [atomselect top "resname $mol and name C$m4 and resid <=100"]

foreach vec1 [$atom1 get {x y z} ] vec2 [$atom2 get {x y z} ] vec3 [$atom3 get {x y z} ] vec4 [$atom4 get {x y z} ] {

      set dv1 [ vecsub $vec2 $vec1 ] 
      set dv2 [ vecsub $vec4 $vec3 ] 
      set o1 [expr [vecdot $dv1 {0 0 1}]/[veclength $dv1 ]  ]
      set o2 [expr [vecdot $dv2 {0 0 1}]/[veclength $dv2 ]  ]
      set ang1 [expr acos($o1)*180.0/$pi ]
      set ang2 [expr acos($o2)*180.0/$pi ]
      set iang1 [expr int($ang1/$kat) ]
      set iang2 [expr int($ang2/$kat) ]
      set ang1sum [expr $ang1sum+ $ang1 ]
      set ang2sum [expr $ang2sum+ $ang2 ]
      set rozklad1($iang1) [expr $rozklad1($iang1) + 1 ]
      set rozklad2($iang2) [expr $rozklad2($iang2) + 1 ]
      set licz1 [expr $licz1 + 1 ]
}
}

puts " $licz1 " 
puts  " [expr $ang1sum/$licz1 ]  "
puts  " [expr $ang2sum/$licz1 ]  "
set plik1 [open "plik1.dat" w ]
set plik2 [open "plik2.dat" w ]

for { set i 0 } { $i <= $dim} { incr i} {
    puts $plik1 " [expr $i*$kat]  [expr $rozklad1($i).0/$licz1]   "
    puts $plik2 " [expr $i*$kat]  [expr $rozklad2($i).0/$licz1]   "
}
close $plik1
close $plik2

}
