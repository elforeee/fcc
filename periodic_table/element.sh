if [ $# -eq 0 ]
then
	echo Please provide an element as an argument.
	exit 0
fi
psql="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"
if [[ $(echo $1 | sed -n -r "/^[A-Z][a-z]?$/p") ]]
then
	WHERE="e.symbol='$1'" 
elif [[ $(echo $1 | sed -n -r "/^[0-9]+$/p") ]]
then
	WHERE="e.atomic_number=$1" 
elif [[ $(echo $1 | sed -n -r "/^[A-Z][a-z]+$/p") ]]
then
	WHERE="e.name='$1'" 
fi

element_info=$($psql "select *
from properties p
join elements e on p.atomic_number = e.atomic_number
join types t on p.type_id = t.type_id
where $WHERE")
if [[ -z $element_info ]]
then
	echo I could not find that element in the database.
else
IFS="|" 
read atomic_number melting boiling bla atomic_mass bla symbol name bla type_el <<< $element_info 
echo "The element with atomic number $atomic_number is $name ($symbol). It's a $type_el, with a mass of $atomic_mass amu. $name has a melting point of $melting celsius and a boiling point of $boiling celsius."
fi
