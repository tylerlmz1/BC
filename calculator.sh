#!/usr/bin/env bash


# -------------------------------------------------------------- #
# Bash calculator
# -------------------------------------------------------------- #

# -------------------------------------------------------------- #
# Question requirement
#- Create a shell script calculator.
  #- This shell script will be able to perform the following task: Addition, Subtraction, Multiplication and Division.
  #- The user of the shell script can choose which operation to perform, perform the operation and view the result on the terminal or on a file.
#- Optional challenge task : Implement different arithmetic/mathematical functions such as modulus, or trigonometric function
# -------------------------------------------------------------- #

# -------------------------------------------------------------- #
# Features
# - Basic arithmetic
# - Floating point arithmetic
# - Trigonometry
# -------------------------------------------------------------- #

# --mathlib enabled floating point results
# scale defines floating point precision of result

function basic_arithmetic(){
  echo "scale=2; $1" | bc --mathlib
}

# -------------------------------------------------------------- #
# Basic arithmetic
# -------------------------------------------------------------- #
#function addition(){

#}

#function subtraction(){

#}

#function multiplication(){

#}

#function division(){

#}

# -------------------------------------------------------------- #
# Challenge tasks
# -------------------------------------------------------------- #

#function modulus(){

#}

#function trigonometric(){

#}



# -------------------------------------------------------------- #
# Unit testing
# -------------------------------------------------------------- #

# Integers
basic_arithmetic 10+5
basic_arithmetic 10-5
basic_arithmetic 10-5
basic_arithmetic 10/2

# Floating point
basic_arithmetic 10.5/2
basic_arithmetic 9999/2.4
