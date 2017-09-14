source ~/tcl/bigdcd.tcl

# fin - plik dcd
# dd  - rozmiar "bin"
#
proc orient {myinput lfin {dd 1.} {fout orient.dat}} {
	global long
	global short
	global residy
	global nf
	global pi
	global mol
	global testang
	set testang [open "testang" w]
	set mol [mol new $myinput type {psf} waitfor all]
	set dd [expr $dd+0.]
	set c [expr 1.0/$dd]
	set dim [expr 90*int($c)]
	set pi [expr atan(1.)*4.]
	#set dbdx [atomselect top "resname DBDX"]
	set residy [[atomselect top "resname DBDX and name O6"] get residue]
	#puts $residy
	for {set i 0} {$i <= $dim} {incr i} {
		set long($i) 0.0
		set short($i) 0.0
	}
	set nf 0
	set nfi [llength lfin]
	switch $nfi {
		1 {
			lassign $lfin fin1
			bigdcd calc_orient $fin1
		}
		2 {
			puts "tu jestem"
			lassign $lfin fin1 fin2
			bigdcd calc_orient $fin1 $fin2
		}
		3 {
			lassign $lfin fin1 fin2 fin3
			bigdcd calc_orient $fin1 $fin2 $fin3
		}
		4 {
			lassign $lfin fin1 fin2 fin3 fin4
			bigdcd calc_orient $fin1 $fin2 $fin3 $fin4
		}
		5 {
			lassign $lfin fin1 fin2 fin3 fin4 fin5
			bigdcd calc_orient $fin1 $fin2 $fin3 $fin4 $fin5
		}
		default {
			puts "nie podałeś właściwej liczby plików dcd"
		}
	}
	bigdcd_wait
	puts "after bigdcd"
	set plik1 [open $fout w]
	for {set i 0} {$i < $dim} {incr i} {
		puts $plik1 " [expr ($i+.5)*$dd+0.]  [expr $short($i)/$nf/22.] [expr $long($i)/$nf/22.]"
	}
	close $plik1
}

proc calc_orient {frame} {
	global long
	global short
	global residy
	global nf
	global pi
	global mol
	global testang
	set nf [expr $nf + 1]
	#puts $nf
	if {$frame % 50 == 0} {
		puts "frame number: $frame"
	}
	#if {$frame == 100} {exit}
	foreach id $residy {
		set O1 [lindex [[atomselect $mol "residue $id and name O6"] get {x y z}] 0]
		set O2 [lindex [[atomselect $mol "residue $id and name O13"] get {x y z}] 0]
		set mul 1.
		if {[lindex $O1 2]<0} {set mul -1.}
		#if {$frame==1} {
		#	puts $mul
		#}
		set sht [vecnorm [vecsub $O1 $O2]]
		set C1 [measure center [atomselect $mol "residue $id and name C1 C2 C3 C4 C5 C14"]]
		set C2 [measure center [atomselect $mol "residue $id and name C7 C8 C9 C10 C11 C12"]]
		set lng [vecnorm [vecsub $C1 $C2]]
		#vecscale $mul $sht
		#vecscale $mul $lng
		puts $testang [format "%.3f %.3f %.3f" [lindex $lng 0] [lindex $lng 1] [lindex $lng 2]]
		#if {[lindex $lng 2]<0.} {vecscale -1. $lng}
		set as [expr acos($mul*[lindex $sht 2])*180/$pi]
		set al [expr acos($mul*[lindex $lng 2])*180/$pi]
		if {$as>90.} {set as [expr $as-90.]}
		set ind [expr int($as)]
		set short($ind) [expr $short($ind)+1.]
		if {$al>90.} {set al [expr $al-90.]}
		set ind [expr int($al)]
		set long($ind) [expr $long($ind)+1.]
	}
}

proc mycenter { frame } {
  global all
  puts "$frame: [measure center $all weight mass]"
}
