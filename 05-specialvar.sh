# Here are special variables

#$0    : This will gives the name of the script that you are running


#$1 to $9 :  you can pass a maximum of 9 variables from the command line when you are running the script

# $*

# $@

# $#

# $$

echo "script name that you are running is $0"

a=10
b=$1
c=$2
d=$3

echo value of a is : $a
echo value od b is : $b
echo value of c is : $c
echo value of d is : $d

# sh scriptname.sh 100 200 300 


echo "Printing the variables thaat we have passed in the script $*"

echo "Printing the variables that we have passed in the script $@"
echo "printing the number variables that we have passed in the script $#"

eecho "printing the PID of the script that wwe are running $$"

