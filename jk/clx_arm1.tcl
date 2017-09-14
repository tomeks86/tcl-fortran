puts "clx1  ns nk mol kat "
puts "clx2  ns nk mol kat "
puts " ns - numer I slajdu"
puts "nk - numer ostatniego slajdu"
puts "mol - segname of surfactant molecule"
puts "kat - angle histogram value"

proc clx1 { ns nk mol kat } {

set dv1  [ veczero ]
set dv2  [ veczero ]
set vec1 [ veczero ]
set vec2 [ veczero ]
set vec3 [ veczero ]
set vec4 [ veczero ]
set dv   [ veczero ]
set ang1 0.0
set ang  0.0
set iang 0
set dim [expr 180.0/$kat ]
set dim [expr int($dim)] 
set licz1 0
set pi [expr 4.0*atan(1.0) ]
puts " $pi " 

for { set i 0 } { $i <= $dim } { incr i } {
    set rozklad($i) 0
}

for { set i $ns } { $i <= $nk } { incr i } {

      molinfo top set frame $i
      set atom1 [atomselect top "resname $mol and name C17 and resid <=100"]
      set atom2 [atomselect top "resname $mol and name C18 and resid <=100"]
      set atom3 [atomselect top "resname $mol and name C21 and resid <=100"]
      set atom4 [atomselect top "resname $mol and name C22 and resid <=100"]

foreach vec1 [$atom1 get {x y z} ] vec2 [$atom2 get {x y z} ] vec3 [$atom3 get {x y z} ] vec4 [$atom4 get {x y z} ] {

      set dv1 [ vecadd $vec2 $vec1 ] 
      set dv2 [ vecadd $vec4 $vec3 ] 
      set dv1 [ vecscale 0.5 $dv1  ]
      set dv2 [ vecscale 0.5 $dv2  ]
      set dv  [ vecsub $dv1 $dv2   ]
      set o1 [expr [vecdot $dv {0 0 1}]/[veclength $dv ]  ]
      set ang [expr acos($o1)*180.0/$pi ]
      set iang [expr int($ang/$kat) ]
      set ang1 [expr $ang1+ $ang]
      set rozklad($iang) [expr $rozklad($iang) + 1 ]
      set licz1 [expr $licz1 + 1 ]
}
}

puts " $licz1 " 
puts  " [expr $ang1/$licz1 ] "
set plik1 [open "clx1_orient.dat" w ]

for { set i 0 } { $i <= $dim} { incr i} {
    puts $plik1 " [expr $i*$kat]  [expr $rozklad($i).0/$licz1]  $i "
}
close $plik1

}



proc clx2 { ns nk mol kat } {

set dv1  [ veczero ]
set dv2  [ veczero ]
set vec1 [ veczero ]
set vec2 [ veczero ]
set vec3 [ veczero ]
set vec4 [ veczero ]
set dv   [ veczero ]
set ang1 0.0
set ang  0.0
set iang 0
set dim [expr 180.0/$kat ]
set dim [expr int($dim)] 
set licz1 0
set pi [expr 4.0*atan(1.0) ]
puts " $pi " 

for { set i 0 } { $i <= $dim } { incr i } {
    set rozklad($i) 0
}

for { set i $ns } { $i <= $nk } { incr i } {

      molinfo top set frame $i
      set atom1 [atomselect top "resname $mol and name C19 and resid <=100"]
      set atom2 [atomselect top "resname $mol and name C20 and resid <=100"]
      set atom3 [atomselect top "resname $mol and name C23 and resid <=100"]
      set atom4 [atomselect top "resname $mol and name C24 and resid <=100"]

foreach vec1 [$atom1 get {x y z} ] vec2 [$atom2 get {x y z} ] vec3 [$atom3 get {x y z} ] vec4 [$atom4 get {x y z} ] {

      set dv1 [ vecadd $vec2 $vec1 ] 
      set dv2 [ vecadd $vec4 $vec3 ] 
      set dv1 [ vecscale 0.5 $dv1  ]
      set dv2 [ vecscale 0.5 $dv2  ]
      set dv  [ vecsub $dv1 $dv2   ]
      set o1 [expr [vecdot $dv {0 0 1}]/[veclength $dv ]  ]
      set ang [expr acos($o1)*180.0/$pi ]
      set iang [expr int($ang/$kat) ]
      set ang1 [expr $ang1+ $ang]
      set rozklad($iang) [expr $rozklad($iang) + 1 ]
      set licz1 [expr $licz1 + 1 ]
}
}

puts " $licz1 " 
puts  " [expr $ang1/$licz1 ] "
set plik1 [open "clx2_orient.dat" w ]

for { set i 0 } { $i <= $dim} { incr i} {
    puts $plik1 " [expr $i*$kat]  [expr $rozklad($i).0/$licz1]  "
}
close $plik1

}
