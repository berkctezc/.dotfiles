# single core stress test
yes > /dev/null
# for multi core append with &
# later kill the processes with:
# killall yes
# example for 4 cores:
# yes > /dev/null & yes > /dev/null &  yes > /dev/null &  yes > /dev/null &