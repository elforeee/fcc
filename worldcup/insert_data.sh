#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

#until loop with games.csv

echo "$($PSQL "truncate teams cascade")"

sort -t ',' -k 2,2 games.csv | while IFS=, read year round winner opponent winner_goals opponent_goals;
do
	if [[ $year != year ]]
	then
		winner_id=$($PSQL "select team_id from teams where name like '$winner'")
		opponent_id=$($PSQL "select team_id from teams where name like '$opponent'")
	fi
	if [[ $round == "Eighth-Final" ]]
	then
		if [[ -z $winner_id ]]
		then
			insert_winner=$($PSQL "insert into teams(name) values('$winner')")
			if [[ $insert_winner == "INSERT 0 1" ]]
			then
				echo insert $winner
				winner_id=$($PSQL "select team_id from teams where name like '$winner'")
			fi
		else
			echo $winner already here
		fi
		if [[ -z $opponent_id ]]
		then
			insert_opponent=$($PSQL "insert into teams(name) values('$opponent')")
			if [[ $insert_opponent == "INSERT 0 1" ]]
			then
				echo insert $opponent
				opponent_id=$($PSQL "select team_id from teams where name like '$opponent'")
			fi
		else
			echo $opponent already here
		fi
	fi
	if [[ $year != year ]]
	then
		echo  $year $round $winner $opponent $winner_id $opponent_id
		insert_game=$($PSQL "insert into games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) values($year, '$round', $winner_id, $opponent_id, $winner_goals, $opponent_goals)")
	fi

done
