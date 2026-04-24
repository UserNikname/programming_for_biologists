# Calculates how many Apollo in the split files and outputs number

#!/usr/bin/env zsh

word_search=~/Desktop/prog_for_biologists/results/lab1/core_task1


# Make list with files containing Apollo
apollo_list=()

# Loop through the split files (from core task 1)
for file in $word_search/split_files/event_*(n); do
    # Check if the file contains "Apollo"
    # -q (quiet) stops from printing distracting code
    # $file is the for loop variable name
    if grep -q "Apollo" "$file"; then
        # Add filename to list
        apollo_list+=("$file")
    fi
done

echo "------------------------------------------"
# ${#list_name} to get count ($apollo_list for names of files)
echo "Amount of files containing 'Apollo': ${#apollo_list}"
echo "$apollo_list"
echo "------------------------------------------"
