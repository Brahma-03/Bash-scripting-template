a=10


b=abc

LOGGEDIN-USERS=$(who | wc -l)

#a is  10 is integer

echo value of a is : $a
echo ${a}

echo ${b}

Dte=$(date +%F)

echo $Dte


echo Number of logged in users are $LOGGEDIN-USERS
echo value of e is ${e}