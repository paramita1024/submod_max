read kernel_sel
result_file=kernel/result
while read kernel
do
	echo $kernel >> $kernel_smo
	sh check_performance_smo.sh < $kernel_smo $result_file
done < $kernel_sel
