# rclone google drive

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