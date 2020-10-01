#! /bin/bash

#script that creates a file for each BTS in the BTS_data.txt file named with the BTS ID

#create a file that lists all the unique snake IDs
cut -f 1 BTS_data.txt | sort -k1 | uniq > ID.txt

#create an array that names a file for each snake in ID.txt
while read line
	do touch file_$line.txt
done < ID.txt

#create an array that reads the lines in the ID.txt file
snake=0

while read file
	do array[$snake]=$file
	let snake=snake+1
done < ID.txt

#use the array to copy all the snake data into their respective files
for ID in ${array[*]}
	do grep 13BTS$ID >> file_13BTS$ID.txt
done

#list and count the number of files created
ls | count
