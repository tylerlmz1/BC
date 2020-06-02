read -p "input:" input

# if input contain sin/cost/tan
if [[ $input =~ sin|cos|tan ]]; then
  echo "It's there!"
fi
