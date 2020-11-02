#! /bin/bash

#script that takes a list of voters and adds a column stating whether the voter is eligible to vote
#create a file with just the ages to iterate through in the loop
cut -f2 possible_voters.txt | grep [[:digit:]] > age.txt

#create a new file with the Eligible? header
echo "Eligible?" > new_list.txt

#create a loop that identifies whether the person is eligible to vote
while read line
	do if [ $line -gt 17 ]
	then echo "yes"
	else echo "no"
	fi
done < age.txt >> new_list.txt

#paste the new_list.txt on the the end of the possible_voters.txt list
paste possible_voters.txt new_list.txt > eligible_voters.txt

#count the number of "yes's" in the new file
TOTAL=$(grep yes eligible_voters.txt | wc -l)

#print the top ten lines of the file to STDOUT and echo the value of TOTAL
echo -e "\nFirst 10 lines of Original File:\n"
head possible_voters.txt

echo -e "\nFirst 10 lines of New File\n"
head eligible_voters.txt
echo -e "\nThere are $TOTAL eligible voters!!\n"

#remove unnecessary files
rm age.txt new_list.txt
