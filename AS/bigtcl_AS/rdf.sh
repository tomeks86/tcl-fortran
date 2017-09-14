#!/bin/sh

k=25
k1=_25I
k2=_25II
SR=SR
T=T
B=B
pref=90PCI

for chain in sn1 sn2
do
 for layer in T B
 do
   echo $pref$chain$layer$k1.xyz
   cp $pref$chain$layer$k1.xyz $pref$chain$layer$k2.xyz
   ./g2d_AS.x $pref$chain$layer$k1.xyz $pref$chain$layer$k2.xyz rdf$pref$chain$chain$layer$k.out 30 0.01 4 4 chain.data
 done
 echo rdf"$pref$chain$chain"T$k.out
 ./sr_mono.x 2 rdf"$pref$chain$chain"T$k.out rdf"$pref$chain$chain"B$k.out rdf"$pref$chain$chain"SR$k.out 2
done


for layer in T B
do
   echo "$pref"sn1$layer$k1.xyz
   echo "$pref"all$layer$k1.xyz
   cp "$pref"all$layer$k1.xyz "$pref"all$layer$k2.xyz
   ./g2d_AS.x "$pref"sn1$layer$k1.xyz "$pref"sn2$layer$k1.xyz rdf"$pref"sn1sn2$layer$k.out 30 0.01 4 4 chain.data
   ./g2d_AS.x "$pref"all$layer$k1.xyz "$pref"all$layer$k2.xyz rdf"$pref"all$layer$k.out 30 0.01 8 8 all.data
done
./sr_mono.x 2 rdf"$pref"sn1sn2$T$k.out rdf"$pref"sn1sn2$B$k.out rdf"$pref"sn1sn2$SR$k.out 2
./sr_mono.x 2 rdf"$pref"all$T$k.out rdf"$pref"all$B$k.out rdf"$pref"all$SR$k.out 2




