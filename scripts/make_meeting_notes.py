import sys
import urllib.parse
from datetime import datetime
from pathlib import Path

def create_meeting_note(base_root, filename):
    # 1. Get current date components
    now = datetime.now()
    year = now.strftime("%Y")
    month = now.strftime("%m-%B")
    day = now.strftime("%d")
    
    # 2. Clean names for file system vs Obsidian URI
    display_name = filename[:-3] if filename.lower().endswith(".md") else filename
    fs_filename = f"{display_name}.md"
    
    # 3. Construct the target directory path
    target_dir = Path(base_root) / year / month / day
    target_dir.mkdir(parents=True, exist_ok=True)
    
    # 4. Create the empty file
    file_path = target_dir / fs_filename
    if not file_path.exists():
        file_path.touch()
    
    # 5. Extract Vault Name and Relative Path for URI
    # Logic: Extracts the folder name containing 'Meetings'
    path_obj = Path(base_root)
    vault_name = path_obj.parent.name  # Gets 'Core'
    folder_name = path_obj.name        # Gets 'Meetings'

    # Relative path starts from the folder name provided in base_root
    relative_path = f"{folder_name}/{year}/{month}/{day}/{display_name}"
    
    # 6. Construct the Obsidian URI
    encoded_path = urllib.parse.quote(relative_path)
    obsidian_uri = f"obsidian://open?vault={vault_name}&file={encoded_path}"
    
    return obsidian_uri

if __name__ == "__main__":
    # Check if correct number of arguments are provided
    if len(sys.argv) < 3:
        print("Usage: python script.py <base_root> <meeting_name>")
        sys.exit(1)

    # Assign arguments from command line
    # argv[0] is the script name itself
    arg_base_root = sys.argv[1]
    arg_meeting_name = sys.argv[2]

    uri = create_meeting_note(arg_base_root, arg_meeting_name)
    
    # Output only the URI so it can be easily captured by other scripts/terminal
    print(uri.strip(), end='')
