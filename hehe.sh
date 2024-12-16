#!/bin/bash

# Define the start date for contributions
START_DATE="2023-07-01" # Adjust to your preferred start date
END_DATE="2024-02-21"

# Define the message to display (e.g., NEHE)
PATTERN=(
    "11110" # N
    "10110" # E
    "10110" # H
    "11110" # E
)

# Create or select a temporary repository
mkdir -p custom-graph
cd custom-graph
git init

# Clean up previous commits if needed
rm -rf .git
git init
echo "Contribution Graph" > graph.txt

# Loop through the pattern to make commits
current_date=$(date -I -d "$START_DATE")
while [[ "$current_date" < "$END_DATE" ]]; do
    day_of_week=$(date -d "$current_date" +%u)
    column_index=$(( (${day_of_week}-1) % ${#PATTERN[0]} ))

    # Check the binary pattern for this column
    for ((i=0; i<${#PATTERN[@]}; i++)); do
        if [ "${PATTERN[$i]:$column_index:1}" == "1" ]; then
            GIT_AUTHOR_DATE="$current_date 12:00:00" \
            GIT_COMMITTER_DATE="$current_date 12:00:00" \
            git commit --allow-empty -m "Auto commit for pattern"
        fi
    done

    # Increment to the next day
    current_date=$(date -I -d "$current_date + 1 day")
done

