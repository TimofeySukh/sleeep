# Sleeep

A GENIUS bash script to toggle automatic sleep mode on Linux.

## What it does

The script works as a toggle:
- **First run** — blocks automatic sleep
- **Second run** — removes the block

## Set up
```
git clone git@github.com:TimofeySukh/sleeep.git
cd sleeep
chmod +x main.sh
sudo cp main.sh /usr/local/bin/sleeep
```
## Output examples

```
⛔ Sleep mode: BLOCKED (Computer will NOT sleep)
✅ Sleep mode: UNLOCKED (Computer will sleep by timer)
```
