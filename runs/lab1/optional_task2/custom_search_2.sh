#!/usr/bin/env zsh


split=~/Desktop/programming_for_biologists/results/lab1/optional_task1/split_files


# Don't ask for words (predetermined List of words to search for (for loop))
# search_words=("Apollo" "planning" "Vega")

# Ask for words
# -n no newline
# read saves user input as variable into list search_words
# -A separates words based on spaces, so not saved as one string
echo -n "Enter the words you want to search for (separated by spaces): "
read -A search_words

echo "------------------------------------------"
#printf prints Date in 15 width column, Word in 10 width column and Count in 5 width column
printf "%-15s | %-10s | %-5s\n" "Date" "Word" "Count"
echo "------------------------------------------"

# Scan all split files (* means all event_ files, n for numeric order)
for file in $split/event_*(n); do
    
    # Extract the date from the # line
    event_date=$(grep "^#" "$file" | sed 's/^# //' | xargs)

    # Check each word the user provided
    for word in $search_words; do
        # (word, WORD and Word all works bcz -i)
        count=$(grep -ic "$word" "$file")

        # Only counts if word exists in that file        
        if [[ $count -gt 0 ]]; then
            #printf prints variable Date in 15 width column, variable word in 10 width column and variable Count in 5 width column
            printf "%-15s | %-10s | %-5s\n" "$event_date" "$word" "$count"
        fi
    done
done
