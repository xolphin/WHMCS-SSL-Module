#!/bin/bash

reset=$(tput sgr0)
red=$(tput setaf 1)
green=$(tput setaf 2)

folders=(
    "../lang/overrides/"
    "../modules/addons/sslcertificates"
    "../modules/servers/sslcertificates"
    "../templates/orderforms/boxes/configproduct-blocks/"
    "../xolphin/Database"
    "../xolphin/symantec"
)

for i in "${folders[@]}"
do
    if [ ! -d $i ]; then
        echo "${red}FAIL${reset} $i"
    else
        echo "${green}PASS${reset} $i"
    fi
done

files=(
    "../lang/overrides/dutch.php"
    "../lang/overrides/english.php"
    "../modules/addons/sslcertificates/sslcertificates.php"
    "../modules/addons/sslcertificates/webhook.php"
    "../modules/addons/sslcertificates/Tabs/SSLCertificates.php"
    "../modules/servers/sslcertificates/hooks.php"
    "../modules/servers/sslcertificates/sslcertificates.php"
    "../templates/orderforms/boxes/configureproduct.tpl"
    "../xolphin/Xolphin.php"
    "../xolphin/Database/Actions/abstractActions.php"
    "../xolphin/Database/Actions/Server.php"
    "../xolphin/Database/Actions/Xolphin.php"
    "../xolphin/Database/Tables.php"
    "../xolphin/symantec/intermediate-CA.crt"
    "../xolphin/Module.php"
    "../xolphin/Manage.php"
    "../xolphin/Xolphin.php"
)

for i in "${files[@]}"
do
    if [ ! -f $i ]; then
        echo "${red}FAIL${reset} $i"
    else
        echo "${green}PASS${reset} $i"
    fi
done

echo -e "\e[0mDONE"