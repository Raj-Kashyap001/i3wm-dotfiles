#!/bin/bash

# Get the current workspace number
current_ws=$(i3-msg -t get_workspaces | jq '.[] | select(.focused==true).num')

# Get the total number of workspaces
total_ws=$(i3-msg -t get_workspaces | jq length)

# Calculate the next workspace
next_ws=$((($current_ws % $total_ws) + 1))

# Switch to the next workspace
i3-msg workspace number $next_ws

