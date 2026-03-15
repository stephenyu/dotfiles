#!/bin/bash

SCRIPTS_DIR="$(dirname "$0")"
PYTHON="/opt/homebrew/bin/python3"
MEETINGS_DIR="/Users/stephen/Documents/Obsidian/Canva/06-Meetings"
TEMPLATE="/Users/stephen/Documents/Obsidian/Canva/99-Templates/meeting_note.md"

# Get the current meeting title from Google Calendar
MEETING_TITLE=$("$PYTHON" "$SCRIPTS_DIR/get_current_meeting.py" 2>/dev/null)

if [ $? -ne 0 ] || [ -z "$MEETING_TITLE" ]; then
  echo "No meeting currently in progress." >&2
  exit 1
fi

# Create the meeting note and output the Obsidian URI
"$PYTHON" "$SCRIPTS_DIR/make_meeting_notes.py" "$MEETINGS_DIR" "$MEETING_TITLE" "$TEMPLATE"
