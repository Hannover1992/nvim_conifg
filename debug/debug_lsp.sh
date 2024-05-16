#!/bin/bash

LOG_FILE="$HOME/.local/state/nvim/lsp.log"  # Updated path

# Regular expression to match error/warning lines and lines containing "index out of range"
PATTERN='\[ERROR\]\|\[WARN\]\|index out of range'

# Grep the log file and display matching lines
grep -E "$PATTERN" "$LOG_FILE"
