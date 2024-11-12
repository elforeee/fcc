#!/bin/bash
psql="psql -X  --tuples-only --username=freecodecamp --dbname=salon -c "
services=$($psql "select * from services")
amount_of_services=$(echo "$services" | wc -l)
service_menu() {
	echo "$services" | while read service_id name
	do
		echo -e "$service_id)$name" | sed 's/|//'
	done
	read SERVICE_ID_SELECTED
	if (( SERVICE_ID_SELECTED >= 1 && SERVICE_ID_SELECTED <= amount_of_services ))
	then
		echo Enter phone:
		read CUSTOMER_PHONE
		CUSTOMER_NAME=$($psql "select name from customers where phone='$CUSTOMER_PHONE'")
		if [[ -z $CUSTOMER_NAME ]]
		then
			echo "Haven't seen you before, what's your name?"
			read CUSTOMER_NAME
			new_customer_insert=$($psql "insert into customers(phone, name) values('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
		fi
		echo hello $CUSTOMER_NAME
		CUSTOMER_ID=$($psql "select customer_id from customers where phone='$CUSTOMER_PHONE'")
		echo Choose time:
		read SERVICE_TIME
		SERVICE_NAME=$($psql "select name from services where service_id=$SERVICE_ID_SELECTED")
		new_appointment_insert=$($psql "insert into appointments(customer_id, service_id, time) values($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
		echo -e "I have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
	else
		service_menu
	fi
}
service_menu
