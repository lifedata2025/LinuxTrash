[中文](./README.zh-CN.md)

# LinuxTrash
`LinuxTrash` is a tool that serves as a safe alternative to `rm`, allowing for secure handling of files and directories by moving them to a trash bin instead of permanently deleting them.

If you use `LinuxTrash` as described below, `rm` essentially becomes `mv`. `trash.sh` handles moving items to the trash for you, so please be aware of this change!

## Installation

1. Download the `LinuxTrash` file to your user directory:
```bash

git clone https://github.com/lifedata2025/LinuxTrash

```

2. Add execute permissions:
```bash
chmod +x ~/LinuxTrash/trash.sh
```

3. Add an alias (doesn't have to be `rm`) to your `.bashrc` or `.zshrc`:
```bash
echo 'alias rm="~/LinuxTrash/trash.sh"' >> ~/.bashrc
source ~/.bashrc
```

## Usage
### "Deleting" Files or Directories
To move files or directories to the trash, use the `rm` command as usual:

```bash
rm file1 file2 directory1
```

By default, there is no confirmation before moving items to the trash.
Enable confirmation prompt (optional)

If you'd like to be prompted before moving items to the trash, open ~/LinuxTrash/trash.sh and uncomment the following lines:

```bash
echo -n "Are you sure you want to move the above items to the trash? [Y/N]: "
read -r CONFIRM_MOVE
if [ "$CONFIRM_MOVE" != "Y" ] && [ "$CONFIRM_MOVE" != "y" ]; then
    echo "Operation cancelled."
    exit 0
fi
```

### Emptying the Trash

**Emptying the trash involves calling `/bin/rm` with the `-rf` parameter to clear the `~/.trash` folder. This action is irreversible.**

To empty the trash, use the `-c` parameter:

```bash
rm -c
```
You will be prompted to confirm the emptying of the trash, and its contents will be displayed before deletion.

### Set up automatic cleanup

If you want the trash to be emptied automatically:

Open the crontab editor:

```bash
crontab -e
```

Add a scheduled task (e.g., run daily at 1 AM):

```bash
# Minute Hour Day Month Weekday   Path to scheduledCleanup.sh
0 1 * * * ~/LinuxTrash/scheduledCleanup.sh
0 23 1 * * /bin/rm -rf ~/.trash/scheduledCleanup.log  # Clear the log on the 1st of every month at 11 PM
```

Save and exit.

## Trash Structure
Files you "delete" will be renamed with the current timestamp and moved (`mv`) to the `~/.trash` folder. If you "delete" a directory, its contents will not be renamed. The structure of the trash looks like this:

```bash
$ tree .trash/

.trash/
├── test_dir_1-2024-06-18_09-10-12
│   └── test_file.txt
├── test_file_1.txt-2024-06-18_09-10-12
└── test_file_2.txt-2024-06-18_09-10-12

1 directory, 3 files
```

## Note ⚠️
Using `LinuxTrash` does not guarantee that data or files will be securely "deleted." You should still back up important data to ensure its safety.

## License
This project is licensed under the MIT License - see the [LICENSE](./LICENSE) file for details.

### Donations are welcome — even a cup of coffee helps!

<p align="center">
  <img src="https://github.com/user-attachments/assets/da09772b-146b-4d27-828f-012225527d33" width="200" style="margin-right:10px;" />
  <img src="https://github.com/user-attachments/assets/c2dddd0d-fe0f-40ad-8672-6b51cf77696a" width="150" />
</p>

