#! /bin/bash

if [ $# -ne 3 ] 
then	
	echo "usage: ./2024-OSS-Project1.sh file1 file2 file3"
	exit 1
fi

echo "************OSS1 - Project1************"
echo "*      StudentID : 12222512           *"
echo "*           Name : KIM MINSEO         *"
echo "***************************************"

menuf(){
echo -e "\n[MENU]
1. Get the data of Heung-Min Son's Current Club, Appearances, Goals, Assists in players.csv
2. Get the team data to enter a league position in teams.csv
3. Get the Top-3 Attendance matches in matches.csv
4. Get the team's league position and team's top scorer in team.csv & players.csv
5. Get the modified format of date_GMT in matches.csv
6. Get the data of the winning team by the largest difference on home stadium in teams.csv & matches.csv
7. Exit"
read -p "Enter your CHOICE (1~7):" choiceNum

case "$choiceNum" in
1)
	read -p "Do you want to get the Heung-Min Son's data?(y/n):" yOrN1
	if [ "$yOrN1" = "y" ]
	then 
		cat players.csv | awk -F, '$1~"Heung"{print "Team:" $4 ", Appearance:" $6 ", Goal:" $7 ", Assist:" $8}'
	fi;;

2)
	read -p "What do you want to get the team data of league_position[1~20]:" league_position
	cat teams.csv | awk -v lp=$league_position -F, '$6 == lp {print lp, $1, (($2/($2+$3+$4)))}';;
3)
	read -p "Do you want to know Top-3 attendance data and average attendance?(y/n):" yOrN3 
	if [ "$yOrN3" = "y" ]
	then
		echo -e "***Top-3 Attendance Match***\n"
		cat matches.csv | sort -t',' -r -k 2 | head -n 3 | awk -F, '{print $3, "vs", $4, "(" $1 ")" } {print $2, $7, "\n"}' 
	fi;;
4)
	read -p "Do you want to get each team's ranking and the highest-scoring player?(y/n):" yOrN4;;
7)
	echo -e "Bye!\n"
	exit 1;;

esac

}

choidNum=0
while [ "$choiceNum" != "7" ]
do
	menuf
done
