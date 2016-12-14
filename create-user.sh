#!/bin/bash
#Script Auto Create User, Modified by Zihad
echo "---------------------------- Buat Akun ----------------------------"
echo ""
read -p "Username : " Login
read -p "Password : " Pass
read -p "Expired (hari): " mumetndase
IP=`dig +short myip.opendns.com @resolver1.opendns.com`
useradd -e `date -d "$mumetndase days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
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
