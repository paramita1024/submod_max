## created for testing
#current=/home/paramita/Documents/MATLAB/submod_max
#matlab -nodisplay -nodesktop -r "cd $current; testing_Fopen(9) ; quit;"
filename=liver
javac File_reading.java
java File_reading kernel/smo/$filename"_kernel" kernel/$filename"_covariance"
