#!/usr/bin/env bash


# -------------------------------------------------------------- #
# Bash calculator
# -------------------------------------------------------------- #

# -------------------------------------------------------------- #
# Question requirement
# -------------------------------------------------------------- #
# - Create a shell script calculator.
#  - This shell script will be able to perform the following task: Addition, Subtraction, Multiplication and Division.
#  - The user of the shell script can choose which operation to perform, perform the operation and view the result on the terminal or on a file.
# - Optional challenge task : Implement different arithmetic/mathematical functions such as modulus, or trigonometric function
# -------------------------------------------------------------- #


# -------------------------------------------------------------- #
# Basic arithmetic
# -------------------------------------------------------------- #

# Python is included in major linux distributions
# if not, fall back to using bc

# Fulfilled:
# Addition
# Subtraction
# Multiplication
# Division
# Exponentiation
# Modulus
function python_way_arithmetic(){
  echo "print($1)" | python
}
#supports +-/* ** %


function basic_arithmetic(){
  echo "scale=2; $1" | bc --mathlib
}
# Utilizing `bc` command at the core
# --mathlib enabled floating point results
# scale defines floating point precision of result
# $1 means first argument passed to it

# -------------------------------------------------------------- #
# Challenge tasks
# -------------------------------------------------------------- #

#function trigonometric(){

#}


# -------------------------------------------------------------- #
# Unit testing
# -------------------------------------------------------------- #

# Integers
#basic_arithmetic 10+5
#basic_arithmetic 10-5
#basic_arithmetic 10-5
#basic_arithmetic 10/2

## Floating point
#basic_arithmetic 10.5/2
#basic_arithmetic 10.5+2.3
#basic_arithmetic 10.5-2.124

#basic_arithmetic 9999/2.4
#basic_arithmetic 9999432432423423432/2.3

#exponentiation 2 2

#modulus 5 2
#modulus 10 2
##modulus "5.2" 2
#modulus 2443 34
##modulus 5 2

#python_way_arithmetic 4**2
#python_way_arithmetic 2/2
#python_way_arithmetic 2//2
#python_way_arithmetic 2.2%2


while true; do
  read -p "Calc:" input
  python_way_arithmetic "$input"
done
