#!/usr/bin/env zsh

split=~/Desktop/programming_for_biologists/results/lab1/optional_task1/split_files

# Ask for words
# -n no newline
# read saves user input as variable into list search_words
# -A separates words based on spaces, so not saved as one string
echo -n "Enter the words you want to search for (separated by spaces): "
read -A search_words

# Loop through each input word
for word in $search_words; do

    # Wordcount for each word (the current word of this loop)
    word_total=0

    echo "\nSearching for: $word"
    echo "------------------------------------------"
    #printf prints variable Date in 15 width column and variable Count in 5 width column
    printf "%-15s | %-5s\n" "Date" "Count"
    echo "------------------------------------------"

    # Scan all split files for the current word (* means all event_ files, n for numeric order)
    for file in $split/event_*(n); do
        # Extract date from the # line
        event_date=$(grep "^#" "$file" | sed 's/^# //' | xargs)

        # Count how many words (word, WORD and Word all works bcz -i)
        count=$(grep -ic "$word" "$file")

	# Only counts if word exists in that file
        if [[ $count -gt 0 ]]; then
	    #printf prints variable Date in 15 width column and variable Count in 5 width column
            printf "%-15s | %-5s\n" "$event_date" "$count"
            # Add to the current word's total
            word_total=$(( word_total + count ))
        fi
    done

    # Print final wordcount for word tally for this word before moving to the next
    echo "------------------------------------------"
    echo "Total for '$word': $word_total"
    echo "=========================================="
done

