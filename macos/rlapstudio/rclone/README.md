# rclone google drive
- help: tldr rclone

## init the initial config
rclone config

## create a folder for the syncronization
mkdir -p ~/google_drive/rapiduslabs
cd ~/google_drive/rapiduslabs

# set the syncronization from drive to local
rclone sync rapiduslabs: ~/google_drive/rapiduslabs

# set the syncronization local to drive
rclone sync ~/google_drive/rapiduslabs rapiduslabs:

# syncronize the files bidirectional
rclone bisync rapiduslabs: ~/google_drive/rapiduslabs --resync --progress --log-file ~/.config/rclone/rclone.log

# check the files
la ~/google_drive/rapiduslabs
du -sh ~/google_drive/rapiduslabs # check the size of the folder

```bash rclone settins
la ~/.config/rclone/rclone.conf
cat ~/.config/rclone/rclone.conf
```

# set new alias .zshrc
```
sudo chmod +x rclonescipt.sh
la rclonescipt.sh
nvim ~/.zshrc
alias gsync="/Volumes/local-data/repos/utils/macos/rlapstudio/rclone/rclonescript.sh"
```

# rclone commands
```
- List contents of a directory on an rclone remote:
    rclone lsf rapiduslabs:path/to/directory

- Copy file or directory from local source to remote destination:
    rclone copy path/to/source_file_or_directory rapiduslabs:path/to/destination_directory

- Copy file or directory from remote source to local destination:
    rclone copy rapiduslabs:path/to/source_file_or_directory path/to/destination_directory

- Sync local source to remote destination, changing the destination only:
    rclone sync path/to/file_or_directory rapiduslabs:path/to/directory

- Move file or directory from local source to remote destination:
    rclone move path/to/file_or_directory rapiduslabs:path/to/directory

- Delete remote file or directory (use `--dry-run` to test, remove it to actually delete):
    rclone --dry-run delete rapiduslabs:path/to/file_or_directory
```