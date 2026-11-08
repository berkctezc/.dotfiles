#!/bin/bash
# credits: github.com/RuisSoftware/Pi-Hole-Stress-Test
read -p "Enter the Pi-hole IP address: " PIHOLE_IP
read -p "Enter the number of queries to send: " QUERY_COUNT
read -p "Enter the delay (in seconds) between each query: " DELAY

send_query() {
    local domain=$1
    dig @$PIHOLE_IP $domain +short
}

echo "Starting Pi-hole stress test"
echo "Pi-hole IP: $PIHOLE_IP"
echo "Number of Queries: $QUERY_COUNT"
echo "Delay between queries: $DELAY seconds"

for ((i=1; i<=QUERY_COUNT; i++))
do
    DOMAIN="example.com"
    send_query $DOMAIN
    sleep $DELAY
done

echo "Pi-hole stress test completed"