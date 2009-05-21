#!/bin/sh
echo "$1*.f"
for i in `find ../../testing_in_depth/lapack/SRC -name "$1*.f"`
do
#	echo $i
#	cp $i $i.orig
#	cp $i $i.tmp
#	for w in `../getargs.awk ~/lib/lapack-dev/lapack/SRC/*.f|grep function |awk '/double/{print $4} !/double/{print $3}'`
#	do
#		upw=`echo ${w} | tr [a-z] [A-Z]`
#		sed -e "s/$upw/C$upw/g" -e "s/FUNCTION C$upw/FUNCTION $upw/g" $i.tmp > $i

#		cp $i $i.tmp
#		len=`cat $i.tmp|wc -l`
#		res=`grep "C$upw" $i.tmp |wc -l`		
#		if [ $res -ne 0 ]; then
# 			head -n1 $i.tmp > $i
#			echo "        EXTERNAL C$upw" >> $i
#			t=$[$len-1]
#			t=`echo "$len-1"|bc -l`
#			tail -n$t $i.tmp >> $i
#		fi
#		cp $i $i.tmp
#	done	


	echo $i
	cp $i $i.orig
	cp $i $i.tmp
	for w in `../getargs.awk ~/lib/lapack-dev/lapack/SRC/*.f|grep function|awk '/double/{print $4} !/double/{print $3}'`
	do
#	w="cdl"
		upw=`echo ${w} | tr [a-z] [A-Z]`
		sed -e "s/$upw/C$upw/g" -e "s/FUNCTION +C$upw/FUNCTION $upw/g" $i.tmp > $i

		cp $i $i.tmp
#		len=`cat $i.tmp|wc -l`
#		res=`grep "C$upw" $i.tmp |wc -l`		
#		if [ $res -ne 0 ]; then
#			head -n1 $i.tmp > $i
# 			echo "        EXTERNAL C$upw" >> $i
#			t=$[$len-1]
#			t=`echo "$len-1"|bc -l`
#			tail -n$t $i.tmp >> $i
#		fi
#		cp $i $i.tmp
	done	


done
