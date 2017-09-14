# ns - numer pierwszego slajdu
# nk - numer ostatniego slajdu
# od z1 do z2 analizowana gestosc
# mol typ atomu
# masa masa grupy funkcyjnej
# zzz - liczba punktow na 1A
#
proc prf { ns nk z1 z2  mol masa zzz fout} {
set dz $zzz
set c [expr 1.0/$dz]
set dim [ expr ( $z2 - $z1 )*int($c)  ]
puts $dim
puts " $ns $nk $z1 $z2 $masa "

for { set i 0 } { $i <= $dim } { incr i } {
set zdist($i) 0
set dens($i) 0.0
                                      }

set zmienna [atomselect top "type $mol " ]
set nf [expr $nk - $ns + 1 ]
#set tmp [open tmp2.dat w]
for { set i $ns } { $i <= $nk } { incr i } {
      molinfo top set frame $i
      set aa [molinfo top get a]
      set bb [molinfo top get b]
      set cc [molinfo top get c]
puts " wymiar pudelka: $aa $bb $cc "
foreach zz [ $zmienna get z ]  {
if { $zz >= $z1 & $zz <= $z2 } {
 set pozycja [expr ($zz - $z1) * int($c)]
 set pozycja [expr int($pozycja)]
 set zdist($pozycja) [ expr $zdist($pozycja) + 1 ]
                           }
}
set vv [expr $aa*$bb*$dz ]
for {set j 0} { $j <= $dim } {incr j} {
set dens($j) [ expr $dens($j) + $zdist($j)*$masa*1.66054/$vv ]
set zdist($j) 0


}
}
#close $tmp
set plik1 [open $fout w]
for {set i 0} { $i <= $dim  } {incr i} {
puts $plik1 " [expr ($i+.5)*$dz+$z1]  [expr $dens($i)/$nf ]";# $zdist($i) "
}
close $plik1
}
