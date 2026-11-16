#!/bin/bash

# Set default values
PIHOLE_IP="127.0.0.1"
DOMAIN="127.0.0.1"
QUERY_COUNT=100
DELAY=0
THREADS=1

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
        --threads)
            THREADS="$2"
            shift 2
            ;;
        -h|--help)
            echo "Usage: $0 --pihole-ip <IP> --domain <DOMAIN> --query-count <COUNT> [--delay <SECONDS>] [--threads <COUNT>]"
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
    echo "Usage: $0 --pihole-ip <IP> --domain <DOMAIN> --query-count <COUNT> [--delay <SECONDS>] [--threads <COUNT>]"
    exit 1
fi

# Validate threads parameter
if ! [[ "$THREADS" =~ ^[1-9][0-9]*$ ]]; then
    echo "Error: --threads must be a positive integer."
    exit 1
fi

# Helper function for high-resolution timestamp in milliseconds
get_time_ms() {
    if [[ -n "$EPOCHREALTIME" ]]; then
        # Bash 5.0+ built-in microsecond precision without spawning subshells
        local s="${EPOCHREALTIME%.*}"
        local us="${EPOCHREALTIME#*.}"
        echo $(( s * 1000 + 10#${us:0:3} ))
    else
        # Fallback for Bash 4.x on Linux
        echo $(( $(date +%s%N) / 1000000 ))
    fi
}

send_query() {
    local domain=$1
    local thread_id=$2
    local query_num=$3

    (
        local start_ms end_ms latency result
        start_ms=$(get_time_ms)
        result=$(dig @"$PIHOLE_IP" "$domain" +short +tries=1 +timeout=1 | tr '\n' ' ' | sed 's/ *$//')
        end_ms=$(get_time_ms)
        latency=$(( end_ms - start_ms ))

        if [[ -z "$result" ]]; then
            result="TIMEOUT/NO_RESPONSE"
        fi

        echo "[Query #$query_num] [Thread $thread_id] $result (${latency}ms)"
    ) &
}

echo "Starting Pi-hole stress test"
echo "Pi-hole IP: $PIHOLE_IP"
echo "Query Domain: $DOMAIN"
echo "Number of Queries: $QUERY_COUNT"
echo "Delay between queries: $DELAY seconds"
echo "Max Parallel Threads: $THREADS"

# Track active PIDs mapped to thread slots 1..THREADS
declare -a SLOT_PIDS

for ((i=1; i<=QUERY_COUNT; i++))
do
    assigned_thread=0

    # Find an available thread slot (1 to THREADS)
    while [[ $assigned_thread -eq 0 ]]; do
        for ((t=1; t<=THREADS; t++)); do
            pid="${SLOT_PIDS[$t]}"
            if [[ -z "$pid" ]] || ! kill -0 "$pid" 2>/dev/null; then
                assigned_thread=$t
                break
            fi
        done

        if [[ $assigned_thread -eq 0 ]]; then
            wait -n 2>/dev/null || sleep 0.005
        fi
    done

    send_query "$DOMAIN" "$assigned_thread" "$i"
    SLOT_PIDS[$assigned_thread]=$!

    if [[ "$DELAY" != "0" ]]; then
        sleep "$DELAY"
    fi
done

# Wait for remaining background queries to finish printing
wait

echo "Pi-hole stress test completed"
