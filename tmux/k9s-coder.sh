# script tmux/k9s-coder.sh
# Purpose: tmux script to run k9s coder apps
#!/bin/bash

# JSON array of title and command values
tmux_session="k9s-coder"
prefix="coder"
kube_config_path="~/.kube/prod-legacy"
context="prod-legacy"

json='[
  { "title": "events", "command": "events", "namespace": "" },
  { "title": "nodes", "command": "nodes", "namespace": "" },
  { "title": "ns","command": "namespaces", "namespace": "" },
  { "title": "gw", "command": "gateway", "namespace": "istio-system" },
  { "title": "pods", "command": "pods", "namespace": "coder" },  
  { "title": "deploys", "command": "deploy", "namespace": "coder" },
  { "title": "statefulsets", "command": "statefulsets", "namespace": "coder" },
  { "title": "vs", "command": "virtualservices", "namespace": "coder" },
  { "title": "dr", "command": "destinationrules", "namespace": "coder" },
  { "title": "svc", "command": "services", "namespace": "coder" },
  { "title": "cm", "command": "configmaps", "namespace": "coder" },
  { "title": "secrets", "command": "secrets", "namespace": "coder" },
  { "title": "pvc", "command": "pvc", "namespace": "coder" },
  { "title": "pv", "command": "pv", "namespace": "coder" },
  { "title": "roles", "command": "roles", "namespace": "coder" },
  { "title": "RoleBindings", "command": "rolebindings", "namespace": "coder" },
  { "title": "PodSecurityPolicies", "command": "PodSecurityPolicies", "namespace": "coder" }
]'

tmux kill-session -t ${tmux_session}
wait


# Check if the tmux session exists
if ! tmux has-session -t ${tmux_session} 2>/dev/null; then
  # If the session does not exist, create it
  tmux new-session -d -s ${tmux_session}
fi

# Loop through the JSON array
echo "$json" | jq -r '.[] | .title, .command, .namespace' | while read -r title && read -r command && read -r namespace; do
  tmux new-window -n ${title} -t ${tmux_session} -d

  tmux send -t ${tmux_session}:${title} export TERM=xterm-256color ENTER
  
  if [[ -z "${namespace}" ]]; then
    tmux send -t ${tmux_session}:${title} k9s SPACE --kubeconfig SPACE ${kube_config_path} SPACE --context SPACE ${context} SPACE --command SPACE ${command} ENTER
  else
    tmux send -t ${tmux_session}:${title} k9s SPACE --kubeconfig SPACE ${kube_config_path} SPACE --context SPACE ${context} SPACE --namespace SPACE ${namespace} SPACE --command SPACE ${command} ENTER
  fi
  
done

# Attach to the tmux session
tmux attach -t ${tmux_session}