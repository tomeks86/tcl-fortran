source /home/tomasz/tcl/AS/bigtcl/bigdcd.tcl
puts "użycie: order {psf} {lista dcd} {plik out}"

proc order {psffile lfin fout} {
	global Sdp1
	global Sdp2
	global Spo1
	global Spo2
	global mol
	global residy
	global licznik
	global atsn1DPPC
	global atsn2DPPC
	global atsn1POPC
	global atsn2POPC
	set atsn1DPPC {{{C32} {H2X H2Y}} {{C33} {H3X H3Y}} {{C34} {H4X H4Y}} {{C35} {H5X H5Y}} {{C36} {H6X H6Y}} {{C37} {H7X H7Y}} {{C38} {H8X H8Y}} {{C39} {H9X H9Y}} {{C310} {H10X H10Y}} {{C311} {H11X H11Y}} {{C312} {H12X H12Y}} {{C313} {H13X H13Y}} {{C314} {H14X H14Y}} {{C315} {H15X H15Y}} {{C316} {H16X H16Y H16Z}}}
	set atsn2DPPC {{{C22} {H2R H2S}} {{C23} {H3R H3S}} {{C24} {H4R H4S}} {{C25} {H5R H5S}} {{C26} {H6R H6S}} {{C27} {H7R H7S}} {{C28} {H8R H8S}} {{C29} {H9R H9S}} {{C210} {H10R H10S}} {{C211} {H11R H11S}} {{C212} {H12R H12S}} {{C213} {H13R H13S}} {{C214} {H14R H14S}} {{C215} {H15R H15S}} {{C216} {H16R H16S H16T}}}
	set atsn1POPC {{{C32} {H2X H2Y}} {{C33} {H3X H3Y}} {{C34} {H4X H4Y}} {{C35} {H5X H5Y}} {{C36} {H6X H6Y}} {{C37} {H7X H7Y}} {{C38} {H8X H8Y}} {{C39} {H9X H9Y}} {{C310} {H10X H10Y}} {{C311} {H11X H11Y}} {{C312} {H12X H12Y}} {{C313} {H13X H13Y}} {{C314} {H14X H14Y}} {{C315} {H15X H15Y}} {{C316} {H16X H16Y H16Z}}}
	set atsn2POPC {{{C22} {H2R H2S}} {{C23} {H3R H3S}} {{C24} {H4R H4S}} {{C25} {H5R H5S}} {{C26} {H6R H6S}} {{C27} {H7R H7S}} {{C28} {H8R H8S}} {{C29} {H91}} {{C210} {H101}} {{C211} {H11R H11S}} {{C212} {H12R H12S}} {{C213} {H13R H13S}} {{C214} {H14R H14S}} {{C215} {H15R H15S}} {{C216} {H16R H16S}} {{C217} {H17R H17S}} {{C218} {H18R H18S H18T}}}
	set licznik 0
	set mol [mol new $psffile type {psf} waitfor all]
	set residy [[atomselect $mol "resname DPPC POPC and name N"] get residue]
	set nf [llength lfin]
	for {set i 0} {$i < 17} {incr i} {
		set Sdp1($i,0) 0.
		set Sdp1($i,1) 0.
		set Sdp2($i,0) 0.
		set Sdp2($i,1) 0.
		set Spo1($i,0) 0.
		set Spo1($i,1) 0.
		set Spo2($i,0) 0.
		set Spo2($i,1) 0.
	}
	switch $nf {
		1 {
			lassign $lfin f1
			bigdcd order_ramka $f1
		}
		2 {
			lassign $lfin f1 f2
			bigdcd order_ramka $f1 $f2
		}
		3 {
			lassign $lfin f1 f2 f3
			bigdcd order_ramka $f1 $f2 $f3
		}
		4 {
			lassign $lfin f1 f2 f3 f4
			bigdcd order_ramka $f1 $f2 $f3 $f4
		}
		5 {
			lassign $lfin f1 f2 f3 f4 f5
			bigdcd order_ramka $f1 $f2 $f3 $f4 $f5
		}
		default {
			puts "nie podałeś właściwej liczby plików dcd"
		}
	}
	bigdcd_wait
	set lout "at n. DPPC SN-1 /std dev/ DPPC SN-2 /std dev/ POPC SN-1 /std dev/ POPC SN=2 /std dev/\n"
	for {set i 0} {$i < 17} {incr i} {
		#puts "tu jestem"
		set Sdp1($i,1) [expr sqrt(($Sdp1(i,1)-$Sdp1(i,0)**2.)/($licznik-1))]
		set Sdp1($i,0) [expr $Sdp1($i,0)/$licznik]
		set Sdp2($i,1) [expr sqrt(($Sdp2($i,1)-$Sdp2($i,0)**2.)/($licznik-1))]
		set Sdp2($i,0) [expr $Sdp2($i,0)/$licznik]
		set Spo1($i,1) [expr sqrt(($Spo1($i,1)-$Spo1($i,0)**2.)/($licznik-1))]
		set Spo1($i,0) [expr $Spo1($i,0)/$licznik]
		set Spo2($i,1) [expr sqrt(($Spo2($i,1)-$Spo2($i,0)**2.)/($licznik-1))]
		set Spo2($i,0) [expr $Spo2(i,0)/$licznik]
		#puts $Sdp1(0,0)
		set lout "$lout [format "%5d %9.3f %9.3f %9.3f %9.3f %9.3f %9.3f %9.3f %9.3f\n" [expr $i+2] $Sdp1($i,0) $Sdp1($i,1) $Sdp2($i,0) $Sdp2($i,1) $Spo1($i,0) $Spo1($i,1) $Spo2($i,0) $Spo2($i,1)]"
	}
	puts $Sdp1(0,0)
	set fout [open $fout w]
	puts $fout $lout
	close $fout
}


proc order_ramka {frame} {
	global Sdp1
	global Sdp2
	global Spo1
	global Spo2
	global mol
	global residy
	global licznik
	global atsn1DPPC
	global atsn2DPPC
	global atsn1POPC
	global atsn2POPC
	set licznik [expr $licznik + 1]
	puts $licznik
	foreach rr $residy {
		#puts $rr
		set ml [atomselect $mol "residue $rr"]
		if {[lindex [$ml get resname] 0] == "DPPC"} {
			for {set k 0} {$k < 15} {incr k} {
				set chn [lindex $atsn1DPPC $k]
				set sm 0.
				set C [lindex [[atomselect $mol "residue $rr and name [lindex $chn 0]"] get {x y z}] 0]
				for {set j 0} {$j < [llength [lindex $chn 1]]} {incr j} {
					set H [lindex [[atomselect $mol "residue $rr and name [lindex [lindex $chn 1] $j]"] get {x y z}] 0]
					#puts [lindex [lindex $chn 1] $j]
					#puts "$H"
					#puts "$C"
					set CH [vecnorm [vecsub $H $C]]
					set sm [expr $sm + [lindex $CH 2]**2.]
				}
				set sm [expr $sm/($j+1.)]
				set Sdp1($k,0) [expr $Sdp1($k,0) + $sm]
				set Sdp1($k,1) [expr $Sdp1($k,1) + ($sm*$sm)]
				set chn [lindex $atsn2DPPC $k]
				set sm 0.
				set C [lindex [[atomselect $mol "residue $rr and name [lindex $chn 0]"] get {x y z}] 0]
				for {set j 0} {$j < [llength [lindex $chn 1]]} {incr j} {
					set H [lindex [[atomselect $mol "residue $rr and name [lindex [lindex $chn 1] $j]"] get {x y z}] 0]
					#puts "$H"
					#puts "$C"
					set CH [vecnorm [vecsub $H $C]]
					set sm [expr $sm + [lindex $CH 2]**2.]
				}
				set sm [expr $sm/($j+1.)]
				set Sdp2($k,0) [expr $Sdp2($k,0) + $sm]
				set Sdp2($k,1) [expr $Sdp2($k,1) + ($sm*$sm)]
			}
		} elseif {[lindex [$ml get resname] 0] == "POPC"} {
			for {set k 0} {$k<15} {incr k} {
				set chn [lindex $atsn1POPC $k]
				set sm 0.
				set C [lindex [[atomselect $mol "residue $rr and name [lindex $chn 0]"] get {x y z}] 0]
				for {set j 0} {$j < [llength [lindex $chn 1]]} {incr j} {
					set H [lindex [[atomselect $mol "residue $rr and name [lindex [lindex $chn 1] $j]"] get {x y z}] 0]
					#puts "$H"
					#puts "$C"
					set CH [vecnorm [vecsub $H $C]]
					set sm [expr $sm + [lindex $CH 2]**2.]
				}
				set sm [expr $sm/($j+1.)]
				set Spo1($k,0) [expr $Spo1($k,0) + $sm]
				set Spo1($k,1) [expr $Spo1($k,1) + ($sm*$sm)]
			}
			for {set k 0} {$k<17} {incr k} {
				set chn [lindex $atsn2POPC $k]
				set sm 0.
				set C [lindex [[atomselect $mol "residue $rr and name [lindex $chn 0]"] get {x y z}] 0]
				for {set j 0} {$j < [llength [lindex $chn 1]]} {incr j} {
					set H [lindex [[atomselect $mol "residue $rr and name [lindex [lindex $chn 1] $j]"] get {x y z}] 0]
					#puts "$H"
					#puts "$C"
					#puts [lindex [lindex $chn 1] $j]
					set CH [vecnorm [vecsub $H $C]]
					set sm [expr $sm + [lindex $CH 2]**2.]
				}
				set sm [expr $sm/($j+1.)]
				set Spo2($k,0) [expr $Spo2($k,0) + $sm]
				set Spo2($k,1) [expr $Spo2($k,1) + ($sm*$sm)]
			}
		}
		#puts $Spo1(0,0)
	}
}
