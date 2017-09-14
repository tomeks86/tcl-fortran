# ns - numer pierwszego slajdu
# nk - numer ostatniego slajdu
# od z1 do z2 analizowana gestosc
# mol typ atomu
# masa masa grupy funkcyjnej
# zzz - liczba punktow na 1A
#
proc prf {ns nk z1 z2 res mol dz fout} {
set dz [expr $dz+0.]
set c [expr 1.0/$dz]
set dim [expr ($z2 - $z1 )*int($c)]
set ats {}
set mas {}
puts $res
for {set i 0} {$i<[llength $res]} {incr i} {
	foreach at [lindex $mol $i] {
		#puts "resname \"[lindex $res $i]\" and name $at"
		set sel [atomselect top "resname \"[lindex $res $i]\" and name $at"]
		#puts [$sel num]
		lappend ats $sel
		lappend mas [lindex [$sel get mass] 0]
	}
}
#puts $mas
#puts [llength $mas]
#puts [llength $ats]
#exit
#set zmienna [atomselect top "$mol"]
#set masa [measure sumweights $zmienna weight mass]
set masa [vecsum $mas]

puts "$ns $nk $z1 $z2 $masa"

for {set i 0} {$i <= $dim} {incr i} {
	set zdist($i) 0
	set dens($i) 0.0
}
set tmp [open tmp.dat w]
set nf [expr $nk - $ns + 1]
for {set i $ns} {$i <= $nk} {incr i} {
	molinfo top set frame $i
	#set aa [molinfo top get a]
	#set bb [molinfo top get b]
	#set cc [molinfo top get c]
	lassign [molinfo top get {a b c}] aa bb cc
	puts "ramka: $i; wymiar pudelka: $aa $bb $cc "
	foreach at $ats ms $mas {
		foreach zz [$at get z]  {
			if {$zz >= $z1 & $zz <= $z2} {
				set pozycja [expr ($zz - $z1) * int($c)]
				set pozycja [expr int($pozycja)]
				set zdist($pozycja) [expr $zdist($pozycja) + $ms]
			}
		}
	}
	set dV [expr $aa*$bb*$dz]
	for {set j 0} {$j <= $dim} {incr j} {
		puts $tmp $dV
		set dens($j) [expr $dens($j) + $zdist($j)*1.66054/$dV]
		set zdist($j) 0.
	}
}
close $tmp
set plik1 [open $fout w]
for {set i 0} {$i <= $dim} {incr i} {
	puts $plik1 " [expr ($i+.5)*$dz+$z1]  [expr $dens($i)/$nf ]" ;# $zdist($i) "
}
close $plik1

}
