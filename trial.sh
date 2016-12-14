#!/bin/bash
#Script auto create trial user SSH
#yg akan expired setelah 1 hari
#Modified by Zihad


Login=trial`</dev/urandom tr -dc X-Z0-9 | head -c4`
hari="1"
Pass=`</dev/urandom tr -dc a-f0-9 | head -c9`
IP=`dig +short myip.opendns.com @resolver1.opendns.com`
useradd -e `date -d "$hari days" +"%Y-%m-%d"` -s /bin/false -M $Login
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
echo -e ""
echo -e "----------------------------"
echo -e "Data Login:"
echo -e "----------------------------"
echo -e "Host/IP : $IP "
echo -e "Dropbear Port : 443, 110, 109"
echo -e "Squid Proxy : 8080"
echo -e "Username : $Login"
echo -e "Password : $Pass"
echo -e "Aktif Sampai : $exp "
echo -e "----------------------------"
echo -e ""
