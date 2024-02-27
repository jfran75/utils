# script tmux/k9s-qa.sh
# Purpose: tmux script to run k9s QA
#!/bin/bash

# JSON array of title and command values
tmux_session="k9s-qa"
prefix="qa"
kube_config_path="~/.kube/config"
context="qa-cluster-1-23"
namespace="sfyc"
json='[
  { "title": "events", "command": "events" },
  { "title": "nodes", "command": "nodes" },
  { "title": "ns","command": "namespaces" },
  { "title": "gw", "command": "gateway" },
  { "title": "pods", "command": "pods" },  
  { "title": "deploys", "command": "deploy" },
  { "title": "vs", "command": "virtualservices" },
  { "title": "hpa", "command": "hpa" },
  { "title": "dr", "command": "destinationrules" },
  { "title": "svc", "command": "services" },
  { "title": "cm", "command": "configmaps" },
  { "title": "secrets", "command": "secrets" },
  { "title": "pvc", "command": "pvc" },
  { "title": "pv", "command": "pv" },
  { "title": "roles", "command": "roles" },
  { "title": "RoleBindings", "command": "rolebindings" },
  { "title": "PodSecurityPolicies", "command": "PodSecurityPolicies" }
]'

tmux kill-session -t ${tmux_session}
wait

kubectl vsphere login \
  --server tkg-supervisor.evolution.corp \
  --insecure-skip-tls-verify \
  --vsphere-username jenkins-adm@evolution.corp \
  --tanzu-kubernetes-cluster-name qa-cluster-1-23 \
  --tanzu-kubernetes-cluster-namespace development
wait


# Check if the tmux session exists
if ! tmux has-session -t ${tmux_session} 2>/dev/null; then
  # If the session does not exist, create it
  tmux new-session -d -s ${tmux_session}
fi

declare -a commands=("events" "nodes" "ns" "gw" "pods" "deploy" "virtualservices" "dr" "cm" "secrets" "pvc" "pv" "roles" "rolebindings" "Podsecuritypolicies")

for command in "${commands[@]}"; do
  title="${prefix}-${command}"
  tmux new-window -n ${title} -t ${tmux_session} -d
  tmux send -t ${tmux_session}:${title} export TERM=xterm-256color ENTER
  tmux send -t ${tmux_session}:${title} k9s SPACE --kubeconfig SPACE ${kube_config_path} SPACE --context SPACE ${context} SPACE --namespace SPACE ${namespace} SPACE --command SPACE ${command} ENTER
done

tmux attach -t ${tmux_session}