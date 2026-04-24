#!/usr/bin/env zsh

output=~/Desktop/prog_for_biologists/results/lab1/optional_task1/split_files
split=~/Desktop/prog_for_biologists/results/lab1/optional_task1/split_files
data=~/Desktop/prog_for_biologists/data/lab1/text_file.txt

# List of words to search (for loop)
search_words=("Apollo" "planning" "Vega")

# Split file into individual date files
mkdir -p $output

# -k: Do not remove output files on error
# -f: Prefix for  new files, aka event_...
# -s silences the weird counting on screen
# '/^#/': What to split on (lines starting with #)
# 999 and -n 3 repeats 999 times and ensure it doesn't cap at 99 files and whole file is processed
csplit -k -s -f "$split/event_" -n 3 "$data" '/^#/' '{999}'


for file in $output/event_*(n); do

    # Extract the date from the # line
    event_date=$(grep "^#" "$file" | sed 's/^# //' | xargs)

    # Check each word
    for word in $search_words; do
        count=$(grep -c "$word" "$file")

        # Only print if the word was found
        if [[ $count -gt 0 ]]; then
            # printf formats the output into neat columns
            printf "%-10s | %-9s | %d\n" "$event_date" "$word" "$count"
        fi
    done
done

