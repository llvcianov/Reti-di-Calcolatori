#!/bin/bash
capinfos "$1" > "INFO.csv"
tshark -r "$1" -qz conv,tcp >> INFO.csv
tshark -r "$1" -qz conv,udp >> INFO.csv
echo "" >> INFO.csv
echo "DNS" >> INFO.csv
tshark -r "$1" -T fields -e frame.time_epoch -e frame.protocols -e dns.a -e dns.qry.name -Y "(dns.flags.response == 1 )" >> INFO.csv
echo "SNI" >> INFO.csv
tshark -r "$1" -T fields -e frame.time_epoch -e frame.protocols -e tls.handshake.extensions_server_name -Y tls.handshake.extensions_server_name >> INFO.csv
echo "HTTP hosts" >> INFO.csv
tshark -r "$1" -T fields -e frame.time_epoch -e frame.protocols -e http.host -Y http.host >> INFO.csv
echo "" >> INFO.csv
echo "ANALISI INDIRIZZI IP CON WHOIS" >> INFO.csv
sort "$IP" -u | grep -v "192.168.*"

while read IP;
do
echo "$IP:"
whois "$IP" | grep -i "orgname\|org-name"
echo ""
done < "whois_commands.log" >> INFO.csv
