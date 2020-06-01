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
# Check if Python exists
# -------------------------------------------------------------- #
# Python is included in major linux distributions
# exit with error message if python is not installed
if ! [ -x "$(command -v python)" ]; then
  echo \
    'Error: Python is not installed.
  run

  sudo apt install python

  if you are using Debian-based Linux distro.'>&2
  exit 1
fi

# -------------------------------------------------------------- #
# Basic arithmetic
# -------------------------------------------------------------- #


# Fulfilled:
# Addition
# Subtraction
# Multiplication
# Division
# Exponentiation
# Modulus

# supports + - / * ** % , chaining of operands, etc

function python_way_arithmetic(){
  echo "print($1)" | python
}

function basic_arithmetic_wrapper(){
  while true; do
    read -p "Calc:" input
    python_way_arithmetic "$input"
  done
}


function trigonometric(){
  exit
}



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

case "$operationIndexNum" in
  1)
    basic_arithmetic_wrapper
    ;;
  2)
    trigonometric
    ;;
  *)
    echo -e "\e[31mInvalid index number\e[0m"
    exit 1
esac
