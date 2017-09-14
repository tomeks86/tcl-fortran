#!/usr/bin/tclsh

set fin [read [open [lindex $argv 0] r]]
set xx []
set yy []
set zz []
set eps [expr 10**-5.]

set i 0
foreach line [split $fin \n] {
	foreach {x y z} $line {break}
	lappend xx $x
	lappend yy $y
	lappend zz $z
	incr i
	if ($i>6) {
		foreach {xm2 xm1 x0 xp1 xp2} [lrange $yy [expr $i-5] $i] {break}
		#puts "$xm2 $xm1 $x0 $xp1 $xp2"
		if {$x0<$xm1 && $x0<$xm2 && $x0<$xp1 && $x0<$xp2} {
				break
		}
	}
}

set j [expr $i-3]
puts "[lindex $xx $j] [lindex $yy $j] [lindex $zz $j]"
