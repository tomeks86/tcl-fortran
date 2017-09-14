
source /net/archive/groups/plggjk1zchk/AS/prod/bigtcl/bigdcd.tcl
puts "bigdcd - read"

proc dihed { frame } {

global myname
global licznik
global all

global sn1kat1
global sn1kat2
global sn1kat3
global sn1kat4 
global sn1kat5 
global sn1kat6 
global sn1kat7 
global sn1kat8 
global sn1kat9 
global sn1kat10 
global sn1kat11 
global sn1kat12 

global sn2kat1
global sn2kat2
global sn2kat3
global sn2kat4 
global sn2kat5 
global sn2kat6 
global sn2kat7 
global sn2kat8 
global sn2kat9 
global sn2kat10 
global sn2kat11 
global sn2kat12 

global sn1ord1
global sn1ord2
global sn1ord3
global sn1ord4 
global sn1ord5 
global sn1ord6 
global sn1ord7 
global sn1ord8 
global sn1ord9 
global sn1ord10 
global sn1ord11 
global sn1ord12 

global sn2ord1
global sn2ord2
global sn2ord3
global sn2ord4 
global sn2ord5 
global sn2ord6 
global sn2ord7 
global sn2ord8 
global sn2ord9 
global sn2ord10 
global sn2ord11 
global sn2ord12 

set spr [expr $frame/100]
set spr [expr $spr*100]

if {$spr==$frame} {
puts "$frame"
                 }

set dv1  [ veczero ]
set dv2  [ veczero ]
set dv3  [ veczero ]
set dv4  [ veczero ]
set dv5  [ veczero ]
set dv6  [ veczero ]
set dv7  [ veczero ]
set dv8  [ veczero ]
set dv9  [ veczero ]
set dv10 [ veczero ]
set dv11 [ veczero ]
set dv12 [ veczero ]
set dv13 [ veczero ]
set dv14 [ veczero ]

set v1  [ veczero ]
set v2  [ veczero ]
set v3  [ veczero ]
set v4  [ veczero ]
set v5  [ veczero ]
set v6  [ veczero ]
set v7  [ veczero ]
set v8  [ veczero ]
set v9  [ veczero ]
set v10 [ veczero ]
set v11 [ veczero ]
set v12 [ veczero ]
set v13 [ veczero ]
set v14 [ veczero ]
set v15 [ veczero ]

# NOW SN1 CHAIN
set sn1order1  0.0
set sn1order2  0.0
set sn1order3  0.0
set sn1order4  0.0
set sn1order5  0.0
set sn1order6  0.0
set sn1order7  0.0
set sn1order8  0.0
set sn1order9  0.0
set sn1order10 0.0
set sn1order11 0.0
set sn1order12 0.0

      set atom1 [atomselect top  "resname $myname and name C22" ]
      set atom2 [atomselect top  "resname $myname and name C23" ]
      set atom3 [atomselect top  "resname $myname and name C24" ]
      set atom4 [atomselect top  "resname $myname and name C25" ]
      set atom5 [atomselect top  "resname $myname and name C26" ]
      set atom6 [atomselect top  "resname $myname and name C27" ]
      set atom7 [atomselect top  "resname $myname and name C28" ]
      set atom8 [atomselect top  "resname $myname and name C29" ]
      set atom9 [atomselect top  "resname $myname and name C210" ]
      set atom10 [atomselect top  "resname $myname and name C211" ]
      set atom11 [atomselect top  "resname $myname and name C212" ]
      set atom12 [atomselect top  "resname $myname and name C213" ]
      set atom13 [atomselect top  "resname $myname and name C214" ]
      set atom14 [atomselect top  "resname $myname and name C215" ]
      set atom15 [atomselect top  "resname $myname and name C216" ]
foreach v1 [$atom1 get {x y z} ] v2 [$atom2 get {x y z} ] v3 [$atom3 get {x y z} ] v4 [$atom4 get {x y z} ] v5 [$atom5 get {x y z} ] v6 [$atom6 get {x y z} ] v7 [$atom7 get {x y z} ] v8 [$atom8 get {x y z} ] v9 [$atom9 get {x y z} ] v10 [$atom10 get {x y z} ] v11 [$atom11 get {x y z} ] v12 [$atom12 get {x y z} ] v13 [$atom13 get {x y z} ]  v14 [$atom14 get {x y z} ]  v15 [$atom15 get {x y z} ]  {

      set dv1  [vecsub $v2 $v1] 
      set dv2  [vecsub $v3 $v2] 
      set dv3  [vecsub $v4 $v3] 
      set dv4  [vecsub $v5 $v4] 
      set dv5  [vecsub $v6 $v5] 
      set dv6  [vecsub $v7 $v6] 
      set dv7  [vecsub $v8 $v7] 
      set dv8  [vecsub $v9 $v8] 
      set dv9  [vecsub $v10 $v9] 
      set dv10 [vecsub $v11 $v10] 
      set dv11 [vecsub $v12 $v11] 
      set dv12 [vecsub $v13 $v12] 
      set dv13 [vecsub $v14 $v13] 
      set dv14 [vecsub $v15 $v14]
      set vc12   [veccross $dv1 $dv2]
      set vc23   [veccross $dv2 $dv3]
      set vc34   [veccross $dv3 $dv4]
      set vc45   [veccross $dv4 $dv5]
      set vc56   [veccross $dv5 $dv6]
      set vc67   [veccross $dv6 $dv7]
      set vc78   [veccross $dv7 $dv8]
      set vc89   [veccross $dv8 $dv9]
      set vc910  [veccross $dv9 $dv10]
      set vc1011 [veccross $dv10 $dv11]
      set vc1112 [veccross $dv11 $dv12]
      set vc1213 [veccross $dv12 $dv13]
      set vc1314 [veccross $dv13 $dv14]

      set o1  [expr [vecdot $vc12 $vc23]/([veclength $vc12]*[veclength $vc23])]
      set o2  [expr [vecdot $vc23 $vc34]/([veclength $vc23]*[veclength $vc34])]
      set o3  [expr [vecdot $vc34 $vc45]/([veclength $vc34]*[veclength $vc45])]
      set o4  [expr [vecdot $vc45 $vc56]/([veclength $vc45]*[veclength $vc56])]
      set o5  [expr [vecdot $vc56 $vc67]/([veclength $vc56]*[veclength $vc67])]
      set o6  [expr [vecdot $vc67 $vc78]/([veclength $vc67]*[veclength $vc78])]
      set o7  [expr [vecdot $vc78 $vc89]/([veclength $vc78]*[veclength $vc89])]
      set o8  [expr [vecdot $vc89 $vc910]/([veclength $vc89]*[veclength $vc910])]
      set o9  [expr [vecdot $vc910 $vc1011]/([veclength $vc910]*[veclength $vc1011])]
      set o10 [expr [vecdot $vc1011 $vc1112]/([veclength $vc1011]*[veclength $vc1112])]
      set o11 [expr [vecdot $vc1112 $vc1213]/([veclength $vc1112]*[veclength $vc1213])]
      set o12 [expr [vecdot $vc1213 $vc1314]/([veclength $vc1213]*[veclength $vc1314])]

      set sn1ord1  [expr $sn1ord1 +  (3*$o1*$o1-1.0)/2.0 ]
      set sn1ord2  [expr $sn1ord2 +  (3*$o2*$o2-1.0)/2.0 ]
      set sn1ord3  [expr $sn1ord3 +  (3*$o3*$o3-1.0)/2.0 ]
      set sn1ord4  [expr $sn1ord4 +  (3*$o4*$o4-1.0)/2.0 ]
      set sn1ord5  [expr $sn1ord5 +  (3*$o5*$o5-1.0)/2.0 ]
      set sn1ord6  [expr $sn1ord6 +  (3*$o6*$o6-1.0)/2.0 ]
      set sn1ord7  [expr $sn1ord7 +  (3*$o7*$o7-1.0)/2.0 ]
      set sn1ord8  [expr $sn1ord8 +  (3*$o8*$o8-1.0)/2.0 ]
      set sn1ord9  [expr $sn1ord9 +  (3*$o9*$o9-1.0)/2.0 ]
      set sn1ord10 [expr $sn1ord10 +  (3*$o10*$o10-1.0)/2.0 ]
      set sn1ord11 [expr $sn1ord11 +  (3*$o11*$o11-1.0)/2.0 ]
      set sn1ord12 [expr $sn1ord12 +  (3*$o12*$o12-1.0)/2.0 ]

      set sn1order1  [expr $sn1order1 + acos($o1) ]
      set sn1order2  [expr $sn1order2 + acos($o2) ]
      set sn1order3  [expr $sn1order3 + acos($o3) ]
      set sn1order4  [expr $sn1order4 + acos($o4) ]
      set sn1order5  [expr $sn1order5 + acos($o5) ]
      set sn1order6  [expr $sn1order6 + acos($o6) ]
      set sn1order7  [expr $sn1order7 + acos($o7) ]
      set sn1order8  [expr $sn1order8 + acos($o8) ]
      set sn1order9  [expr $sn1order9 + acos($o9) ]
      set sn1order10 [expr $sn1order10 + acos($o10) ]
      set sn1order11 [expr $sn1order11 + acos($o11) ]
      set sn1order12 [expr $sn1order12 + acos($o12) ]

      set licznik [expr $licznik+1]
}

   set sn1kat1  [expr $sn1kat1 + $sn1order1 ]
   set sn1kat2  [expr $sn1kat2 + $sn1order2 ]
   set sn1kat3  [expr $sn1kat3 + $sn1order3 ]
   set sn1kat4  [expr $sn1kat4 + $sn1order4 ]
   set sn1kat5  [expr $sn1kat5 + $sn1order5 ]
   set sn1kat6  [expr $sn1kat6 + $sn1order6 ]
   set sn1kat7  [expr $sn1kat7 + $sn1order7 ]
   set sn1kat8  [expr $sn1kat8 + $sn1order8 ]
   set sn1kat9  [expr $sn1kat9 + $sn1order9 ]
   set sn1kat10 [expr $sn1kat10 + $sn1order10 ]
   set sn1kat11 [expr $sn1kat11 + $sn1order11 ]
   set sn1kat12 [expr $sn1kat12 + $sn1order12 ]

# NOW SN2 CHAIN

set sn2order1  0.0
set sn2order2  0.0
set sn2order3  0.0
set sn2order4  0.0
set sn2order5  0.0
set sn2order6  0.0
set sn2order7  0.0
set sn2order8  0.0
set sn2order9  0.0
set sn2order10 0.0
set sn2order11 0.0
set sn2order12 0.0

      set atom1  [atomselect top  "resname $myname and name C32" ]
      set atom2  [atomselect top  "resname $myname and name C33" ]
      set atom3  [atomselect top  "resname $myname and name C34" ]
      set atom4  [atomselect top  "resname $myname and name C35" ]
      set atom5  [atomselect top  "resname $myname and name C36" ]
      set atom6  [atomselect top  "resname $myname and name C37" ]
      set atom7  [atomselect top  "resname $myname and name C38" ]
      set atom8  [atomselect top  "resname $myname and name C39" ]
      set atom9  [atomselect top  "resname $myname and name C310" ]
      set atom10 [atomselect top  "resname $myname and name C311" ]
      set atom11 [atomselect top  "resname $myname and name C312" ]
      set atom12 [atomselect top  "resname $myname and name C313" ]
      set atom13 [atomselect top  "resname $myname and name C314" ]
      set atom14 [atomselect top  "resname $myname and name C315" ]
      set atom15 [atomselect top  "resname $myname and name C316" ]
foreach v1 [$atom1 get {x y z} ] v2 [$atom2 get {x y z} ] v3 [$atom3 get {x y z} ] v4 [$atom4 get {x y z} ] v5 [$atom5 get {x y z} ] v6 [$atom6 get {x y z} ] v7 [$atom7 get {x y z} ] v8 [$atom8 get {x y z} ] v9 [$atom9 get {x y z} ] v10 [$atom10 get {x y z} ] v11 [$atom11 get {x y z} ] v12 [$atom12 get {x y z} ] v13 [$atom13 get {x y z} ]  v14 [$atom14 get {x y z} ]  v15 [$atom15 get {x y z} ]  {

      set dv1  [vecsub $v2 $v1] 
      set dv2  [vecsub $v3 $v2] 
      set dv3  [vecsub $v4 $v3] 
      set dv4  [vecsub $v5 $v4] 
      set dv5  [vecsub $v6 $v5] 
      set dv6  [vecsub $v7 $v6] 
      set dv7  [vecsub $v8 $v7] 
      set dv8  [vecsub $v9 $v8] 
      set dv9  [vecsub $v10 $v9] 
      set dv10 [vecsub $v11 $v10] 
      set dv11 [vecsub $v12 $v11] 
      set dv12 [vecsub $v13 $v12] 
      set dv13 [vecsub $v14 $v13] 
      set dv14 [vecsub $v15 $v14]
      set vc12   [veccross $dv1 $dv2]
      set vc23   [veccross $dv2 $dv3]
      set vc34   [veccross $dv3 $dv4]
      set vc45   [veccross $dv4 $dv5]
      set vc56   [veccross $dv5 $dv6]
      set vc67   [veccross $dv6 $dv7]
      set vc78   [veccross $dv7 $dv8]
      set vc89   [veccross $dv8 $dv9]
      set vc910  [veccross $dv9 $dv10]
      set vc1011 [veccross $dv10 $dv11]
      set vc1112 [veccross $dv11 $dv12]
      set vc1213 [veccross $dv12 $dv13]
      set vc1314 [veccross $dv13 $dv14]

      set o1  [expr [vecdot $vc12 $vc23]/([veclength $vc12]*[veclength $vc23])]
      set o2  [expr [vecdot $vc23 $vc34]/([veclength $vc23]*[veclength $vc34])]
      set o3  [expr [vecdot $vc34 $vc45]/([veclength $vc34]*[veclength $vc45])]
      set o4  [expr [vecdot $vc45 $vc56]/([veclength $vc45]*[veclength $vc56])]
      set o5  [expr [vecdot $vc56 $vc67]/([veclength $vc56]*[veclength $vc67])]
      set o6  [expr [vecdot $vc67 $vc78]/([veclength $vc67]*[veclength $vc78])]
      set o7  [expr [vecdot $vc78 $vc89]/([veclength $vc78]*[veclength $vc89])]
      set o8  [expr [vecdot $vc89 $vc910]/([veclength $vc89]*[veclength $vc910])]
      set o9  [expr [vecdot $vc910 $vc1011]/([veclength $vc910]*[veclength $vc1011])]
      set o10 [expr [vecdot $vc1011 $vc1112]/([veclength $vc1011]*[veclength $vc1112])]
      set o11 [expr [vecdot $vc1112 $vc1213]/([veclength $vc1112]*[veclength $vc1213])]
      set o12 [expr [vecdot $vc1213 $vc1314]/([veclength $vc1213]*[veclength $vc1314])]

      set sn2ord1  [expr $sn2ord1  +  (3*$o1*$o1-1.0)/2.0 ]
      set sn2ord2  [expr $sn2ord2  +  (3*$o2*$o2-1.0)/2.0 ]
      set sn2ord3  [expr $sn2ord3  +  (3*$o3*$o3-1.0)/2.0 ]
      set sn2ord4  [expr $sn2ord4  +  (3*$o4*$o4-1.0)/2.0 ]
      set sn2ord5  [expr $sn2ord5  +  (3*$o5*$o5-1.0)/2.0 ]
      set sn2ord6  [expr $sn2ord6  +  (3*$o6*$o6-1.0)/2.0 ]
      set sn2ord7  [expr $sn2ord7  +  (3*$o7*$o7-1.0)/2.0 ]
      set sn2ord8  [expr $sn2ord8  +  (3*$o8*$o8-1.0)/2.0 ]
      set sn2ord9  [expr $sn2ord9  +  (3*$o9*$o9-1.0)/2.0 ]
      set sn2ord10 [expr $sn2ord10 +  (3*$o10*$o10-1.0)/2.0 ]
      set sn2ord11 [expr $sn2ord11 +  (3*$o11*$o11-1.0)/2.0 ]
      set sn2ord12 [expr $sn2ord12 +  (3*$o12*$o12-1.0)/2.0 ]

      set sn2order1  [expr $sn2order1  + acos($o1) ]
      set sn2order2  [expr $sn2order2  + acos($o2) ]
      set sn2order3  [expr $sn2order3  + acos($o3) ]
      set sn2order4  [expr $sn2order4  + acos($o4) ]
      set sn2order5  [expr $sn2order5  + acos($o5) ]
      set sn2order6  [expr $sn2order6  + acos($o6) ]
      set sn2order7  [expr $sn2order7  + acos($o7) ]
      set sn2order8  [expr $sn2order8  + acos($o8) ]
      set sn2order9  [expr $sn2order9  + acos($o9) ]
      set sn2order10 [expr $sn2order10 + acos($o10) ]
      set sn2order11 [expr $sn2order11 + acos($o11) ]
      set sn2order12 [expr $sn2order12 + acos($o12) ]

}

   set sn2kat1  [expr $sn2kat1  + $sn2order1 ]
   set sn2kat2  [expr $sn2kat2  + $sn2order2 ]
   set sn2kat3  [expr $sn2kat3  + $sn2order3 ]
   set sn2kat4  [expr $sn2kat4  + $sn2order4 ]
   set sn2kat5  [expr $sn2kat5  + $sn2order5 ]
   set sn2kat6  [expr $sn2kat6  + $sn2order6 ]
   set sn2kat7  [expr $sn2kat7  + $sn2order7 ]
   set sn2kat8  [expr $sn2kat8  + $sn2order8 ]
   set sn2kat9  [expr $sn2kat9  + $sn2order9 ]
   set sn2kat10 [expr $sn2kat10 + $sn2order10 ]
   set sn2kat11 [expr $sn2kat11 + $sn2order11 ]
   set sn2kat12 [expr $sn2kat12 + $sn2order12 ]


}

proc dihedral {mylist myresidue myinput myoutput} {


 global licznik 
 global all
 global myname

global sn1kat1  
global sn1kat2  
global sn1kat3  
global sn1kat4  
global sn1kat5  
global sn1kat6  
global sn1kat7  
global sn1kat8  
global sn1kat9  
global sn1kat10 
global sn1kat11 
global sn1kat12
 
global sn1ord1
global sn1ord2
global sn1ord3
global sn1ord4 
global sn1ord5 
global sn1ord6 
global sn1ord7 
global sn1ord8 
global sn1ord9 
global sn1ord10 
global sn1ord11 
global sn1ord12 

global sn2kat1  
global sn2kat2  
global sn2kat3  
global sn2kat4  
global sn2kat5  
global sn2kat6  
global sn2kat7  
global sn2kat8  
global sn2kat9  
global sn2kat10 
global sn2kat11 
global sn2kat12
 
global sn2ord1
global sn2ord2
global sn2ord3
global sn2ord4 
global sn2ord5 
global sn2ord6 
global sn2ord7 
global sn2ord8 
global sn2ord9 
global sn2ord10 
global sn2ord11 
global sn2ord12 

puts "zmienne globalna" 

set licznik 0

set sn1kat1 0.0
set sn1kat2 0.0
set sn1kat3 0.0
set sn1kat4 0.0
set sn1kat5 0.0
set sn1kat6 0.0
set sn1kat7 0.0
set sn1kat8 0.0
set sn1kat9 0.0
set sn1kat10 0.0
set sn1kat11 0.0
set sn1kat12 0.0
set sn1ord1  0.0
set sn1ord2  0.0
set sn1ord3  0.0
set sn1ord4  0.0
set sn1ord5  0.0
set sn1ord6  0.0
set sn1ord7  0.0
set sn1ord8  0.0
set sn1ord9  0.0
set sn1ord10 0.0
set sn1ord11 0.0
set sn1ord12 0.0

set sn2kat1 0.0
set sn2kat2 0.0
set sn2kat3 0.0
set sn2kat4 0.0
set sn2kat5 0.0
set sn2kat6 0.0
set sn2kat7 0.0
set sn2kat8 0.0
set sn2kat9 0.0
set sn2kat10 0.0
set sn2kat11 0.0
set sn2kat12 0.0
set sn2ord1  0.0
set sn2ord2  0.0
set sn2ord3  0.0
set sn2ord4  0.0
set sn2ord5  0.0
set sn2ord6  0.0
set sn2ord7  0.0
set sn2ord8  0.0
set sn2ord9  0.0
set sn2ord10 0.0
set sn2ord11 0.0
set sn2ord12 0.0

 set nfile [llength $mylist]
 set myname "$myresidue"
 puts "---- $nfile ---"
 puts "---- $mylist ---" 
 puts "---- $myname ---" 
 puts "---- $myinput ---" 
 puts "---- $myoutput ---" 
set mol [mol new $myinput type {psf} waitfor all]
set all [atomselect $mol all]
puts "przed bigdcd"

switch $nfile {
1 {
puts "No 1"
set file1 [lindex $mylist 0]
puts "$file1"
bigdcd dihed $file1
  }
2 {
puts "No 2" 
set file1 [lindex $mylist 0]
set file2 [lindex $mylist 1]
puts "$file1 $file2"
bigdcd dihed $file1 $file2
  }
3 {
puts "No 3"
set file1 [lindex $mylist 0]
set file2 [lindex $mylist 1]
set file3 [lindex $mylist 2]
puts "$file1 $file2 $file3"
bigdcd dihed $file1 $file2 $file3
  }
4 {
puts "No 4"
set file1 [lindex $mylist 0]
set file2 [lindex $mylist 1]
set file3 [lindex $mylist 2]
set file4 [lindex $mylist 3]
puts "$file1 $file2 $file3 $file4"
bigdcd dihed $file1 $file2 $file3 $file4 $file5
  }
5 {
puts "No 5"
set file1 [lindex $mylist 0]
set file2 [lindex $mylist 1]
set file3 [lindex $mylist 2]
set file4 [lindex $mylist 3]
set file5 [lindex $mylist 4]
puts "$file1 $file2 $file3 $file4 $file5"
bigdcd dihed $file1 $file2 $file3 $file4 $file5
  }
default {
puts "Nie podales wlasciwej liczby plikow"
  }
}

set plik [open $myoutput w]
set pi [expr 4.0*atan(1.0)]
puts "$licznik"
puts $plik " 1  [expr $sn1kat1/$licznik*180.0/$pi  ] [expr $sn2kat1/$licznik*180.0/$pi  ] [expr $sn1ord1/$licznik ] [expr $sn2ord1/$licznik ]"
puts $plik " 2  [expr $sn1kat2/$licznik*180.0/$pi  ] [expr $sn2kat2/$licznik*180.0/$pi  ] [expr $sn1ord2/$licznik ] [expr $sn2ord2/$licznik ]"
puts $plik " 3  [expr $sn1kat3/$licznik*180.0/$pi  ] [expr $sn2kat3/$licznik*180.0/$pi  ] [expr $sn1ord3/$licznik ] [expr $sn2ord3/$licznik ]"
puts $plik " 4  [expr $sn1kat4/$licznik*180.0/$pi  ] [expr $sn2kat4/$licznik*180.0/$pi  ] [expr $sn1ord4/$licznik ] [expr $sn2ord4/$licznik ]"
puts $plik " 5  [expr $sn1kat5/$licznik*180.0/$pi  ] [expr $sn2kat5/$licznik*180.0/$pi  ] [expr $sn1ord5/$licznik ] [expr $sn2ord5/$licznik ]"
puts $plik " 6  [expr $sn1kat6/$licznik*180.0/$pi  ] [expr $sn2kat6/$licznik*180.0/$pi  ] [expr $sn1ord6/$licznik ] [expr $sn2ord6/$licznik ]"
puts $plik " 7  [expr $sn1kat7/$licznik*180.0/$pi  ] [expr $sn2kat7/$licznik*180.0/$pi  ] [expr $sn1ord7/$licznik ] [expr $sn2ord7/$licznik ]"
puts $plik " 8  [expr $sn1kat8/$licznik*180.0/$pi  ] [expr $sn2kat8/$licznik*180.0/$pi  ] [expr $sn1ord8/$licznik ] [expr $sn2ord8/$licznik ]"
puts $plik " 9  [expr $sn1kat9/$licznik*180.0/$pi  ] [expr $sn2kat9/$licznik*180.0/$pi  ] [expr $sn1ord9/$licznik ] [expr $sn2ord9/$licznik ]"
puts $plik "10  [expr $sn1kat10/$licznik*180.0/$pi ] [expr $sn2kat10/$licznik*180.0/$pi ] [expr $sn1ord10/$licznik] [expr $sn2ord10/$licznik]"
puts $plik "11  [expr $sn1kat11/$licznik*180.0/$pi ] [expr $sn2kat11/$licznik*180.0/$pi ] [expr $sn1ord11/$licznik] [expr $sn2ord11/$licznik]"
puts $plik "12  [expr $sn1kat12/$licznik*180.0/$pi ] [expr $sn2kat12/$licznik*180.0/$pi ] [expr $sn1ord12/$licznik] [expr $sn2ord12/$licznik]"

close $plik
puts " 1 [expr $sn1kat1/$licznik*180.0/$pi  ] [expr $sn2kat1/$licznik*180.0/$pi  ]"
puts " 2 [expr $sn1kat2/$licznik*180.0/$pi  ] [expr $sn2kat2/$licznik*180.0/$pi  ]"
puts " 3 [expr $sn1kat3/$licznik*180.0/$pi  ] [expr $sn2kat3/$licznik*180.0/$pi  ]"
puts " 4 [expr $sn1kat4/$licznik*180.0/$pi  ] [expr $sn2kat4/$licznik*180.0/$pi  ]"
puts " 5 [expr $sn1kat5/$licznik*180.0/$pi  ] [expr $sn2kat5/$licznik*180.0/$pi  ]"
puts " 6 [expr $sn1kat6/$licznik*180.0/$pi  ] [expr $sn2kat6/$licznik*180.0/$pi  ]"
puts " 7 [expr $sn1kat7/$licznik*180.0/$pi  ] [expr $sn2kat7/$licznik*180.0/$pi  ]"
puts " 8 [expr $sn1kat8/$licznik*180.0/$pi  ] [expr $sn2kat8/$licznik*180.0/$pi  ]"
puts " 9 [expr $sn1kat9/$licznik*180.0/$pi  ] [expr $sn2kat9/$licznik*180.0/$pi  ]"
puts "10 [expr $sn1kat10/$licznik*180.0/$pi ] [expr $sn2kat10/$licznik*180.0/$pi ]"
puts "11 [expr $sn1kat11/$licznik*180.0/$pi ] [expr $sn2kat11/$licznik*180.0/$pi ]"
puts "12 [expr $sn1kat12/$licznik*180.0/$pi ] [expr $sn2kat12/$licznik*180.0/$pi ]"

}
