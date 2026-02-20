import sys
import os
import json
from datetime import datetime, timezone, timedelta
from pathlib import Path

# Google Calendar API dependencies:
# uv pip install --system --break-system-packages google-api-python-client google-auth-httplib2 google-auth-oauthlib
from google.oauth2.credentials import Credentials
from google_auth_oauthlib.flow import InstalledAppFlow
from google.auth.transport.requests import Request
from googleapiclient.discovery import build

# --- Configuration ---
SCOPES = ["https://www.googleapis.com/auth/calendar.readonly"]

# Credentials files live alongside this script.
SCRIPT_DIR = Path(__file__).parent.resolve()
CREDENTIALS_FILE = SCRIPT_DIR / "google_credentials.json"  # Downloaded from Google Cloud Console
TOKEN_FILE = SCRIPT_DIR / "google_token.json"               # Auto-generated after first login
CONFIG_FILE = SCRIPT_DIR / "get_current_meeting_config.json"  # Stores chosen calendar


def get_credentials():
    """Load or refresh OAuth2 credentials, prompting login on first run."""
    creds = None

    if TOKEN_FILE.exists():
        creds = Credentials.from_authorized_user_file(str(TOKEN_FILE), SCOPES)

    # If there are no (valid) credentials, let the user log in.
    if not creds or not creds.valid:
        if creds and creds.expired and creds.refresh_token:
            creds.refresh(Request())
        else:
            if not CREDENTIALS_FILE.exists():
                print(
                    f"ERROR: Google credentials file not found at:\n  {CREDENTIALS_FILE}\n\n"
                    "Please follow these steps to create it:\n"
                    "  1. Go to https://console.cloud.google.com/\n"
                    "  2. Create a project (or select an existing one)\n"
                    "  3. Enable the Google Calendar API\n"
                    "  4. Go to APIs & Services > Credentials\n"
                    "  5. Create an OAuth 2.0 Client ID (Desktop app)\n"
                    "  6. Download the JSON and save it as:\n"
                    f"     {CREDENTIALS_FILE}",
                    file=sys.stderr,
                )
                sys.exit(1)

            flow = InstalledAppFlow.from_client_secrets_file(str(CREDENTIALS_FILE), SCOPES)
            creds = flow.run_local_server(port=0)

        # Save the token for next time.
        TOKEN_FILE.write_text(creds.to_json())

    return creds


def load_config():
    """Load saved config, or return empty dict."""
    if CONFIG_FILE.exists():
        return json.loads(CONFIG_FILE.read_text())
    return {}


def save_config(config):
    CONFIG_FILE.write_text(json.dumps(config, indent=2))


def choose_calendar(service):
    """Prompt the user to pick a calendar and save the choice."""
    print("\nFetching your calendars...", file=sys.stderr)
    calendars_result = service.calendarList().list().execute()
    calendars = calendars_result.get("items", [])

    print("\nWhich calendar should be checked for current meetings?", file=sys.stderr)
    for i, cal in enumerate(calendars):
        print(f"  [{i + 1}] {cal.get('summary', '(no name)')}", file=sys.stderr)

    while True:
        try:
            choice = int(input("\nEnter number: ").strip())
            if 1 <= choice <= len(calendars):
                chosen = calendars[choice - 1]
                config = {
                    "calendar_id": chosen["id"],
                    "calendar_name": chosen.get("summary", "(no name)"),
                }
                save_config(config)
                print(f"\nSaved! Will always check: {config['calendar_name']}", file=sys.stderr)
                print("(Delete get_current_meeting_config.json to choose again)\n", file=sys.stderr)
                return config
        except (ValueError, KeyboardInterrupt):
            pass
        print("Invalid choice, please try again.", file=sys.stderr)


def debug(msg):
    if DEBUG:
        print(f"[debug] {msg}", file=sys.stderr)


def get_current_meeting():
    """Return the title of the meeting currently in progress, or None."""
    debug("Getting credentials...")
    creds = get_credentials()
    debug("Credentials OK")
    service = build("calendar", "v3", credentials=creds)

    # Load or prompt for calendar preference
    config = load_config()
    if not config:
        config = choose_calendar(service)

    calendar_id = config["calendar_id"]
    calendar_name = config["calendar_name"]
    debug(f"Checking calendar: {calendar_name}")

    now = datetime.now(timezone.utc)
    now_iso = now.isoformat()
    debug(f"Current time (UTC): {now_iso}")

    try:
        events_result = (
            service.events()
            .list(
                calendarId=calendar_id,
                timeMin=now_iso,                               # events ending after now
                timeMax=(now + timedelta(days=1)).isoformat(), # limit lookahead to 1 day
                singleEvents=True,
                orderBy="startTime",
            )
            .execute()
        )
    except Exception as ex:
        debug(f"Error fetching events: {ex}")
        return None

    # Filter to only events that have already started
    all_events = events_result.get("items", [])
    current_events = [
        e for e in all_events
        if e.get("start", {}).get("dateTime") and
        datetime.fromisoformat(e["start"]["dateTime"]) <= now
    ]

    debug(f"Found {len(current_events)} current event(s):")
    for e in current_events:
        debug(f"  → {e.get('summary', '(no title)')} "
              f"[{e.get('start', {}).get('dateTime', '?')} - {e.get('end', {}).get('dateTime', '?')}]")

    if not current_events:
        debug("No current events found.")
        return None

    return current_events[0].get("summary", "(No title)").strip()


if __name__ == "__main__":
    DEBUG = "--debug" in sys.argv
    meeting_title = get_current_meeting()

    if meeting_title:
        sys.stdout.write(meeting_title)
        sys.stdout.flush()
    else:
        sys.stdout.write("")
        sys.stdout.flush()
        sys.exit(1)  # Exit code 1 signals "no current meeting" to calling scripts
