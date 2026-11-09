#!/bin/bash
# credits: github.com/RuisSoftware/Pi-Hole-Stress-Test

# Set default values
PIHOLE_IP=""
DOMAIN=""
QUERY_COUNT=0
DELAY=0

# Parse command-line arguments
while [[ $# -gt 0 ]]; do
    case "$1" in
        --pihole-ip)
            PIHOLE_IP="$2"
            shift 2
            ;;
        --domain)
            DOMAIN="$2"
            shift 2
            ;;
        --query-count)
            QUERY_COUNT="$2"
            shift 2
            ;;
        --delay)
            DELAY="$2"
            shift 2
            ;;
        -h|--help)
            echo "Usage: $0 --pihole-ip <IP> --domain <DOMAIN> --query-count <COUNT> --delay <SECONDS>"
            exit 0
            ;;
        *)
            echo "Unknown option: $1"
            echo "Use -h or --help for usage instructions."
            exit 1
            ;;
    esac
done

# Validate required parameters
if [[ -z "$PIHOLE_IP" || -z "$DOMAIN" || "$QUERY_COUNT" -eq 0 ]]; then
    echo "Error: Missing required arguments."
    echo "Usage: $0 --pihole-ip <IP> --domain <DOMAIN> --query-count <COUNT> [--delay <SECONDS>]"
    exit 1
fi

send_query() {
    local domain=$1
    dig @$PIHOLE_IP $domain +short
}

echo "Starting Pi-hole stress test"
echo "Pi-hole IP: $PIHOLE_IP"
echo "Query Domain: $DOMAIN"
echo "Number of Queries: $QUERY_COUNT"
echo "Delay between queries: $DELAY seconds"

for ((i=1; i<=QUERY_COUNT; i++))
do
    send_query $DOMAIN
    sleep $DELAY
done

echo "Pi-hole stress test completed"
