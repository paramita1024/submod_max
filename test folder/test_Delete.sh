#filename=liver
#path=kernel_smo
#echo $filename $path > input
#read file kernel_file < input
#echo file $file
#echo kernel_file $kernel_file
a=5
matlab -nodisplay -nodesktop -r " testing($a) ; quit;" 
