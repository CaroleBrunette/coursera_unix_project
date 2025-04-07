#!/usr/bin/bash env
# File : guessinggame.sh

nb_fichier=$(ls -1 | wc -l )

function isGoodGuess  {
    value=$1
    if [[ $guessvalue -eq $nb_fichier ]] 
    then 
        echo "Congrats:! You won" && return 0
    elif [[ $guessvalue -lt $nb_fichier ]] 
    then
        echo "No... too low... try again..." && return 1
    else  
        echo "No... too high... try again..." && return 1 
    fi
}



success=1

while [[ $success -eq 1 ]] 
do
   echo "How many files are in this actual folder ? Guess and then click Enter"
   read guessvalue
   echo "You enter $guessvalue"
   isGoodGuess $guessvalue
   let success=$?
   if [[ $success -eq  0 ]]
   then 
        break
   fi
   let success=1
done