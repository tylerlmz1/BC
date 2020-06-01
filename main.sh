# call this file if want save to file feature
# if not, `bash calculator.sh` would do

function save_to_file(){
  mkdir -p calc_log
  scriptStartTime=$(date '+%Y-%m-%d_%H:%M:%S')
  #shortRandomString=$(tr -cd '[:alnum:]' < /dev/urandom | fold -w4 | head -n1)
  #logFileName="$shortRandomString-$scriptStartTime.log"
  logFileName="$scriptStartTime.log"
  echo $logFileName
  script "./calc_log/$logFileName" --command "bash ./calculator.sh"
}

save_to_file
