#!/usr/bin/env bash

# -------------------------------------------------------------- #
# Bash calculator
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
# functions
# -------------------------------------------------------------- #

function printToTerminalAndWriteToFile(){
  echo $answer
  echo
  echo $answer >> ./log
  echo >> ./log
}

function math_function(){
  read -p "input:" input

  # if input contain sin/cos/tan, do trigonometry
  # example input: sin(30), cos(30), tan(30)
  if [[ $input =~ sin|cos|tan ]]; then
    echo $input >> ./log
    answer=$(echo "import math; print(math.$input)" | python)
    printToTerminalAndWriteToFile
  else
    # else do basic arithmetic
    # example input: 1+1, 2**2*34, 5.3/2, 2-4, 5%2
    echo $input >> ./log
    answer=$(echo "print($input)" | python)
    printToTerminalAndWriteToFile
  fi

}

# -------------------------------------------------------------- #
# Welcome message
# -------------------------------------------------------------- #
echo -e \
"
\e[96m[ Calculator ]\033[0m
This calculator supports + - * / % ** and trigonometry

It also supports floating point numbers

It prints the answer to your terminal session, and logs both your input and the answer into a file called log in your current directory

--------------
Example inputs
--------------
243+432.423
52-23
5*6
6/3.2
2**2
5%2
sin(30)
cos(30)
tan(30)

You can also chain operations like this:
sin(60)+2**23.3
2+4/2-3

Try it out!
"

while true; do
  math_function
done
