proc zerowanie {zet} {
	set sel [atomselect top "water and (z>$zet or z<-$zet) and type OH2"]
	foreach n [$sel get residue] {
		puts $n
		set s [atomselect top "residue $n"]
		set Z [lindex [$s get z] 0]
		set num [expr -$Z*1.]
		set v [veczero]
		set v [vecadd $v "0 0 $num"]
		$s moveby $v
	}
}
