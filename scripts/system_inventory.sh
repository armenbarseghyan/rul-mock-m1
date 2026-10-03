echo "# System Inventory"
echo 
echo "Generated at: $(date '+%F %T')"
echo 
echo "## Host"
echo "Hostname: $(hostname)"
echo "Kernel: $(uname -r)"
echo "Uptime: $(uptime -p)"
echo
echo "## Memory Pressure"
free -m | awk '/^Mem:/ {printf "Used: %d MB (%.2f%% of %dMB)\n", $3, 100/$2 * $3, $2;  printf "Available: %d MB (%.2f%% of %dMB)\n", $7, 100/$2 * $7, $2}'
echo
echo "## Logged-in Users"
echo "Total sessions: $(who | wc -l)"
who
echo
echo "## Disk Inodes"
echo "$(df -i | awk 'NR==1 || /^\/dev\//')"

