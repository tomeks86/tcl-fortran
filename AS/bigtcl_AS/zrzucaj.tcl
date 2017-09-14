

source bigtcl/zrzut_g2d_AS.tcl

mol delete all
set kat DPPC/80
set i1 2
set i2 3
set i3 4
set i4 5
set i5 6
set nazwa DPPC/DPPCI.psf
zrzut "$kat/DPPCI80_prod$i1.dcd $kat/DPPCI80_prod$i2.dcd $kat/DPPCI80_prod$i3.dcd $kat/DPPCI80_prod$i4.dcd $kat/DPPCI80_prod$i5.dcd" "name C28 C29 C210 C211 and segname TOP" "name C28 C29 C210 C211 and segname BOT" "name C38 C39 C310 C311 and segname TOP" "name C38 C39 C310 C311 and segname BOT"  "name C28 C29 C210 C211 C38 C39 C310 C311 and segname TOP" "name C28 C29 C210 C211 C38 C39 C310 C311 and segname BOT"  $nazwa 80PCIsn2T_25I.xyz 80PCIsn2B_25I.xyz 80PCIsn1T_25I.xyz 80PCIsn1B_25I.xyz 80PCIallT_25I.xyz 80PCIallB_25I.xyz 

puts "SKONCZYLEM"


