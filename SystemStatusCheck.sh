#!Bin/bash

#Identify the system's public IP.
echo "=>Your public IP address is: $(curl -s ifconfig.co)"


#Identify the private IP address assigned to the system's network interface.
echo "=>Your private IP address is: $(ifconfig | grep broadcast | awk '{print $2}')"

#Display the MAC address (masking sensitive portions for security).
echo "=>Your MAC address is: $(ifconfig | grep ether | awk '{print $2}')"

#Display the percentage of CPU usage for the top 5 processes.
echo "=>Top 5 processes: $(ps -eo pid,%cpu,command --sort=%cpu | tail -n 5 | grep -v 'ps -eo pid')"
 
#Display memory usage statistics: total and available memory.
echo "=>Memory usage statistics: $(free -h | awk '/Mem:/ {print "Total:", $2, "Available:", $7}')"

#List active system services with their status.
echo "=>Running services: $(service --status-all | grep -F '[ + ]')"

#Locate the Top 10 Largest Files in /home.
echo "=>Top ten [10] largest files in home: $(du -ah /home | sort -rh | head -10)"
