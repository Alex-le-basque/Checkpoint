#!/bin/bash

#Vérification d'arguments

if [ $# -eq 0 ]

then

	echo "Il manque les noms d'utilisateurs en argument - Fin du script"

	exit 1

fi

#boucle des arguments/user_name

for user_name in "$@"

do

	#Vérification 

	if cat /etc/passwd | grep $user_name > /dev/null

	then

		echo " L'utilisateur $user_name existe déjà"

	else

		#création user

		sudo useradd $user_name > /dev/null

		#vérif de la création

		if [ $? -eq 0 ]

		then

			echo "L'utilisateur $user_name a été créé"

		else

			echo "Erreur à la création de l'utilisateur $user_name"

		fi

	fi

done

		

