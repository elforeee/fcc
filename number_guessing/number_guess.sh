#!/bin/bash
let secret_number=$RANDOM%1000
psql="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
echo "Enter your username:"
read username
user_id=$($psql "select user_id from users where username='$username'")
if [[ -z $user_id ]]
then
	echo "Welcome, $username! It looks like this is your first time here."
	insert_user=$($psql "INSERT INTO users(username) VALUES('$username')")
	user_id=$($psql "select user_id from users where username='$username'")
else
	get_games=$($psql "SELECT COUNT(*), MIN(number_of_guesses) from games WHERE user_id=$user_id GROUP BY user_id")
	IFS="|" read games_played best_game <<< $get_games
	echo Welcome back, $username! You have played $games_played games, and your best game took $best_game guesses.
fi
echo Guess the secret number between 1 and 1000:
number_of_guesses=0
echo $secret_number
while read input_number
do
	if [[ ! $input_number =~ ^[0-9]+$ ]]
	then
		echo That is not an integer, guess again:
		continue
	fi
	(( number_of_guesses++ ))
	if (( $input_number < $secret_number ))
	then
		echo "It's higher than that, guess again:"
	elif (( $input_number > $secret_number ))
	then
		echo "It's lower than that, guess again:"
	else
		insert_game=$($psql "INSERT INTO games(user_id, number_of_guesses, secret_number) VALUES($user_id, $number_of_guesses, $secret_number)")
		echo "You guessed it in $number_of_guesses tries. The secret number was $secret_number. Nice job!"
		break
	fi
done

