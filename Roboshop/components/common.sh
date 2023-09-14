
stat()
{
if [$1 -eq 0 ] ; then
    echo -e "\e[32m Success \e[0m"
    else
    echo -e "\e[31m failure. Look for the logs \e[0m"
    fi
}