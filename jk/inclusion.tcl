proc wrtdt { ns nk j1 j2 k1 k2} {

  for { set i $ns } { $i <= $nk } { incr i } {
        molinfo top set frame $i
        set o1 [open xyz$i.dat w] 
        set o2 [open zyx$i.dat w] 

     for { set j $j1 } { $j <= $j2 } { incr j } {
        set czast1 [ atomselect top "segname CD$j" ]
        puts $o1 " $j [measure minmax $czast1] "
                                                 }
     for { set k $k1 } { $k <= $k2 } { incr k } {
       set czast2 [ atomselect top "resname NFT and resid $k" ]
       set wsp [veczero]
       set masa 0.0

       foreach coord [$czast2 get {x y z} ] m [ $czast2 get mass ] {
             set masa [ expr $masa + $m ]
             set wsp [ vecadd $wsp [ vecscale $m $coord ] ]
                                                              } 

       set wsp1 [veczero]
       set wsp1 [vecscale [expr 1.0/$masa] $wsp]
       puts $o2 " $k $wsp1 "
                                                  }

close $o1
close $o2
}

}
