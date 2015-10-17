# testing how to get elapsed time in shell
#start=`date +%s`
#echo $start
#a=1
#while [ $a -lt 200000 ]
 #do
	#a=`expr $a + 1`
#done
#end=`date +%s`
#echo $end
#runtime=$((end-start))
#echo $runtime

# rm -f file_not_exist

#testing read line shell
#while IFS='' read -r line || [[ -n "$line" ]]; do
    #echo $line
#done < "$1"

index=0
while read line 
do
echo $line
index=$(($index+1))
done < myarray
# echo $MYARRAY
