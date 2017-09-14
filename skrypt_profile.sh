#!/bin/bash
IFS=$'\n'
mol=dppc

for l in 50 55 60 70 80 90 100; do
  i=1
  cd $l
  for l in $(<../../residues_$mol\.dat); do
    cat ../../calcNR.tcl |sed "s/MOL/$mol/g" |sed "s/REZYM/$l/" |sed "s/NR/$i/" > calc$i\.tcl
    cat ../../propNR.sh |sed "s/NR/$i/" > prop$i\.sh
    sbatch prop$i\.sh
	i=$(($i+1))
  done
  cd ../
done
