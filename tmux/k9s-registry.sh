# script tmux/k9s-dev-svc.sh
# Purpose: tmux script to run k9s development
#!/bin/bash

# JSON array of title and command values
tmux_session="k9s-dev-svc"
prefix="registry"
kube_config_path="/Users/jchinchillas/.kube/prod-legacy"
context="prod-legacy"
# k9s --kubeconfig /Users/jchinchillas/.kube/prod-legacy --context prod-legacy --namespace registry --command pods

json='[
  { "title": "events", "command": "events", "namespace": "" },
  { "title": "nodes", "command": "nodes", "namespace": "" },
  { "title": "ns","command": "namespaces", "namespace": "" },
  { "title": "gw", "command": "gateway", "namespace": "registry" },
  { "title": "pods", "command": "pods", "namespace": "registry" },  
  { "title": "deploys", "command": "deploy", "namespace": "registry" },
  { "title": "vs", "command": "virtualservices", "namespace": "registry" },
  { "title": "dr", "command": "destinationrules", "namespace": "registry" },
  { "title": "svc", "command": "services", "namespace": "registry" },
  { "title": "cm", "command": "configmaps", "namespace": "registry" },
  { "title": "secrets", "command": "secrets", "namespace": "registry" },
  { "title": "pvc", "command": "pvc", "namespace": "registry" },
  { "title": "pv", "command": "pv", "namespace": "registry" },
  { "title": "roles", "command": "roles", "namespace": "registry" },
  { "title": "RoleBindings", "command": "rolebindings", "namespace": "registry" },
  { "title": "PodSecurityPolicies", "command": "PodSecurityPolicies", "namespace": "registry" }
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

  if [[ -z "${namespace}" ]]; then
    tmux send -t ${tmux_session}:${title} k9s SPACE --kubeconfig SPACE ${kube_config_path} SPACE --context SPACE ${context} SPACE --command SPACE ${command} ENTER
  else
    tmux send -t ${tmux_session}:${title} k9s SPACE --kubeconfig SPACE ${kube_config_path} SPACE --context SPACE ${context} SPACE --namespace SPACE ${namespace} SPACE --command SPACE ${command} ENTER
  fi
  
done

# Attach to the tmux session
tmux attach -t ${tmux_session}