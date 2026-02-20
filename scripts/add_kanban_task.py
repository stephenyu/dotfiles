import sys
from pathlib import Path

def add_to_kanban(file_path, task_name):
    # 1. Ensure the file exists
    path = Path(file_path)
    if not path.exists():
        print(f"Error: File not found at {file_path}")
        return False

    # 2. Read the lines of the file
    lines = path.read_text(encoding="utf-8").splitlines()
    
    # 3. Find the '## To Do' section
    target_header = "## To Do"
    header_index = -1
    
    for i, line in enumerate(lines):
        if line.strip() == target_header:
            header_index = i
            break
            
    if header_index == -1:
        print(f"Error: Could not find section '{target_header}' in the file.")
        return False

    # 4. Find where the 'To Do' section ends
    # We look for the next heading (##), a horizontal rule (***), or the settings block (%%)
    insert_index = -1
    for i in range(header_index + 1, len(lines)):
        line = lines[i].strip()
        if line.startswith("## ") or line.startswith("***") or line.startswith("%%"):
            insert_index = i
            break
    
    # If no further section is found, we'll append to the end
    if insert_index == -1:
        insert_index = len(lines)

    # 5. Prepare the new task line
    new_task = f"- [ ] {task_name}"
    
    # 6. Insert the task 
    # We insert it before the next section starts. 
    # We also ensure there is at least one blank line before the next header for formatting.
    lines.insert(insert_index, new_task)
    
    # Ensure there's a blank line between our new task and the next header if needed
    if insert_index + 1 < len(lines) and lines[insert_index + 1].strip() != "":
        lines.insert(insert_index + 1, "")

    # 7. Write back to file
    path.write_text("\n".join(lines), encoding="utf-8")
    return True

if __name__ == "__main__":
    if len(sys.argv) < 3:
        print("Usage: python add_kanban_task.py <task_name> <markdown_file_path>")
        sys.exit(1)

    arg_task_name = sys.argv[1]
    arg_file_path = sys.argv[2]

    if add_to_kanban(arg_file_path, arg_task_name):
        print(f"Successfully added '{arg_task_name}' to {arg_file_path}")
