function save_to_file(){
  mkdir -p calc_log
  scriptStartTime=$(date '+%Y-%m-%d_%H:%M:%S')
  script "./calc_log/$scriptStartTime"_calculator.log --command "bash ./calculator.sh"
}

save_to_file
