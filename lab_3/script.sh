#!/bin/bash

#check if the file exists

FILE="$1"

# MSG="HELLO WORLD"
# echo $MSG
if [ ! -e "$1" ]
then
     #file does not exist so we exit
    echo "false"
    exit
fi

count_lines(){
    echo "The number of lines in the file is…"
    cat $FILE | wc -l
}

count_words(){
grep -w "Lorem" "model" "Ipsum" "will" $FILE
}

add_text(){
    echo "Please enter a sentence:"
    read -p 'Input: ' userInput
    #make new line
    echo "" >> $FILE
    echo $userInput >> $FILE
}

copy_and_exit(){
    mkdir solution
    cp $FILE solution
}




# Menu
PS3='Please enter your choice: '
Options=("count_lines()" "count_words()" "add_text()" "copy_and_exit()" "Quit")
select Option in "${Options[@]}"
do
    case $Option in
        "count_lines()")
            count_lines ;;
        "count_words()")
            count_words ;;
        "add_text()")
            add_text ;;
        "copy_and_exit()")
            copy_and_exit ;;
        "Quit")
            break;;
        *) echo "invalid option $REPLY";;
    esac
done

