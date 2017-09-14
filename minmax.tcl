proc minmax {sele} {
	set all [atomselect top $sele]
	set mes [measure minmax $all]
	set xmin [lindex [lindex $mes 0] 0]
	set ymin [lindex [lindex $mes 0] 1]
	set zmin [lindex [lindex $mes 0] 2]
	set xmax [lindex [lindex $mes 1] 0]
	set ymax [lindex [lindex $mes 1] 1]
	set zmax [lindex [lindex $mes 1] 2]
	set x [format "%s %.2f %s %.2f" xmin: $xmin  xmax: $xmax]
	set y [format "%s %.2f %s %.2f" ymin: $ymin  ymax: $ymax]
	set z [format "%s %.2f %s %.2f" zmin: $zmin  zmax: $zmax]
	puts $x
	puts $y
	puts $z
	set r0 [measure center $all]
	set x0 [lindex $r0 0]
	set y0 [lindex $r0 1]
	set z0 [lindex $r0 2]
	set rz [format "%.2f %.2f %.2f" $x0 $y0 $z0]
	puts $rz
}

proc minmax_fout {sele fout} {
	set fo [open $fout "w"]
	set all [atomselect top $sele]
	set mes [measure minmax $all]
	set xmin [lindex [lindex $mes 0] 0]
	set ymin [lindex [lindex $mes 0] 1]
	set zmin [lindex [lindex $mes 0] 2]
	set xmax [lindex [lindex $mes 1] 0]
	set ymax [lindex [lindex $mes 1] 1]
	set zmax [lindex [lindex $mes 1] 2]
	set x [format "%s %.2f %s %.2f" xmin: $xmin  xmax: $xmax]
	set y [format "%s %.2f %s %.2f" ymin: $ymin  ymax: $ymax]
	set z [format "%s %.2f %s %.2f" zmin: $zmin  zmax: $zmax]
	puts $fo $x
	puts $fo $y
	puts $fo $z
	set r0 [measure center $all]
	set x0 [lindex $r0 0]
	set y0 [lindex $r0 1]
	set z0 [lindex $r0 2]
	set rz [format "%.2f %.2f %.2f" $x0 $y0 $z0]
	puts $fo $rz
	close $fo
}
