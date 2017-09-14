source /net/archive/groups/plggjk1zchk/AS/prod/bigtcl/bigdcd.tcl
puts "bigdcd - read"

puts "zrzut mylist sel1 sel2 sel3 sel4 sel5 sel6 myinput myoutput1 myoutput2 myoutput3 muoutput4 myoutput5 myoutput6 "
puts ""
puts "mylist     - lista plikow dcd, maksymalnie 5 plikow"
puts "sel1       - selekcja at grupy 1 "
puts "sel2       - selekcja at grupy 2 "
puts "sel3       - selekcja at grupy 3 "
puts "sel4       - selekcja at grupy 4 "
puts "sel5       - selekcja at grupy 5 "
puts "sel6       - selekcja at grupy 6 "
puts "sel7       - selekcja at grupy 7 "
puts "sel8       - selekcja at grupy 8 "
puts "myinput    - nazwa pliku psf z badanym ukladem"
puts "myoutput1  - nazwa pliku wynikowego, wspolrzedne xyz atomu nr 1"
puts "myoutput2  - nazwa pliku wynikowego, wspolrzedne xyz atomu nr 2"
puts "myoutput3  - nazwa pliku wynikowego, wspolrzedne xyz atomu nr 3"
puts "myoutput4  - nazwa pliku wynikowego, wspolrzedne xyz atomu nr 4"
puts "myoutput5  - nazwa pliku wynikowego, wspolrzedne xyz atomu nr 5"
puts "myoutput6  - nazwa pliku wynikowego, wspolrzedne xyz atomu nr 6"
puts "myoutput7  - nazwa pliku wynikowego, wspolrzedne xyz atomu nr 6"
puts "myoutput8  - nazwa pliku wynikowego, wspolrzedne xyz atomu nr 6"


proc zrzut {mylist sel1 sel2 sel3 sel4 sel5 sel6 sel7 sel8  myinput myoutput1 myoutput2 myoutput3 myoutput4 myoutput5 myoutput6 myoutput7 myoutput8} {

global all
global mol1
global mol2
global mol3
global mol4
global mol5
global mol6
global mol7
global mol8
global plik1
global plik2
global plik3
global plik4
global plik5
global plik6
global plik7
global plik8
global licz1

set mol [mol new $myinput type {psf} waitfor all]
set all [atomselect $mol all]
puts "przed bigdcd [$all num]"

set licz1 0

set mol1 "$sel1"
set mol2 "$sel2"
set mol3 "$sel3"
set mol4 "$sel4"
set mol5 "$sel5"
set mol6 "$sel6"
set mol7 "$sel7"
set mol8 "$sel8"
set plik1 [open $myoutput1 w]
set plik2 [open $myoutput2 w]
set plik3 [open $myoutput3 w]
set plik4 [open $myoutput4 w]
set plik5 [open $myoutput5 w]
set plik6 [open $myoutput6 w]
set plik7 [open $myoutput7 w]
set plik8 [open $myoutput8 w]

puts "$mol1"
puts "$mol2"
puts "$mol3"
puts "$mol4"
puts "$mol5"
puts "$mol6"
puts "$mol7"
puts "$mol8"

 set nfile [llength $mylist]

switch $nfile {
1 {
puts "No 1"
set file1 [lindex $mylist 0]
puts "$file1"
bigdcd zrzut_g2d $file1
  }
2 {
puts "No 2" 
set file1 [lindex $mylist 0]
set file2 [lindex $mylist 1]
puts "$file1 $file2"
bigdcd zrzut_g2d $file1 $file2
  }
3 {
puts "No 3"
set file1 [lindex $mylist 0]
set file2 [lindex $mylist 1]
set file3 [lindex $mylist 2]
puts "$file1 $file2 $file3"
bigdcd zrzut_g2d $file1 $file2 $file3
  }
4 {
puts "No 4"
set file1 [lindex $mylist 0]
set file2 [lindex $mylist 1]
set file3 [lindex $mylist 2]
set file4 [lindex $mylist 3]
puts "$file1 $file2 $file3 $file4"
bigdcd zrzut_g2d $file1 $file2 $file3 $file4
  }
5 {
puts "No 5"
set file1 [lindex $mylist 0]
set file2 [lindex $mylist 1]
set file3 [lindex $mylist 2]
set file4 [lindex $mylist 3]
set file5 [lindex $mylist 4]
puts "$file1 $file2 $file3 $file4 $file5"
bigdcd zrzut_g2d $file1 $file2 $file3 $file4 $file5
  }
6 {
puts "No 6"
set file1 [lindex $mylist 0]
set file2 [lindex $mylist 1]
set file3 [lindex $mylist 2]
set file4 [lindex $mylist 3]
set file5 [lindex $mylist 4]
set file6 [lindex $mylist 5]
puts "$file1 $file2 $file3 $file4 $file5 $file6"
bigdcd zrzut_g2d $file1 $file2 $file3 $file4 $file5 $file6
  }
7 {
puts "No 7"
set file1 [lindex $mylist 0]
set file2 [lindex $mylist 1]
set file3 [lindex $mylist 2]
set file4 [lindex $mylist 3]
set file5 [lindex $mylist 4]
set file6 [lindex $mylist 5]
set file7 [lindex $mylist 6]
puts "$file1 $file2 $file3 $file4 $file5 $file6 $file7"
bigdcd zrzut_g2d $file1 $file2 $file3 $file4 $file5 $file6 $file7
  }

default {
puts "Nie podales wlasciwej liczby plikow"
  }
}


puts " total number of coordinates  $licz1 " 

#close $plik1
#close $plik2
#close $plik3
#close $plik4
#close $plik5
#close $plik6

flush $plik1
flush $plik2
flush $plik3
flush $plik4
flush $plik5
flush $plik6
flush $plik7
flush $plik8

}

#
# 
proc zrzut_g2d { frame } {

global all
global mol1
global mol2
global mol3
global mol4
global mol5
global mol6
global mol7
global mol8
global plik1
global plik2
global plik3
global plik4
global plik5
global plik6
global plik7
global plik8
global licz1


      set mod [expr fmod($frame,100)]
      if { $mod == 0 } {
        puts $frame
      }



      set atom1 [atomselect top "$mol1" frame $frame]
      set atom2 [atomselect top "$mol2" frame $frame]
      set atom3 [atomselect top "$mol3" frame $frame]
      set atom4 [atomselect top "$mol4" frame $frame]
      set atom5 [atomselect top "$mol5" frame $frame]
      set atom6 [atomselect top "$mol6" frame $frame]
      set atom7 [atomselect top "$mol7" frame $frame]
      set atom8 [atomselect top "$mol8" frame $frame]
      set a0 [molinfo top get a]
      set b0 [molinfo top get b]
      set c0 [molinfo top get c]


      puts $plik1 " klatka nr $frame   [$atom1 num] $a0 $b0 $c0 "
      puts $plik2 " klatka nr $frame   [$atom2 num] $a0 $b0 $c0"
      puts $plik3 " klatka nr $frame   [$atom3 num] $a0 $b0 $c0"
      puts $plik4 " klatka nr $frame   [$atom4 num] $a0 $b0 $c0"
      puts $plik5 " klatka nr $frame   [$atom5 num] $a0 $b0 $c0"
      puts $plik6 " klatka nr $frame   [$atom6 num] $a0 $b0 $c0"
      puts $plik7 " klatka nr $frame   [$atom7 num] $a0 $b0 $c0"
      puts $plik8 " klatka nr $frame   [$atom8 num] $a0 $b0 $c0"

      set vec [veczero]

foreach vec [$atom1 get {x y z} ]  {
      puts $plik1 [format " %.4f  %.4f  %.4f" [lindex $vec 0]  [lindex $vec 1] [lindex $vec 2]  ]
      set licz1 [expr $licz1 + 1 ]
}

      set vec [veczero]

foreach vec [$atom2 get {x y z} ]  {
      puts $plik2 [format " %.4f  %.4f  %.4f" [lindex $vec 0]  [lindex $vec 1] [lindex $vec 2]  ]
      set licz1 [expr $licz1 + 1 ]
}

      set vec [veczero]

foreach vec [$atom3 get {x y z} ]  {
      puts $plik3 [format " %.4f  %.4f  %.4f" [lindex $vec 0]  [lindex $vec 1] [lindex $vec 2]  ]
      set licz1 [expr $licz1 + 1 ]
}

      set vec [veczero]

foreach vec [$atom4 get {x y z} ]  {
      puts $plik4 [format " %.4f  %.4f  %.4f" [lindex $vec 0]  [lindex $vec 1] [lindex $vec 2]  ]
      set licz1 [expr $licz1 + 1 ]
}

      set vec [veczero]

foreach vec [$atom5 get {x y z} ]  {
      puts $plik5 [format " %.4f  %.4f  %.4f" [lindex $vec 0]  [lindex $vec 1] [lindex $vec 2]  ]
      set licz1 [expr $licz1 + 1 ]
}

      set vec [veczero]

foreach vec [$atom6 get {x y z} ]  {
      puts $plik6 [format " %.4f  %.4f  %.4f" [lindex $vec 0]  [lindex $vec 1] [lindex $vec 2]  ]
      set licz1 [expr $licz1 + 1 ]
}

      set vec [veczero]

foreach vec [$atom7 get {x y z} ]  {
      puts $plik7 [format " %.4f  %.4f  %.4f" [lindex $vec 0]  [lindex $vec 1] [lindex $vec 2]  ]
      set licz1 [expr $licz1 + 1 ]
}

      set vec [veczero]

foreach vec [$atom8 get {x y z} ]  {
      puts $plik8 [format " %.4f  %.4f  %.4f" [lindex $vec 0]  [lindex $vec 1] [lindex $vec 2]  ]
      set licz1 [expr $licz1 + 1 ]
}



}
