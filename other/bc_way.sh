#function basic_arithmetic(){
  #echo "scale=2; $1" | bc --mathlib
#}
# Utilizing `bc` command at the core
# --mathlib enabled floating point results
# scale defines floating point precision of result
# $1 means first argument passed to it
