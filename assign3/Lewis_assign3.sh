#! /bin/bash

#script that creates a file for each BTS in the BTS_data.txt file named with the BTS ID

#create a file that lists all the unique snake IDs without the ID header
cut -f 1 BTS_data.txt | grep 13BTS[0-9] | uniq | sort -k1 > ID.txt

#create an array that names a file for each unique snake and add headers
while read line
	do touch file_$line.txt
	head -1 BTS_data.txt >> file_$line.txt
done < ID.txt

#create an array that reads the lines in the ID.txt file
snake=0

while read file
	do grep array[$snake]=$file
	let snake=snake+1
done < BTS_data.txt

#use the array to copy all the snake data into their respective files
for ID in ${array[*]}
	do grep $ID >> file_$ID.txt
done

