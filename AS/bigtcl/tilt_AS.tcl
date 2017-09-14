
source /net/archive/groups/plggjk1zchk/AS/prod/bigtcl/bigdcd.tcl



set st 10



########################################################################################
########################################################################################
proc tilt {mylist myinput outPC outPO} {

global mol
global all

set mol [mol new $myinput type {psf} waitfor all]
set all [atomselect $mol all]
puts "przed bigdcd [$all num]"

global dcdlist
set dcdlist $mylist

global plikPC
global plikPO
set plikPC [open $outPC w]
set plikPO [open $outPO w]
puts $plikPC "      sn-1      sn-2     headx     heady     headz"
puts $plikPO "      sn-1      sn-2   sn-2_pI  sn-2_pII     headx     heady     headz"

puts $dcdlist
set nfil [llength $dcdlist]
switch $nfil {
4 {
bigdcd tilt_big [lindex $dcdlist 0] [lindex $dcdlist 1] [lindex $dcdlist 2] [lindex $dcdlist 3]
} 5 {
bigdcd tilt_big [lindex $dcdlist 0] [lindex $dcdlist 1] [lindex $dcdlist 2] [lindex $dcdlist 3] [lindex $dcdlist 4]
} 6 {
bigdcd tilt_big [lindex $dcdlist 0] [lindex $dcdlist 1] [lindex $dcdlist 2] [lindex $dcdlist 3] [lindex $dcdlist 4] [lindex $dcdlist 5]
} 7 {
bigdcd tilt_big [lindex $dcdlist 0] [lindex $dcdlist 1] [lindex $dcdlist 2] [lindex $dcdlist 3] [lindex $dcdlist 4] [lindex $dcdlist 5] [lindex $dcdlist 6]
} default {
puts "podales mniej niz 4 pliki dcd
}}


flush $plikPC
flush $plikPO
}



########################################################################################
########################################################################################
proc tilt_big {frame} {

set mod [expr fmod($frame,20)]
if { $mod == 0 } {
  set mod2 [expr fmod($frame,100)]
  if { $mod2 == 0 } {
    puts $frame
  }

  for { set rid 0} { $rid < 200 } { incr rid } {

    set ress [atomselect top "name N and residue $rid"]
    set resn [$ress get resname]
    set seg [$ress get segname]

    if { $seg eq "BOT" } {
     set mono -1
    } elseif { $seg eq "TOP" } {
     set mono 1
    } else {
     puts "cos nie tak!"
    }
   

# sn-1 chain
    set beg [atomselect top "residue $rid and name C31" frame $frame]
    set ter [atomselect top "residue $rid and name C316" frame $frame]

    set begv "[$beg get x] [$beg get y] [$beg get z]"
    set terv "[$ter get x] [$ter get y] [$ter get z]"
    set vec [vecsub $terv $begv]
    set vecdl [veclength $vec]

    set cosa [expr $mono*[lindex $vec 2]/$vecdl]
    set alphasn1 [expr 180*acos($cosa)/3.14]


# sn-2 chain
    set beg [atomselect top "residue $rid and name C21" frame $frame]

    if { $resn eq "DPPC" } {
        set ter [atomselect top "residue $rid and name C216" frame $frame]
    } elseif { $resn eq "POPC" } {
        set dub1 [atomselect top "residue $rid and name C29" frame $frame]
	set dub2 [atomselect top "residue $rid and name C210" frame $frame]
	set ter [atomselect top "residue $rid and name C218" frame $frame]
    }
  
    set begv "[$beg get x] [$beg get y] [$beg get z]"
    set terv "[$ter get x] [$ter get y] [$ter get z]"
    set vec [vecsub $terv $begv]
    set vecdl [veclength $vec]

    set cosa [expr $mono*[lindex $vec 2]/$vecdl]
    set alphasn2 [expr 180*acos($cosa)/3.14]
 
    if { $resn eq "POPC" } {
     set begv "[$beg get x] [$beg get y] [$beg get z]"
     set terv "[$dub1 get x] [$dub1 get y] [$dub1 get z]"
     set vec [vecsub $terv $begv]
     set vecdl [veclength $vec]

     set cosa [expr $mono*[lindex $vec 2]/$vecdl]
     set alphad1 [expr 180*acos($cosa)/3.14]

 
     set begv "[$dub2 get x] [$dub2 get y] [$dub2 get z]"
     set terv "[$ter get x] [$ter get y] [$ter get z]"
     set vec [vecsub $terv $begv]
     set vecdl [veclength $vec]

     set cosa [expr $mono*[lindex $vec 2]/$vecdl]
     set alphad2 [expr 180*acos($cosa)/3.14]
    }

 
# glowy
    set beg [atomselect top "residue $rid and name N" frame $frame]
    set ter [atomselect top "residue $rid and name P" frame $frame]

    set begv "[$beg get x] [$beg get y] [$beg get z]"
    set terv "[$ter get x] [$ter get y] [$ter get z]"
    set vecg [vecsub $terv $begv]
    set vecgdl [veclength $vecg]

    set cosax [expr $mono*[lindex $vecg 0]/$vecgdl]
    set cosay [expr $mono*[lindex $vecg 1]/$vecgdl]
    set cosaz [expr $mono*[lindex $vecg 2]/$vecgdl]


    set alphagx [expr 180*acos($cosax)/3.14]
    set alphagy [expr 180*acos($cosay)/3.14]
    set alphagz [expr 180*acos($cosaz)/3.14]


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


}



