# tmux
- docs
  - https://tmuxcheatsheet.com/

## tmux.conf
```
nvim ~/.tmux.conf
tmux source ~/.tmux.conf
```

## tmux default key bindings
```
ctrl+s # leader key. default is ctrl+b
ctrl+s r # reload tmux.conf
ctrl+s ? # list all key bindings

ctrl+s q # show pane numbers
ctrl+s % # split pane vertically
ctrl+s " # split pane horizontally
ctrl+s o # switch panes
ctrl+d # kill pane
ctrl+s x # kill pane
ctrl+s alt + arrow key # resize pane
ctrl+s { # move pane left
ctrl+s } # move pane right

ctrl+s c # create new window
ctrl+s , # rename window
ctrl+s p # previous window
ctrl+s n # next window
ctrl+s w # list windows
ctrl+s & # kill window

ctrl+s s # list sessions
ctrl+s $ # rename session
ctrl+s d # detach from session
ctrl+s ) # next session
ctrl+s ( # previous session
ctrl+s L # last session

ctrl+s [ # enter copy mode
ctrl+s space # start selection
ctrl+s v # start selection
ctrl+s V # start selection
ctrl+s enter # copy selection
ctrl+s ] # paste
ctrl+s = # choose buffer to paste
ctrl+s alt + arrow key # scroll

ctrl+s z # zoom pane
ctrl+s ! # break pane into window
ctrl+s t # show time
ctrl+s i # show info

```

## tmux commands sessions
```
tmux ls # list sessions
tmux new -s <session name> # create new session
tmux attach -t <session name> # attach to session
tmux kill-session -t <session name> # kill session
```

## tmux plugins
```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
ctrl+s I # install plugins

```


## example script for tmux create session and send custom commands
```
chmod +x k9s-qa.sh
./k9s-qa.sh

tmux ls
tmux kill-session -t k9s-qa
tmux kill-session -t k9s-dev

tmux new -s k9s-qa -d
tmux rename-window -t k9s-qa "events"
tmux new-window -n "nodes" -t k9s-qa -d
tmux new-window -n "ns" -t k9s-qa
tmux new-window -n "gw" -t k9s-qa
tmux new-window -n "pods" -t k9s-qa
tmux new-window -n "deploy" -t k9s-qa
tmux new-window -n "vs" -t k9s-qa
tmux new-window -n "hpa" -t k9s-qa
tmux new-window -n "dr" -t k9s-qa
tmux new-window -n "cm" -t k9s-qa
tmux new-window -n "secrets" -t k9s-qa
tmux new-window -n "pvc" -t k9s-qa
tmux new-window -n "pv" -t k9s-qa
tmux new-window -n "roles" -t k9s-qa
tmux new-window -n "rolebindings" -t k9s-qa
tmux new-window -n "Podsecuritypolicies" -t k9s-qa

tmux attach -t k9s-qa
tmux select-window -t k9s-qa:2

tmux send -t k9s-qa:nodes k9s SPACE --kubeconfig SPACE /Users/jchinchillas/.kube/config SPACE --context SPACE qa-cluster-1-23 SPACE --command SPACE nodes ENTER
tmux send -t k9s-qa:nodes k9s SPACE --kubeconfig SPACE /Users/jchinchillas/.kube/config SPACE --context SPACE qa-cluster-1-23 SPACE --command SPACE nodes ENTER

```