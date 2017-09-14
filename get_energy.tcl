
set all [atomselect top all]
set fil [open en_k.dat w]
foreach m [$all get mass] v [$all get {x y z}] {
puts $fil [expr 0.5* $m * [vecdot $v $v]]
}
close $fil

set fil [open en_kh.dat w]
foreach m [$all get mass] v [$all get {x y z}] {
if ($m>1.5) {
puts $fil [expr 0.5* $m * [vecdot $v $v]]
}
}
close $fil
