source /home/tomasz/tcl/AS/bigtcl/bigdcd.tcl
puts "bigdcd - read"

#
  puts "tilt mylist at1 at2 myresname mykat myinput myoutput"
  puts "mylist - pliki dcd (lista do 5 plikow max."
  puts "at1 - nazwa atomu nr 1 (name jak w pliku psf lub pdb)"
  puts "at2 - nazwa atomu nr 2 (name jak w pliku psf lub pdb)"
  puts "at3 - nazwa atomu nr 3 (name jak w pliku psf lub pdb)"
  puts "at4 - nazwa atomu nr 4 (name jak w pliku psf lub pdb)"
  puts "myresname  - nazwa residuum, do ktorego naleza at1, at2, at3 i at4"
  puts "mykat - warto<9c>Ãta z jaka ma byc probkowany zakres od 0 do Pi"
  puts "myinput  - plik psf ukladu molekularnego"
  puts "myoutput - plik wynikowy"
  puts " "
  puts " "
#




proc tilt {mylist at1 at2 at3 at4 myresname mykat myinput myoutput} {

global all
global mol1
global mol2
global mol3
global mol4
global kat
global dim
global drot1
global drot2
global pi
global rozklad1
global rozklad2
global ang1sum
global ang2sum
global licz1

set mol [mol new $myinput type {psf} waitfor all]
set all [atomselect $mol all]
puts "przed bigdcd [$all num]"

set kat $mykat
set dim [expr 180.0/$kat] 
set dim [expr int($dim)+1] 
set drot1 0.0
set drot2 0.0
set licz1 0
set pi [expr 4.0*atan(1.0) ]
set ang1sum  0.0
set ang2sum  0.0

set mol1 "resname $myresname and name $at1 and segid TOP"
set mol2 "resname $myresname and name $at2 and segid TOP"
set mol3 "resname $myresname and name $at3 and segid TOP"
set mol4 "resname $myresname and name $at4 and segid TOP"

puts "$mol1"
puts "$mol2"
puts "$mol3"
puts "$mol4"
puts "$kat  $dim"
puts "$pi"
puts "$licz1 $drot1 $drot2"

for { set i 0 } { $i <= $dim } { incr i } {
    set rozklad1($i) 0
    set rozklad2($i) 0
}


set nfile [llength $mylist]

switch $nfile {
1 {
puts "No 1"
set file1 [lindex $mylist 0]
puts "$file1"
bigdcd tilt_angle $file1
  }
2 {
puts "No 2" 
set file1 [lindex $mylist 0]
set file2 [lindex $mylist 1]
puts "$file1 $file2"
bigdcd tilt_angle $file1 $file2
  }
3 {
puts "No 3"
set file1 [lindex $mylist 0]
set file2 [lindex $mylist 1]
set file3 [lindex $mylist 2]
puts "$file1 $file2 $file3"
bigdcd tilt_angle $file1 $file2 $file3
  }
4 {
puts "No 4"
set file1 [lindex $mylist 0]
set file2 [lindex $mylist 1]
set file3 [lindex $mylist 2]
set file4 [lindex $mylist 3]
puts "$file1 $file2 $file3 $file4"
bigdcd tilt_angle $file1 $file2 $file3 $file4 $file5
  }
5 {
puts "No 5"
set file1 [lindex $mylist 0]
set file2 [lindex $mylist 1]
set file3 [lindex $mylist 2]
set file4 [lindex $mylist 3]
set file5 [lindex $mylist 4]
puts "$file1 $file2 $file3 $file4 $file5"
bigdcd tilt_angle $file1 $file2 $file3 $file4 $file5
  }
default {
puts "Nie podales wlasciwej liczby plikow"
  }
}

puts " $licz1 " 
puts  " average tilt angle [expr $ang1sum/$licz1 ] "
puts  " average rotational order  [expr $drot1/$licz1 ] "
puts  " average tilt angle [expr $ang2sum/$licz1 ] "
puts  " average rotational order  [expr $drot2/$licz1 ] "
set plik [open $myoutput w ]

for { set i 0 } { $i <= $dim} { incr i} {
    puts $plik [format " %.1f  %.4f  %.4f " [expr $i*$kat]  [expr $rozklad1($i).0/$licz1/$kat]  [expr $rozklad2($i).0/$licz1/$kat]  ]
}
close $plik

}

#
# 
proc tilt_angle { frame } {

global all
global mol1
global mol2
global mol3
global mol4
global kat
global dim
global drot1
global drot2
global rozklad1
global ang1sum
global rozklad2
global ang2sum
global licz1
global pi

set dv1  [ veczero ]
set vec1 [ veczero ]
set vec2 [ veczero ]
set dv2  [ veczero ]
set vec3 [ veczero ]
set vec4 [ veczero ]
set ang1 0.0
set iang1 0
set ang2 0.0
set iang2 0



      set atom1 [atomselect top "$mol1"]
      set atom2 [atomselect top "$mol2"]
      set atom3 [atomselect top "$mol3"]
      set atom4 [atomselect top "$mol4"]

      puts "$frame $licz1  [$atom1 num] [$atom2 num] [$atom3 num] [$atom4 num]"

foreach vec1 [$atom1 get {x y z} ] vec2 [$atom2 get {x y z} ] vec3 [$atom3 get {x y z}] vec4 [$atom4 get {x y z}]  {

      set dv1 [ vecsub $vec2 $vec1 ] 
      set dv2 [ vecsub $vec4 $vec3 ] 
      set o1 [expr [vecdot $dv1 {0 0 1}]/[veclength $dv1 ]  ]
      set o2 [expr [vecdot $dv2 {0 0 1}]/[veclength $dv2 ]  ]

      set dx1 [vecdot $dv1 {1 0 0}] 
      set dy1 [vecdot $dv1 {0 1 0}] 
      set dw1 [expr $dy1/sqrt($dx1*$dx1+$dy1*$dy1)] 
      set drot1 [expr $drot1+(2*$dw1*$dw1-1)]
      set ang1 [expr acos($o1)*180.0/$pi ]
      set iang1 [expr int($ang1/$kat) ]
      set ang1sum [expr $ang1sum+ $ang1]
      set rozklad1($iang1) [expr $rozklad1($iang1) + 1 ]

      set dx2 [vecdot $dv2 {1 0 0}] 
      set dy2 [vecdot $dv2 {0 1 0}] 
      set dw2 [expr $dy2/sqrt($dx2*$dx2+$dy2*$dy2)] 
      set drot2 [expr $drot2+(2*$dw2*$dw2-1)]
      set ang2 [expr acos($o2)*180.0/$pi ]
      set iang2 [expr int($ang2/$kat) ]
      set ang2sum [expr $ang2sum+ $ang2]
      set rozklad2($iang2) [expr $rozklad2($iang2) + 1 ]

      set licz1 [expr $licz1 + 1 ]
}

}
