####
docs: 
  - https://github.com/rclone/rclone
  - https://rclone.org/docs/


sudo pacman -S rclone


#### config

rclone config

rclone sync -i ~/storages/google-drive google-drive:megacable
rclone sync -i google-drive:megacable ~/storages/google-drive

