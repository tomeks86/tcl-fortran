lassign [molinfo top get {a b c}] a b c

proc z_minmax {sel} {
	set mm [measure minmax $sel]
	#puts $mm
	set minzmaxz "[lindex [lindex $mm 0] 2] [lindex [lindex $mm 1] 2]"
	return $minzmaxz
}

proc get_mass {sel zmin zmax} {
	set txt [$sel text]
	set txt "$txt and z>$zmin and z<$zmax"
	set sel2 [atomselect top $txt]
	set m 0.
	foreach mm [$sel2 get mass] {
		set m [expr $m+$mm]
	}
	return $m
}

proc rho_prof {sel zmin zmax dz fout {first 0} {last last}} {step 1} {
	global a
	global b
	global c
	set dz [expr $dz+0.0]
	set dmin [expr $zmin+0.0]
	set dmax [expr $zmax+0.0]
	set dz2 [expr $dz/2.]
	set n [expr int(($zmax-$zmin)/$dz)]
	set profs {}
	#set lout ""
	set fout [open $fout w]
	for {set f [molinfo top get nframes]} {$f < $last} {incr f $step} {
		for {set i 0} {$i < $n} {incr i} {
			set zmn [expr $zmin+$i*$dz]
			set zmx [expr $zmin+($i+1)*$dz]
			set zmp [expr ($zmx+$zmn)/2.]
			set rho [expr [get_mass $sel $zmn $zmx]/($a*$b*$dz)]
		}
		set line [format "%.3f %.5f\n" $zmp $rho]
		#set lout "$lout $line\n"
		puts $fout $line
	}
	#return $lout
	close $fout
}
	
