#!/bin/bash

ROJO="\e[31m"
VERDE="\e[32m"
MARRON="\e[33m"
AZUL="\e[34m"
PURPU="\e[35m"
CYAN="\e[36m"
GRAY="\e[37m"

ENDCL="\e[0m"

BOLD="\033[1m"
BLINK="\033[5m"
ENDBLINK="\033[0m"

if [[ ! $1 ]]; then
	echo "Ussage: $0 9"
	exit 1
fi

function spaces () {
	
	for _ in $(seq 0 $1); do
		echo -n " "
	done

}

function random_things () {

	case $1 in

		0)
			echo -ne "$BOLD$ROJO$2$ENDCL$ENDBLINK"
		;;

		1)
			echo -ne "$VERDE$2$ENDCL"
		;;

		2)
			echo -ne "$MARRON$2$ENDCL"
		;;

		3)
			echo -ne "$AZUL$2$ENDCL"
		;;
		
		4)
			echo -ne "$PURPU$2$ENDCL"
		;;

		5)
			echo -ne "$CYAN$2$ENDCL"
		;;

		6)
			echo -ne "$GRAY$2$ENDCL"
		;;

		7)
			echo -ne "$BLINK$2$ENDBLINK"
		;;

		8)
			echo -ne "$BLINK$ROJO$2$ENDCL$ENDBLINK"
		;;

		9)
			echo -ne "$BLINK$VERDE$2$ENDCL$ENDBLINK"
		;;

		10)
			echo -ne "$BLINK$AZUL$2$ENDCL$ENDBLINK"
		;;
	esac

}

spaces_final=0

for (( x=1; x < $1+1; x++ )); do
	
	rand_num=$(($RANDOM%10))
	spaces $(($1-$x))
	
	if [[ $x == 1 ]]; then
		spaces_final=$(($1-$x))
		random_things $rand_num "*"
	
	elif [ $x -gt 9 ]; then

		for (( y=1; y < $x; y++ )); do
			rand_num=$(($RANDOM%10))
			random_things $rand_num $((y%10))
		done

		for (( z=$x; z > 0; z-- )); do
			rand_num=$(($RANDOM%10))
			random_things $rand_num $((z%10))
		done

	else

		for (( y=1; y < $x; y++ )); do
			rand_num=$(($RANDOM%10))
			random_things $rand_num $y
		done

		for (( z=$x; z > 0; z-- )); do
			rand_num=$(($RANDOM%10))
			random_things $rand_num $z
		done

	fi

	echo

done

spaces $((spaces_final-1))
echo -ne "\e[33mmWm\e[0m"
echo
spaces $((spaces_final-1))
echo -ne "\e[33mmWm\e[0m"
echo -ne "  \e[31m[][]\e[0m"
echo
