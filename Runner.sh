#!/bin/sh
Directs=("110-AGE200R70ProtocolVII")  # main directory
Sims=("1-Series1" "2-Series2" "3-Series3" "4-Series4" "5-Series5")  # subdirectories
lmp="/ichec/home/users/mahditavakol/Lammps/lammps-10Feb21/build/lmp_gpu"  # the executable source
script="MechProp.txt"  # input script
log="MechProp.log" # the log file


for direct in "${Directs[@]}"
do
	cd $direct
	for sim in "${Sims[@]}"
	do
		cd $sim
		mpirun -np 8 $lmp <$script> $log &
		cd ../
	done
	wait
	cd ../
done
