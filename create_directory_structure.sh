#!usr/bin/env zsh
for DIR_NAME in data software results runs
do #Loop start
mkdir $DIR_NAME #Create directory
echo $DIR_NAME #Print directory name
done #Loop end
echo "Finished. Your project structure is ready!"

