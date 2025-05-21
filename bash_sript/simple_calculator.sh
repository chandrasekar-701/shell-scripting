#!/bin/bash
echo " play with calculation "
echo "------------------------"

read_input()
{
        read -p " enter the first number : " num1
        read -p " enter the second number : " num2
}

echo -e "[a]addition\n[b]substraction\n[c]multiplication\n[d]division"
read -p "choose the operation : " choice

case $choice in
        [aA])
        read_input
        result=`expr $num1 + $num2`
        echo " the addition of two number is : $result " ;;

        [bB])
        read_input
        result=$((num1-num2))
        echo " the substraction of two number is : $result" ;;

        [cC])
        read_input
        result=`expr $num1 \* $num2`    ### In Bash script, the " * " is considered as wildcard(all files) that matches multiple files in the current directory so we need to escape(\) it. esacpe is not mandatory for other operations.
        echo " the multiplication of two number is : $result " ;;
        [dD])
        read_input
        if [ $num2 -ne 0 ]
        then
        result=`expr $num1 / $num2`
        echo " the division of two number is : $result "
        else
                echo " choose the divisor other than zero "
                read_input
                result=`expr $num1 / $num2`
                echo " the division of two number is : $result "
         fi     ;;

        *)
                echo " please enter the valid operator"

esac
