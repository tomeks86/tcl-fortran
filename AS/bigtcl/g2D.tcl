
source /home/zmm1/tcl/bigdcd.tcl
puts "bigdcd - read"


proc g_2D {mylist opis1 opis2 rka dra myinput myoutput logik} {

 global all
 global licznik 
 global mol1
 global mol2
 global rk
 global dr
 global dim
 global r
 global g
 global f
 global rho

set mol [mol new $myinput type {psf} waitfor all]
set all [atomselect $mol all]
puts "przed bigdcd [$all num]"

puts "zdefiniowano zmienne globalna" 
set out1 [open $myoutput w]

set licznik 0
set pi [expr 4.0*atan(1.0) ]
set dr [expr $dra+0.0]
set rk [expr $rka+0.0]
set mol1 $opis1
set mol2 $opis2

set dim [expr int($rk/$dr) ]

set r ""
set g ""
set rho 0.0

for {set i 0} { $i <= $dim } {incr i} {
    lappend r "[expr $i*$dr]"
    lappend g "0.0"
    lappend f "0.0"
                                      }
    puts ""
    puts ""
    puts "BEFORE -------BIGDCD---------  $dim  "
    set nfile [llength $mylist]
switch $nfile {
1 {
puts "No 1"
set file1 [lindex $mylist 0]
puts "$file1"
bigdcd g2D $file1
  }
2 {
puts "No 2" 
set file1 [lindex $mylist 0]
set file2 [lindex $mylist 1]
puts "$file1 $file2"
bigdcd g2D $file1 $file2
  }
3 {
puts "No 3"
set file1 [lindex $mylist 0]
set file2 [lindex $mylist 1]
set file3 [lindex $mylist 2]
puts "$file1 $file2 $file3"
bigdcd g2D $file1 $file2 $file3
  }
4 {
puts "No 4"
set file1 [lindex $mylist 0]
set file2 [lindex $mylist 1]
set file3 [lindex $mylist 2]
set file4 [lindex $mylist 3]
puts "$file1 $file2 $file3 $file4"
bigdcd g2D $file1 $file2 $file3 $file4 $file5
  }
5 {
puts "No 5"
set file1 [lindex $mylist 0]
set file2 [lindex $mylist 1]
set file3 [lindex $mylist 2]
set file4 [lindex $mylist 3]
set file5 [lindex $mylist 4]
puts "$file1 $file2 $file3 $file4 $file5"
bigdcd g2D $file1 $file2 $file3 $file4 $file5
  }
default {
puts "Nie podales wlasciwej liczby plikow"
  }
}

    puts ""
    puts ""
    puts "AFTER -------BIGDCD---------   $dim"
    set rho [expr $rho/$licznik]
    set norm [expr 2.0*$pi*$dr*$rho]
    set gnorm 0.0
    set skala 1.0
    if {$logik} {
    set skala 2.0
                }
    puts " rho: $rho , norma: $norm , licznik: $licznik"
 foreach xr $r xg $g xf $f {
    set rr2 2.0
    if { $xr >= $dr } {
    set rr2 [expr 2.0*$norm*$xr]
    }
    puts $out1 " $xr [expr i$skala*2.0*$xg/$rr2/$licznik] $xg [expr 2.0*$xf/$rr2/$licznik] $xf"
                                      }
puts " !!!!!!!!!!!!!!!!!!!!!!!!!!!"
    close $out1


}

#==========================================================================
proc g2D { frame } {

 global all
 global licznik 
 global mol1
 global mol2
 global dim
 global r
 global g
 global f
 global rho
 global dr


      set atom1 [ atomselect top "$mol1" ]
      set atom2 [ atomselect top "$mol2" ]
      set n1 [ $atom1  num ]
      set n2 [ $atom2  num ]

      set a0 [molinfo top get a]
      set b0 [molinfo top get b]
      set c0 [molinfo top get c]

      set a0p [expr $a0*0.5]
      set b0p [expr $b0*0.5]
      set c0p [expr $c0*0.5]

      set a0m [expr -$a0*0.5]
      set b0m [expr -$b0*0.5]
      set c0m [expr -$c0*0.5]

      set rho [expr $rho + $n1*$n2/($a0*$b0)]

      set licznik [expr $licznik + 1 ]

      foreach x1 [$atom1 get x] y1 [$atom1 get y] z1 [$atom1 get z] {
              foreach x2 [$atom2 get x] y2 [$atom2 get y] z2 [$atom2 get z] {
                    set dx [expr $x2-$x1]
                    set dy [expr $y2-$y1]
                    set dz [expr $z2-$z1]

                    if { $dx > $a0p } {
                      set dx [ expr $dx-$a0 ]
                   } elseif { $dx < $a0m } {
                      set dx [ expr $dx +$a0 ]
                   }

                    if { $dy > $b0p } {
                      set dy [ expr $dy-$b0 ]
                   } elseif { $dy < $b0m } {
                      set dy [ expr $dy +$b0 ]
                   }

                    if { $dz > $c0p } {
                      set dz [ expr $dz-$c0 ]
                   } elseif { $dz < $c0m } {
                      set dz [ expr $dz +$c0 ]
                   }
           set r1 [expr sqrt($dx*$dx + $dy*$dy) ]
           set r2 [expr sqrt($dx*$dx + $dy*$dy + $dz*$dz) ]
           set  k [expr int($r1/$dr)]
           set  l [expr int($r2/$dr)]
           if {$k <= $dim && $r1>$dr } {
              lset g $k [expr [lindex $g $k] +1.0]
                           }
           if {$l <= $dim && $r2>$dr } {
              lset f $l [expr [lindex $f $l] +1.0]
                           }
                                                                               }
                                                                       }

      if { [expr int($frame/50)*50] == $frame } { 
      puts "$dim frame: $frame --$a0 $b0 $c0--$rho "
                                            }
}

