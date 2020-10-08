#! /bin/bash

#script that creates a file for each BTS in the BTS_data.txt file named with the BTS ID

#create an array with all the unique snake ID elements
ID=($(cut -f 1 BTS_data.txt | sort -k1 | uniq | grep 13))

#create a loop that uses the array to name a file for each snake, adds headers, and copies the snake records for each
COUNTER=0
while [ $COUNTER -lt ${#ID[@]} ]
	do head -1 BTS_data.txt > file_${ID[$COUNTER]}.txt
	grep ${ID[$COUNTER]} BTS_data.txt >> file_${ID[$COUNTER]}.txt
	let COUNTER=COUNTER+1
done

#count the number of files created and echo it to the STDOUT
echo -e "\n\n"${#ID[@]} "files were created by Cari Lewis\n\n\nI friggin' love coding <3 :D\n\n"
