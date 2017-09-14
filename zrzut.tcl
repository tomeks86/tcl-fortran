source ~/tcl/bigdcd.tcl
puts "użycie: zrzut {psf} {lista dcd} {selekcje} {pliki out}"

proc zrzut {myinput lfin lsele lfout} {
	if {[llength lsele] != [llength lfout]} {
		puts "liczba selekcji powinna być równa liczbie plików wynikowych"
		break
	}
	global as
	global fls
	global mol
	set mol [mol new $myinput type {psf} waitfor all]
	set fls {}
	foreach fout $lfout {
		lappend fls [open $fout w]
	}
	set as {}
	foreach sel $lsele {
		lappend as [atomselect $mol "$sel"]
		#puts "[[lindex $as [expr [llength $as]-1]] text]"
	}
	set nf [llength $lfin]
	switch $nf {
		1 {
			lassign $lfin f1
			bigdcd zrzut_ramka $f1
		}
		2 {
			lassign $lfin f1 f2
			bigdcd zrzut_ramka $f1 $f2
		}
		3 {
			lassign $lfin f1 f2 f3
			bigdcd zrzut_ramka $f1 $f2 $f3
		}
		4 {
			lassign $lfin f1 f2 f3 f4
			bigdcd zrzut_ramka $f1 $f2 $f3 $f4
		}
		5 {
			lassign $lfin f1 f2 f3 f4 f5
			bigdcd zrzut_ramka $f1 $f2 $f3 $f4 $f5
		}
		default {
			puts "nie podałeś właściwej liczby plików dcd"
		}
	}
	bigdcd_wait
	foreach fl $fls {
		close $fl
	}
}

proc zrzut_ramka {frame} {
	global as
	global fls
	global mol
	lassign [molinfo $mol get {a b c}] aa bb cc
	if {$frame % 50 == 0} {
		puts "$frame frame"
	}
	foreach sel $as fout $fls {
		#puts "[$sel text]"
		$sel update
		puts $fout "klatka nr $frame [$sel num] $aa $bb $cc"
		#foreach nm [$sel get name] ms [$sel get mass] x [$sel get x] y [$sel get y] z [$sel get z] {
		#	puts $fout "$nm $ms $x $y $z"
		#}
		foreach x [$sel get x] y [$sel get y] z [$sel get z] {
			puts $fout "$x $y $z"
		}
	}
}
