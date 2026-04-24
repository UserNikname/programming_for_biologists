# Splits files per date

#!/usr/bin/env zsh 
# shenbag

# Makes it so that it will always find the path even if I am in another file
output=~/Desktop/prog_for_biologists/results/lab1/core_task1/split_files
split=~/Desktop/prog_for_biologists/results/lab1/core_task1/split_files
data=~/Desktop/prog_for_biologists/data/lab1/text_file.txt

# '-p' ensures output location exists
mkdir -p $output


# Split command
# -k: Do not remove output files on error
# -f: Prefix for  new files, aka event_...
# -s silences the weird counting on screen
# '/^#/': What to split on (lines starting with #)
# '{999}': Repeat for 999 instances (for all instances {*}, NOT supported)
# -n 3 ensures files don't cap at 99
csplit -k -s -f "$split/event_" -n 3  "$data" '/^#/' '{999}'


echo "------------------------------------------"
echo "Done! The files are split and are located in results/split_files"
echo "Amount of files split:"
# ls lists content of folder
# | wc -l counts the list that was printed
ls "$output" | wc -l
echo "------------------------------------------"
