set n [molinfo top get numframes]
set fout [open "surface.dat" w]

for {set i 0} {$i <= $n} {incr i} {
molinfo top set frame $i
set a [molinfo top get a]
set S [expr $a*$a/100]
puts $fout "$i $S"
}

close $fout
