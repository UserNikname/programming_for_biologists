
alias l1ct1_split='~/Desktop/programming_for_biologists/runs/lab1/core_task1/split_files.sh'
alias l1ct2_apollo='~/Desktop/programming_for_biologists/runs/lab1/core_task2/split_apollo_count.sh'
alias l1ct2_vega='~/Desktop/programming_for_biologists/runs/lab1/core_task2/split_vega_count.sh'
alias l1ct2_planning='~/Desktop/programming_for_biologists/runs/lab1/core_task2/split_planning_count.sh'
alias l1ct3_csv_list='~/Desktop/programming_for_biologists/runs/lab1/core_task3/occurrence_of_word_per_date.sh'
alias l1ot1_print='~/Desktop/programming_for_biologists/runs/lab1/optional_task1/split_output.sh'
alias l1ot2_custom_search='~/Desktop/programming_for_biologists/runs/lab1/optional_task2/custom_search_2.sh'
alias l1ot3_summary='~/Desktop/programming_for_biologists/runs/lab1/optional_task3/summary_report.sh'

#not needed?
export PATH="/Users/nikolinawennerstrand/Desktop/programming_for_biologists/runs/lab1:$PATH"

alias lt='ls -R'  # Shows all files in all subdirectories
alias ll='ls -lhF'
alias cdd='cd ..'
alias clr='clear'
alias refresh='source ~/.zshrc'


# set default editor to nano, can also use vim
export EDITOR=nano

# set your prompt name
#export PROMPT='%n@%m:%~%# '
export PROMPT='UserN:%~ ' 


# EXAMPLES
# make custom shell variable
MY_VAR="hello"
export MY_VAR
#echo $MY_VAR will print Hello

# ?? tells computer to look in /opt/myapp/bin for programs (makes new directory?)
export PATH=$PATH:/opt/myapp/bin
