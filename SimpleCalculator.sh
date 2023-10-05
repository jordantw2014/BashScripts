#!/bin/bash

<<COMMENTS
Jordan Wallschlaeger
Assingment 6 - Simple Calculator
CI201 _ PC01
COMMENTS


clear
date > hw6mathout.txt
run_loop=true

while [ "$run_loop" = true ]
do
	read -p "Enter first number: " num1
	read -p "Enter second number: " num2
	read -p "Enter math operation (addition, subtraction, multiplication, division, or modulus): " math_op
	case "$math_op" in
		addition)
			result=$((num1 + num2))
			;;
		subtraction)
			result=$((num1 - num2))
			;;
		multiplication)
			result=$((num1 * num2))
			;;
		division)
			if [ "$num2" -eq 0 ];
			then
				echo "Error: Cannot divide by zero."
				continue
			else
				result=$((num1 / num2))
			fi
			;;
		modulus)
			result=$((num1 % num2))
			;;
		*)
	esac
	
	echo "The result of $num1 $math_op $num2 is $result."
	echo "$num1 $math_op $num2 = $result" >> hw6mathout.txt
	
	read -p "Do you want to perform another operation? (y/n): " cont_loop
	
	if [ "$cont_loop" = "n" ];
	then
		run_loop=false
	fi
done

cat hw6mathout.txt

