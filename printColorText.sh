#!/bin/bash
correctCountOfArguments=3
countOfArguments=$#
textColor=$1
backgroundColor=$2
text=$3
colorsList=( -d -r -g -y )

DEFAULT="\e[39m"
RED="\033[0;31m"
GREEN="\033[32m"
YELLOW="\033[1;33m"

DEFAULT_BACKGROUND="\e[49m"
RED_BACKGROUND="\e[41m"
GREEN_BACKGROUND="\e[42m"
YELLOW_BACKGROUND="\e[43m"



help() {
echo -e "Please enter one of the next arguments: \n
         \t-d \tPrints text or background in default color\n
         \t-r \tPrints text or background in red color\n
         \t-g \tPrints text or background in green color\n
         \t-y \tPrints text or background in yellow color\n"
}



checkArgumentsCount() {
if [[ $countOfArguments -ne $correctCountOfArguments ]]; then
        echo "Wrong arguments count. Should be $correctCountOfArguments arguments, but current count is $countOfArguments"
        exit
    else
        echo "Arguments count is right"
    fi
}


isTextColorArgumentValid() {
if [[ " ${colorsList[@]} " =~ " ${textColor} " ]]; then
    echo "Text color argument is right"
else
    echo "Sorry, but text color argument is wrong"
    help
    exit
fi
}


isBackgroundColorArgumentValid() {
if [[ " ${colorsList[@]} " =~ " ${backgroundColor} " ]]; then
    echo "Background color argument is right"
else
    echo "Sorry but background color argument is wrong"
    help
    exit
fi
}


getTextColor() {
case $textColor in
    "-d")
    echo "${DEFAULT}"
    ;;

    "-r")
    echo "${RED}"
    ;;

    "-g")
    echo "${GREEN}"
    ;;

    "-y")
    echo "${YELLOW}"
    ;;

esac
}


getBackgroundColor() {
case $backgroundColor in
    "-d")
    echo "${DEFAULT_BACKGROUND}"
    ;;

    "-r")
    echo "${RED_BACKGROUND}"
    ;;

    "-g")
    echo "${GREEN_BACKGROUND}"
    ;;

    "-y")
    echo "${YELLOW_BACKGROUND}"
    ;;

esac
}



print() {
echo -e "$(getTextColor)$(getBackgroundColor)$text$DEFAULT_BACKGROUND"
}



clear
checkArgumentsCount
isTextColorArgumentValid
isBackgroundColorArgumentValid
#defineTextColor
print


