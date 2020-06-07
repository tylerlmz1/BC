#!/usr/bin/env bash

# -------------------------------------------------------------- #
# Bash calculator
# -------------------------------------------------------------- #

# -------------------------------------------------------------- #
# Check if Python exists
# -------------------------------------------------------------- #
# Python is included in major linux distros
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

  # print answer to terminal and add newline rightafter
  echo $answer
  echo

  # print answer to log file and add newline rightafter
  echo $answer >> ./log
  echo >> ./log

}

function mathFunction(){

  read -p "input:" input

  # if input contain sin/cos/tan, do trigonometry
  if [[ $input =~ sin|cos|tan ]]; then

    # append input to log file
    echo $input >> ./log

    # do trigonometry
    # example input: sin(30), cos(30), tan(30)
    answer=$(echo "import math; print(math.$input)" | python)

    printToTerminalAndWriteToFile

  # else do basic arithmetic
  else

    # append input to log file
    echo $input >> ./log

    # do basic arithmetic
    # example input: 1+1, 2**2*34, 5.3/2, 2-4, 5%2
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

This calculator supports: + - * / % **, trigonometry,
floating point numbers and operation chaining

In addition to printing the answer to your terminal session,
it also logs both your input and the answer into a file
called log in your current directory

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
------------------------------------------
"

while true; do
  mathFunction
done
