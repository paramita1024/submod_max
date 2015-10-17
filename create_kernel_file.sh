# check to write kernel file without calling matlab
rm i_am_testing
filename=liver
i=1
while [ $i != 10 ]
do
	echo -t 4 -f ../MATLAB/submod_max/kernel/smo/$filename"_kernel_"$i >> i_am_testing
	i=`expr $i + 1`
done
