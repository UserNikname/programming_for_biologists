#!/usr/bin/env zsh

word_search=~/Desktop/prog_for_biologists/results/lab1/core_task1

# Make list with files containing Vega
vega_list=()

# Loop through the split files (in folder results/split_files)
for file in $word_search/split_files/event_*(n); do
    # Check if the file contains "Vega"
    # -q (quiet) stops from printing distracting code
    # $file is the for loop variable name
    if grep -q "Vega" "$file"; then
        # Add filename to list
        vega_list+=("$file")
    fi
done

echo "------------------------------------------"
# ${#list_name} to get count ($vega_list for names of files)
echo "Amount of files containing 'Vega': ${#vega_list}"
echo "------------------------------------------"

