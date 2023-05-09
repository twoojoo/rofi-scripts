#1/bin/bash

script_path=$(realpath "$0")
script_name=$(echo $0 | rev | cut -d "/" -f1 | rev)
script_dir="${script_path/$script_name/""}"
theme="${script_dir}theme-narrow.rasi"

function print_error {
	rofi -e "Error: $1" 
}

tmuxinator_folder="$HOME/.tmuxinator"

choiche=$(ls $tmuxinator_folder | cut -d "." -f 1 | sort | rofi -dmenu -i -theme $theme -w 100 -p "Tmuxinator:")

eval "alacritty -e tmuxinator start $choiche"