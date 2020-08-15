#!/usr/bin/env bash

# Check if Python exists
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

#function printToTerminalAndWriteToFile(){

  ## print answer to terminal and add newline rightafter
  #echo $answer
  #echo

  ## print answer to log file and add newline rightafter
  #echo $answer >> ./log
  #echo >> ./log

#}

function promptOpsAndDoMath(){
  read -p "input:" input >> ./log
  echo "$input" >> ./log

  if [[ $input =~ sin|cos|tan ]]; then
    answer=$(echo "import math; print(math.$input)" | python)
  else
    answer=$(echo "print($input)" | python)
  fi

  echo $answer | tee -a ./log

}

# -------------------------------------------------------------- #
# Welcome message
# -------------------------------------------------------------- #
#echo -e \
#"
#\e[96m[ Calculator ]\033[0m

#This calculator supports: + - * / % **, trigonometry,
#floating point numbers and operation chaining

#In addition to printing the answer to your terminal session,
#it also logs both your input and the answer into a file
#called log in your current directory

#--------------
#Example inputs
#--------------
#243+432.423
#52-23
#5*6
#6/3.2
#2**2
#5%2
#sin(30)
#cos(30)
#tan(30)

#You can also chain operations like this:
#sin(60)+2**23.3
#2+4/2-3

#Try it out!
#------------------------------------------
#"

while true; do
  #mathFunction
  promptOpsAndDoMath
done
