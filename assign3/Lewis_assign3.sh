#! /bin/bash

#script that creates a file for each BTS in the BTS_data.txt file named with the BTS ID

#create a file that lists all the unique snake IDs without the ID header
cut -f 1 BTS_data.txt | sort -k1 | uniq | grep 13 > ID.txt

#create a loop that names a file for each unique snake, adds headers, and copies the snake records for each
while read line
	do touch file_$line.txt
	head -1 BTS_data.txt >> file_$line.txt
	grep $line BTS_data.txt >> file_$line.txt
done < ID.txt

#count the number of files created and write it to a new file
ls file_* | wc -l | grep [[:digit:]] > number.txt

#assign the value counted in the number.txt file to an array
file=0
while read Num
	do count[$file]=$Num
done < number.txt

#print the array value and the message "files were created!"
echo ${count[0]} "files were created by Lewis, Cari!"
echo "P.S. Cari is amazing"

#remove extra files
rm number.txt ID.txt
