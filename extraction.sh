#!/bin/bash

#Requirements: The Migration Distance Degree file should be in the same folder as the script. 
#Mobility files 0605-Call.pai.sordate.txt should also be in the same folder

array=()
#Filtering all the people whose distance of COG between 0605 and 0606 is greater than 10
cat /export/home/mraza/Rwanda_Output/0818/MigrationDistance/MigrationDistanceDegree-0607.csv |awk -F ',' '$7>10 {print $1,$7}'>>./subscribers.csv

for (( c=1; c<=200; c++ ))
do
        contact=`shuf -n 1 ./subscribers.csv |cut -d ' ' -f1`


        echo "Extracted contact is " $contact
        echo $contact >>./contacts.txt

        array+=($contact)
done


for each in "${array[@]}"
        do
                `grep ${each} ./0605-Call.pai.sordate.txt >>./calls_05/${each}.csv`
		 `grep ${each} ./0606-Call.pai.sordate.txt >>./calls_06/${each}.csv`
        done

