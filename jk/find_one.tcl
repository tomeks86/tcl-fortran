proc pressure { myout quant } {

set plik [open $myout r]
while { [gets $plik line] != -1 } {
  if [regexp "ETITLE:" $line] {set etitles $line}
  }
close $plik

set plik [open $myout r]
set ener " "
while { [gets $plik line] != -1 } {
  if [regexp "ENERGY:  " $line] {set ener "$ener $line"}
  }
close $plik

set l [llength $etitles]
set lc [expr [llength $ener]/$l]

for {set k 0} {$k < $l} {incr k} {
  set tstest [lindex $etitles $k]
  if {$tstest == $quant } {set tsnum $k}
  }
 

for {set k 0} {$k < $lc} {incr k} {
  set ts([expr $k+1]) [lindex $ener [expr $l*$k+$tsnum]]
  }

set psum 0.0
set licz 0
for {set k 1} {$k < $lc+1} {incr k} {
  puts " ts( $k ) $ts($k) "
  set psum [expr $psum + $ts($k) ]
  set licz [expr $licz +1]
  }
set p [expr $psum/$licz ]

puts " -----------------"
puts "  p = $p  "
puts " -----------------"



}
