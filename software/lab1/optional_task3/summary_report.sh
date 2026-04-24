#!/usr/bin/env zsh

output=~/Desktop/prog_for_biologists/results/lab1/optional_task3
split=~/Desktop/prog_for_biologists/results/lab1/optional_task1/split_files

# Ask for word
echo -n "Enter the word(s) to export to CSV (separated by spaces): "
read -A search_words


# Loop to process each word
for word in $search_words; do

    # Def input word into custom csv-file
    csv_file="$output/results_$word.csv"

    # Check if file should create/reset
    # Only create if word exists
    echo "Date,Word,Count" > $csv_file
    echo "Generating CSV for: $word..."

    # Loop scanning all files for loop word
    for file in $split/event_*(n); do

	# sed removes #
	# xargs removes spaces from heading
        event_date=$(grep "^#" "$file" | sed 's/^# //' | xargs)
        # Store result in 'count' variable, so not need to print in terminal
	# -c counts lines with words
	# -o counts words
	# -i makes A and a ot matter (eg apollo, APOLLO is same)
	# wc -l makes it a number (Word Count Line)
	count=$(grep -oi "$word" "$file" | wc -l)

        if [[ $count -gt 0 ]]; then
            # Add data to loop word's CSV
            echo "$event_date,$word,$count" >> "$csv_file"
        fi
    done
    
    # If file only contains header (no words found), it's deleted
    # wc -l counts, and if content from csv file is empty it is 1 (header)
    if [[ $(wc -l < "$csv_file") -eq 1 ]]; then
        rm "$csv_file"
        echo "No matches for '$word', file not created."
    else
        #echo "Done! Saved to $csv_file"
        echo "Done! Saved to results/lab1/optional_task3/results_$word.csv"

    fi
done
