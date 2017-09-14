# ns - numer pierwszego slajdu
# nk - numer ostatniego slajdu
# od z1 do z2 analizowana gestosc
# mol typ atomu
# masa masa grupy funkcyjnej
# zzz - liczba punktow na 1A
# DBDX
proc prfcq {ns nk z1 z2 zzz fout} {
set dz $zzz
set c [expr 1.0/$dz]
set dim [expr ($z2 - $z1 )*int($c)]
set ats {}
set mas {76. 76.}
#foreach at $mol {
#	puts $at
#	set sel [atomselect top "$res and name $at"]
#	lappend ats $sel
##	lappend mas [lindex [$sel get mass] 0]
#}
#if {$res != DBDX} {
#	error "musi być DBDX"
#}
set r1 "C1 C2 C3 C4 C5 C14"
set r2 "C7 C8 C9 C10 C11 C12"
#puts $mas
#set zmienna [atomselect top "$mol"]
#set masa [measure sumweights $zmienna weight mass]
set masa 76.
#set ns 0
#set nk [molinfo top get numframes]

puts "$ns $nk $z1 $z2 $masa"

for {set i 0} {$i <= $dim} {incr i} {
	set zdist($i) 0
	set dens($i) 0.0
}

#set nf [expr $nk - $ns + 1 ]
for {set i $ns} {$i <= $nk} {incr i} {
	molinfo top set frame $i
	#set aa [molinfo top get a]
	#set bb [molinfo top get b]
	#set cc [molinfo top get c]
	lassign [molinfo top get {a b c}] aa bb cc
	puts "ramka: $i; wymiar pudelka: $aa $bb $cc "
	set residues [[atomselect top "resname DBDX and name O6"] get residue]
	set cqs {}
	foreach r $residues {
		lappend cqs [measure center [atomselect top "name $r1 and residue $r"]]
		lappend cqs [measure center [atomselect top "name $r2 and residue $r"]]
	}
	foreach cq $cqs {
		set zz [lindex $cq 2]
		if {$zz >= $z1 & $zz <= $z2} {
			set pozycja [expr ($zz - $z1) * int($c)]
			set pozycja [expr int($pozycja)]
			set zdist($pozycja) [ expr $zdist($pozycja) + 1 ]
		}		
	}
	set vv [expr $aa*$bb*$dz]
	for {set j 0} { $j <= $dim } {incr j} {
		set dens($j) [ expr $dens($j) + $zdist($j)*$masa*1.66054/$vv ]
		set zdist($j) 0
	}
}

set plik1 [open $fout w]
for {set i 0} {$i <= $dim} {incr i} {
	puts $plik1 " [expr $i*$dz+$z1]  [expr $dens($i)/$nf ] $zdist($i) "
}
close $plik1

}
