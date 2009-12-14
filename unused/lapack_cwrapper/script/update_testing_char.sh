#!/bin/sh

for i in `find ./TESTING/EIG -name '*.f'`
do
	echo $i
	cp $i $i.tmp
	upw=`echo ${w} | tr [a-z] [A-Z]`
#		echo $upw
	sed s/"CHARACTER\*6"/"CHARACTER\*7"/g $i.tmp > $i
	cp $i $i.tmp
		
done
