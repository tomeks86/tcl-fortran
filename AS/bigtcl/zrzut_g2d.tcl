source /net/archive/groups/plggjk1zchk/AS/prod/bigtcl/bigdcd.tcl
puts "bigdcd - read"

puts "zrzut mylist sel1 sel2 myinput myoutput1 myoutput2 "
puts ""
puts "mylist     - lista plikow dcd, maksymalnie 5 plikow"
puts "sel1       - selekcja at grupy 1 "
puts "sel2       - selekcja at grupy 2 "
puts "myinput    - nazwa pliku psf z badanym ukladem"
puts "myoutput1  - nazwa pliku wynikowego, wspolrzedne xyz atomu nr 1"
puts "myoutput1  - nazwa pliku wynikowego, wspolrzedne xyz atomu nr 2"


proc zrzut {mylist sel1 sel2  myinput myoutput1 myoutput2} {

global all
global mol1
global mol2
global plik1
global plik2
global licz1

set mol [mol new $myinput type {psf} waitfor all]
set all [atomselect $mol all]
puts "przed bigdcd [$all num]"

set licz1 0

set mol1 "$sel1"
set mol2 "$sel2"
set plik1 [open $myoutput1 w]
set plik2 [open $myoutput2 w]

puts "$mol1"
puts "$mol2"

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
default {
puts "Nie podales wlasciwej liczby plikow"
  }
}


puts " total number of coordinates  $licz1 " 

close $plik1
close $plik2

}

#
# 
proc zrzut_g2d { frame } {

global all
global mol1
global mol2
global plik1
global plik2
global licz1


      set mod [expr fmod($frame,100)]
      if { $mod == 0 } {
        puts $frame
      }



      set atom1 [atomselect top "$mol1"]
      set atom2 [atomselect top "$mol2"]
      set a0 [molinfo top get a]
      set b0 [molinfo top get b]
      set c0 [molinfo top get c]


      puts $plik1 " klatka nr $frame   [$atom1 num] $a0 $b0 $c0 "
      puts $plik2 " klatka nr $frame   [$atom2 num] $a0 $b0 $c0"

      set vec1 [veczero]
      set vec2 [veczero]

foreach vec1 [$atom1 get {x y z} ]  {
      puts $plik1 [format " %.4f  %.4f  %.4f" [lindex $vec1 0]  [lindex $vec1 1] [lindex $vec1 2]  ]
      set licz1 [expr $licz1 + 1 ]
}
foreach vec2 [$atom2 get {x y z} ]  {
      puts $plik2 [format " %.4f  %.4f  %.4f" [lindex $vec2 0]  [lindex $vec2 1] [lindex $vec2 2]  ]
      set licz1 [expr $licz1 + 1 ]
}

}
