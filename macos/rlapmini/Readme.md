#### [install brew](./1_brew/README.md)

#### [install zsh](./zsh/README.md#install-zsh)
#### [install powerlevel10k](./zsh/README.md#install-powerlevel10k)

#### Spotlight
Enable Indexing 
sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.metadata.mds.plist

Disable Indexing 
sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.metadata.mds.plist


#### System Integrity Protection
- docs: https://cleanmymac.com/faq/how-to-turn-off-spotlight-search-on-mac

csrutil disable
csrutil status
