proc prf { ns nk z1 z2  masa } {
set dim [ expr ( $z2 - $z1 )*10  ]

for { set i 0 } { $i <= $dim } { incr i } {
set zdist($i) 0
set dens($i) 0.0
                                      } 

set zmienna [atomselect top "type OT" ]
set nf [expr $nk - $ns + 1 ]

for { set i $ns } { $i <= $nk } { incr i } {
      molinfo top set frame $i
      set aa [molinfo top get a]
      set bb [molinfo top get b]
      set cc [molinfo top get c]
foreach zz [ $zmienna get z ]  {

if { $zz >= $z1 & $zz <= $z2 } {
 set pozycja [expr ($zz - $z1) * 10]
 set zdist($pozycja) [ expr $zdist($pozycja) + 1 ]
                           }
                               }
set vv [expr $aa*$bb*0.1*$masa ]
for {set j 0} { $j <= $dim } {incr j} {
set dens($j) [ expr $dens($j) + $zdist($j)*$vv ]
set zdist($j) 0
                                    } 
}

set plik1 [open profil.dat w ]
for {set i 0} { $i <= $dim  } {incr i} {
puts $plik1 " [expr $i*0.1+$z1 [expr $dens($i)/$nf ] "
} 

close $plik1
}
