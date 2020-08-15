#!/usr/bin/env bash

# Check if Python exists, exit with error message if python is not installed
if ! [ -x "$(command -v python)" ]; then
  echo \
    'Error: Python is not installed.
  run
  sudo apt install python
  if you are using Debian-based Linux distro.'>&2
  exit 1
fi

function promptAndDoMath(){

  read -p "input:" input >> ./log
  echo "$input" >> ./log

  if [[ $input =~ sin|cos|tan ]]; then
    answer=$(echo "import math; print(math.$input)" | python)
  else
    answer=$(echo "print($input)" | python)
  fi

  echo -e "$answer\n" | tee -a ./log
}

# -------------------------------------------------------------- #
# Welcome message
# -------------------------------------------------------------- #
echo -e \
"
\e[96m[ Calculator ]\033[0m

This calculator supports: + - * / % **, trigonometry,
floating point numbers and operation chaining

It also prints input and answer to the terminal and a log file in your current directory

Example inputs:

2+4/2-3
sin(60)+2**23.3
"

while true; do
  promptAndDoMath
done
