#!/bin/bash

# File to store the PID of the blocker process
LOCK_FILE="/tmp/sleeep_block.pid"

if [ -f "$LOCK_FILE" ]; then
    # --- IF LOCK IS ACTIVE (DISABLE IT) ---
    PID=$(cat "$LOCK_FILE")
    
    # Check if the process is still running
    if ps -p $PID > /dev/null; then
        kill $PID
        echo "✅ Sleep mode: UNLOCKED (Computer will sleep by timer)"
        notify-send "Sleeep" "Automatic sleep is now enabled" 2>/dev/null
    else
        echo "⚠ Blocker process not found, cleaning up lock file..."
    fi
    
    # Remove the lock file
    rm "$LOCK_FILE"

else
    # --- IF LOCK IS NOT ACTIVE (ENABLE IT) ---
    
    # Start systemd-inhibit in the background.
    # 'sleep infinity' is a dummy command that runs forever
    # while systemd holds the sleep inhibitor.
    nohup systemd-inhibit --what=idle:sleep --who="SleeepCommand" --why="User toggled sleep block" sleep infinity >/dev/null 2>&1 &
    
    # Save the PID of the launched process
    echo $! > "$LOCK_FILE"
    
    echo "⛔ Sleep mode: BLOCKED (Computer will NOT sleep)"
    notify-send "Sleeep" "Automatic sleep is now disabled" 2>/dev/null
fi