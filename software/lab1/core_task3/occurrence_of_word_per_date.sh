#!/usr/bin/env zsh

output=~/Desktop/prog_for_biologists/results/lab1/core_task3
split=~/Desktop/prog_for_biologists/results/lab1/core_task1

# Define words in list
search_words=("Apollo" "planning" "Vega")

# Create CSV file + add header
echo "Date,Word,Count" > $output/results.csv

# Loop through split files (from core task 1)
for file in $split/split_files/event_*(n); do
    
    # Looks for line starting with #
    # We remove the # and trim whitespace
    # 's/^# //' removes '# '
    event_date=$(grep "^#" "$file" | sed 's/^# //' | xargs)

    # Loops and checks for each word (from word list) in split_files
    for word in $search_words; do
        # -c counts occurrences of the specific word (by line not word)
	# use -o for word count and not how many lines the word exist in
        count=$(grep -c "$word" "$file")
        # Only add to CSV if the word was found
        if [[ $count -gt 0 ]]; then
            echo "$event_date,$word,$count" >> $output/results.csv
        fi

    done
done

echo "------------------------------------------"
echo "Process complete. Results saved to results/lab1/core_task3/results.csv"
echo "------------------------------------------"
