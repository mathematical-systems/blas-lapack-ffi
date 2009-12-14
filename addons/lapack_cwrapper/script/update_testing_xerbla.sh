#!/bin/sh

for i in `find ../testing_in_depth/lapack/SRC -name '*.f'`
do
	echo $i
	cp $i $i.tmp
	upw=`echo ${w} | tr [a-z] [A-Z]`
#		echo $upw
	sed s/"CXERBLA"/"XERBLA"/g $i.tmp > $i
	cp $i $i.tmp
		
done
