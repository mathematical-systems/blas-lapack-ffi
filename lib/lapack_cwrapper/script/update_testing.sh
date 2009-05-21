#!/bin/sh

for i in `find ../TESTING/EIG -name '*.f'`
do
	echo $i
	cp $i $i.orig
	cp $i $i.tmp
	for w in `./getargs.awk ~/lib/lapack-dev/lapack/SRC/*.f|grep function |awk '/double/{print $4} !/double/{print $3}'`
	do
	
		upw=`echo ${w} | tr [a-z] [A-Z]`
		
		sed s/$upw/c$w/g $i.tmp > $i
		cp $i $i.tmp
	done	
done
