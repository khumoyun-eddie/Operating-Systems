# Log Analysis and File Archiving Script

This Bash script serves as a demonstration of working with system logs, filtering specific entries, and archiving/copying files in Ubuntu.

## Features

### Part 1: Analyzing and Storing Logs

1. **View System Logs**: Displays the contents of the `/var/log/syslog`.
2. **Filter Logs for SSH Connections**: Filters the syslog for entries related to SSH connections.
3. **Store Filtered Logs in a File**: Saves the filtered SSH logs into a separate file named `ssh_logs.txt`.

### Part 2: Archiving and Copying Files

1. **Create Sample Files**: Generates three sample text files, namely `file1.txt`, `file2.txt`, and `file3.txt`.
2. **Archive Files with tar**: Archives the sample files into a compressed file named `my_archive.tar.gz`.
3. **Copy the Archive to Home Directory**: Copies the created archive (`my_archive.tar.gz`) to the user's home directory.
4. **Extract Files from the Archive**: Extracts the contents of the archive (`my_archive.tar.gz`) into the current directory.

## Usage

1. Ensure the script has execution permission: `chmod +x script_name.sh`
2. Run the script: `./script_name.sh`
3. Follow the prompts displayed for each step to observe the actions performed.

## Requirements

- This script is intended for Ubuntu systems.
- Ensure appropriate permissions are set for executing the script.

## Disclaimer

- This script is for demonstration and educational purposes.
- Use caution when working with system logs and performing file operations.

