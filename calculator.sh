#!/usr/bin/env bash


# -------------------------------------------------------------- #
# Bash calculator
# -------------------------------------------------------------- #

# TODO: push as github gist / a github repo file, then include instructions to curl and run it


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

function basic(){
  while true; do
    read -p "Calc:" input
    python_way_arithmetic "$input"
  done
}


#function basic_arithmetic(){
  #echo "scale=2; $1" | bc --mathlib
#}
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
# Welcome message
# -------------------------------------------------------------- #
echo -e \
"
\e[34m[ Calculator ]\033[0m
------------------------------------
Choose operation by index number:
------------------------------------
1) + - / * ** %
2) Trigonometry
------------------------------------
"
read -p index: operationIndexNum

# case esac
case "$operationIndexNum" in
  1)
    basic
    ;;
  2)
    trigonometric
    ;;
  *)
    #echo $"Usage: $0 {start|stop|restart|condrestart|status}"
    exit 1
esac
