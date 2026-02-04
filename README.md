# Sleeep

A GENIUS bash script to toggle automatic sleep mode on Linux.

## What it does

The script works as a toggle:
- **First run** — blocks automatic sleep
- **Second run** — removes the block

## How it works

The script uses `systemd-inhibit` to block sleep. State is stored in `/tmp/sleeep_block.pid`.

## Output examples

```
⛔ Sleep mode: BLOCKED (Computer will NOT sleep)
✅ Sleep mode: UNLOCKED (Computer will sleep by timer)
```
