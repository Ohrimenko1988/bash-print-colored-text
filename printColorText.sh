#!/bin/bash
correctCountOfArguments=2
countOfArguments=$#
color=$1
text=$2
listOfArguments=( -b -r -g -y )


help() {
echo -e "Please enter one of the next arguments: \n
         \t-b \tPrints inputed text in bold mode\n
         \t-r \tPrints inputed text in red color\n
         \t-g \tPrints inputed text in green color\n
         \t-y \tPrints inputed text in yellow color\n"
}



checkArgumentsCount() {
if [[ $countOfArguments -ne $correctCountOfArguments ]]; then
        echo -e "\n\nWrong arguments count. Should be $correctCountOfArguments arguments, but current count is $countOfArguments\n\n"
    else
        echo -e "\n\nArguments count is right\n\n"
    fi
}



checkArgumentsValid() {
if [[ " ${listOfArguments[@]} " =~ " ${color} " ]]; then
    return 0;
else
    return 1;
fi
}



printIfTrue() {
if checkArgumentsValid ; then
    echo -e "\n\nSpecified argument is valid\n\n"
else
    echo -e "\n\nSorry but inputed argument is wrong\n\n"
    help
fi
}



colorized() {
echo -e "\033[37;1;41m $text \033[0m"




}



clear
checkArgumentsCount
#checkArgumentsValid
printIfTrue
colorized
#help


