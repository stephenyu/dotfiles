#!/bin/bash

SCRIPTS_DIR="$(dirname "$0")"

# Get the current meeting title
MEETING_TITLE=$(/usr/bin/python3 "$SCRIPTS_DIR/get_current_meeting.py")

if [ $? -ne 0 ] || [ -z "$MEETING_TITLE" ]; then
  echo "No meeting currently in progress." >&2
  exit 1
fi

# Create the meeting note
/usr/bin/python3 "$SCRIPTS_DIR/make_meeting_notes.py" \
  "/Users/stephen/Documents/Obsidian/Core/Meetings" \
  "$MEETING_TITLE" \
  "/Users/stephen/Documents/Obsidian/Core/templates/meeting_note.md"
