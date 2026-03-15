import re
import sys
import urllib.parse
from datetime import datetime
from pathlib import Path


def slugify(name):
    """Slugify for Obsidian-safe filenames: punctuation → '-', spaces → '_'."""
    # Replace spaces with underscores
    name = name.replace(" ", "_")
    # Replace any punctuation (non-alphanumeric, non-underscore) with hyphens
    name = re.sub(r"[^\w]", "-", name)
    # Collapse consecutive hyphens/underscores
    name = re.sub(r"-{2,}", "-", name)
    name = re.sub(r"_{2,}", "_", name)
    # Strip leading/trailing hyphens and underscores
    name = name.strip("-_")
    return name


def create_meeting_note(base_root, meeting_name, template_path):
    # 1. Date components
    now = datetime.now()
    year = now.strftime("%Y")
    month = now.strftime("%m-%B")
    date_suffix = now.strftime("%d%m%y")      # DDMMYY
    date_backlink = now.strftime("%Y-%m-%d") # YYYY-MM-DD

    # 2. Define Names
    meeting_title = meeting_name.replace(".md", "")
    safe_title = slugify(meeting_title)
    fs_filename = f"{safe_title}_-_{date_suffix}.md"
    
    # 3. Path Management
    base_path = Path(base_root).resolve()
    target_dir = base_path / year / month
    target_dir.mkdir(parents=True, exist_ok=True)
    
    # 4. Content Formatting
    try:
        template_file = Path(template_path).resolve()
        if template_file.exists():
            raw_content = template_file.read_text(encoding="utf-8")
            raw_content = raw_content.replace("{{title}}", meeting_title)
            raw_content = raw_content.replace("{{date}}", date_backlink)

            if raw_content.startswith("---"):
                parts = raw_content.split("---", 2)
                if len(parts) >= 3:
                    yaml_content = parts[1].strip()
                    body = parts[2].strip()
                    content = f"---\n{yaml_content}\n---\n# {meeting_title}\n\n{body}\n\n[[{date_backlink}]]"
                else:
                    content = f"# {meeting_title}\n\n{raw_content}\n\n[[{date_backlink}]]"
            else:
                content = f"# {meeting_title}\n\n{raw_content.strip()}\n\n[[{date_backlink}]]"
        else:
            content = f"# {meeting_title}\n\n(Template not found)\n\n[[{date_backlink}]]"
    except Exception as e:
        content = f"# {meeting_title}\n\nError: {str(e)}\n\n[[{date_backlink}]]"

    # 5. Save File
    file_path = target_dir / fs_filename
    if not file_path.exists():
        file_path.write_text(content, encoding="utf-8")
    
    # 6. URI Generation (Matching your exact format)
    vault_name = base_path.parent.name
    folder_name = base_path.name
    
    # We create the path string WITHOUT the .md extension for the URI
    uri_filename = f"{safe_title}_-_{date_suffix}"
    relative_path = f"{folder_name}/{year}/{month}/{uri_filename}"
    
    encoded_path = urllib.parse.quote(relative_path)
    
    return f"obsidian://open?vault={vault_name}&file={encoded_path}"

if __name__ == "__main__":
    if len(sys.argv) < 4:
        sys.exit(1)

    uri = create_meeting_note(sys.argv[1], sys.argv[2], sys.argv[3])
    
    # sys.stdout.write ensures NO trailing newline character (\n)
    sys.stdout.write(uri)
    sys.stdout.flush()
