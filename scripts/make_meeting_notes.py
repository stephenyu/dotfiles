import sys
import urllib.parse
from datetime import datetime
from pathlib import Path

def create_meeting_note(base_root, filename, template_path):
    # 1. Get current date components
    now = datetime.now()
    year = now.strftime("%Y")
    month = now.strftime("%m-%B")
    day = now.strftime("%d")
    
    # 2. Clean names
    display_name = filename[:-3] if filename.lower().endswith(".md") else filename
    fs_filename = f"{display_name}.md"
    
    # 3. Construct target directory
    target_dir = Path(base_root) / year / month / day
    target_dir.mkdir(parents=True, exist_ok=True)
    
    # 4. Read the template file
    # If the template exists, we read it and replace the title placeholder
    try:
        template_file = Path(template_path)
        if template_file.exists():
            content = template_file.read_text(encoding="utf-8")
            # Replace common placeholders if you use them in your template
            content = content.replace("{{title}}", display_name)
            content = content.replace("{{date}}", now.strftime("%Y-%m-%d"))
        else:
            content = f"# {display_name}\n\n(Template not found at {template_path})"
    except Exception as e:
        content = f"# {display_name}\n\nError reading template: {str(e)}"

    # 5. Create the file and write content
    file_path = target_dir / fs_filename
    if not file_path.exists():
        with open(file_path, "w", encoding="utf-8") as f:
            f.write(content)
    
    # 6. Construct Obsidian URI
    path_obj = Path(base_root)
    vault_name = path_obj.parent.name  
    folder_name = path_obj.name        
    relative_path = f"{folder_name}/{year}/{month}/{day}/{display_name}"
    
    encoded_path = urllib.parse.quote(relative_path)
    obsidian_uri = f"obsidian://open?vault={vault_name}&file={encoded_path}"
    
    return obsidian_uri

if __name__ == "__main__":
    if len(sys.argv) < 4:
        print("Usage: python script.py <base_root> <meeting_name> <template_path>")
        sys.exit(1)

    arg_base_root = sys.argv[1]
    arg_meeting_name = sys.argv[2]
    arg_template_path = sys.argv[3]

    uri = create_meeting_note(arg_base_root, arg_meeting_name, arg_template_path)
    print(uri.strip(), end='')
