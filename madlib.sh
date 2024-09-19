
#!/bin/bash


clear
echo "Let's build a mad-lib!"

read -p "1. Name an unusual sport: " NOUN1
read -p "2. Name a UVA color: " NOUN2
read -p "3. Name an animal: " NOUN3
read -p "4. Give a verb ending in -ing: " VERB1
read -p "5. A verb that associates with water and ends with -ing: " VERB2
read -p "6. Give an adjective: " ADJECTIVE1
read -p "7. Name a place at UVA: " NOUN4
read -p "8. Name a body part: " NOUN5

echo "Once upon a time, there was a $NOUN3 that loved playing $NOUN1. This
$NOUN3 has $NOUN2 color hair and was always $VERB1 in town. One day, it
decided to go to $NOUN4 where it saw a group of animals $VERB2. The $NOUN3
joined them and felt very $ADJECTIVE1. Unfortunately, $NOUN3 fell and hurt
his $NOUN5."
