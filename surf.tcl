source /home/tomasz/tcl/AS/bigtcl/bigdcd.tcl

set psf [lindex $argv 0]
set pdb [lrange $argv 1 [llength $argv]]

set S ""
set fout [open "surface.dat" w]

proc get_S {frame} {
	global fout
	global S
	if {$frame%100 == 0} {puts $frame}
	foreach {a b c} [molinfo top get {a b c}] {break}
	set s [expr $a*$b/16]
	set S "$S\n$s"
	puts $fout "$frame $s"
}

mol new $psf
switch [llength $pdb] {
	1 {
		foreach f1 $pdb {break}
		bigdcd get_S $f1
	}
	2 {
		foreach {f1 f2} $pdb {break}
		bigdcd get_S $f1 $f2
	}
	3 {
		foreach {f1 f2 f3} $pdb {break}
		bigdcd get_S $f1 $f2 $f3
	}
	4 {
		foreach {f1 f2 f3 f4} $pdb {break}
		bigdcd get_S $f1 $f2 $f3 $f4
	}
	5 {
		foreach {f1 f2 f3 f4 f5} $pdb {break}
		bigdcd get_S $f1 $f2 $f3 $f4 $f5
	}
	default {
		puts "coś nie tak"
	}
}
bigdcd_wait

close $fout

quit
