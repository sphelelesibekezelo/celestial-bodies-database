#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
  exit 0
fi

if [[ $1 =~ ^[0-9]+$ ]]
then
  ELEMENT=$($PSQL "SELECT * FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number = $1")
else
  if [[ ${#1} -gt 2 ]]
  then
    ELEMENT=$($PSQL "SELECT * FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE name = '$1'")
  else
    ELEMENT=$($PSQL "SELECT * FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE symbol = '$1'")
  fi
fi

if [[ -z $ELEMENT ]]
then
  echo "I could not find that element in the database."
  exit 0
fi

IFS="|" read TYPE_ID ATOM_N SYM NAME ATOM_M MP BP TYPE <<< "$ELEMENT"

echo "The element with atomic number $ATOM_N is $NAME ($SYM). It's a $TYPE, with a mass of $ATOM_M amu. $NAME has a melting point of $MP celsius and a boiling point of $BP celsius."
