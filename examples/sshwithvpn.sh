#!/bin/bash

# SSH AUTNENTICATION
# Please use app's secret manager to set your SSH private key
echo "========================================="
echo "==            SSH example             ==="
echo "== Login to remote host and view logs ==="
echo "=========================================="
sleep 1

# Pull last 100 lines of the system logs
echo ssh -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null user@my.vpnaccessiblehost.com tail -100 /var/log/syslog

echo ""
echo "## END OF EXECUTION ##"
