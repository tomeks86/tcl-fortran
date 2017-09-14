
source /net/archive/groups/plggjk1zchk/AS/prod/bigtcl/bigdcd.tcl



########################################################################################
########################################################################################
proc order {mylist myinput outSN1 outSN2} {

global mol
global all

set mol [mol new $myinput type {psf} waitfor all]
set all [atomselect $mol all]
puts "przed bigdcd [$all num]"

global dcdlist
set dcdlist $mylist

global plikSN1
global plikSN1
set plikSN1 [open $outSN1 w]
set plikSN1 [open $outSN2 w]
puts $plikSN1 "      sn-1      sn-2     headx     heady     headz"
puts $plikSN2 "      sn-1      sn-2   sn-2_pI  sn-2_pII     headx     heady     headz"

puts $dcdlist
set nfil [llength $dcdlist]
switch $nfil {
4 {
bigdcd order_big [lindex $dcdlist 0] [lindex $dcdlist 1] [lindex $dcdlist 2] [lindex $dcdlist 3]
} 5 {
bigdcd order_big [lindex $dcdlist 0] [lindex $dcdlist 1] [lindex $dcdlist 2] [lindex $dcdlist 3] [lindex $dcdlist 4]
} 6 {
bigdcd order_big [lindex $dcdlist 0] [lindex $dcdlist 1] [lindex $dcdlist 2] [lindex $dcdlist 3] [lindex $dcdlist 4] [lindex $dcdlist 5]
} 7 {
bigdcd order_big [lindex $dcdlist 0] [lindex $dcdlist 1] [lindex $dcdlist 2] [lindex $dcdlist 3] [lindex $dcdlist 4] [lindex $dcdlist 5] [lindex $dcdlist 6]
} default {
puts "podales mniej niz 4 pliki dcd
}}


flush $plikSN1
flush $plikSN2
}



########################################################################################
########################################################################################
proc order_big {frame} {

set mod [expr fmod($frame,20)]
if { $mod == 0 } {
  set mod2 [expr fmod($frame,100)]
  if { $mod2 == 0 } {
    puts $frame
  }









# output
    global plikPC
    global plikPO
    if { $resn eq "POPC" } {
      puts $plikPO [format "%10.3f%10.3f%10.3f%10.3f%10.3f%10.3f%10.3f" $alphasn1 $alphasn2 $alphad1 $alphad2 $alphagx $alphagy $alphagz]
    } elseif { $resn eq "DPPC" } {
      puts $plikPC  [format "%10.3f%10.3f%10.3f%10.3f%10.3f" $alphasn1 $alphasn2 $alphagx $alphagy $alphagz]
    }

}


}



