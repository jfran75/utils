# script tmux/k9s-dev-svc.sh
# Purpose: tmux script to run k9s development
#!/bin/bash

# JSON array of title and command values
tmux_session="k9s-dev-svc"
prefix="dev-svc"
kube_config_path="~/.kube/config"
context="dev-services-1-23"

json='[
  { "title": "events", "command": "events", "namespace": "" },
  { "title": "nodes", "command": "nodes", "namespace": "" },
  { "title": "ns","command": "namespaces", "namespace": "" },
  { "title": "gw", "command": "gateway", "namespace": "istio-apps" },
  { "title": "pods", "command": "pods", "namespace": "istio-apps" },  
  { "title": "deploys", "command": "deploy", "namespace": "istio-apps" },
  { "title": "vs", "command": "virtualservices", "namespace": "istio-apps" },
  { "title": "dr", "command": "destinationrules", "namespace": "istio-apps" },
  { "title": "svc", "command": "services", "namespace": "istio-apps" },
  { "title": "cm", "command": "configmaps", "namespace": "istio-apps" },
  { "title": "secrets", "command": "secrets", "namespace": "istio-apps" },
  { "title": "pvc", "command": "pvc", "namespace": "istio-apps" },
  { "title": "pv", "command": "pv", "namespace": "istio-apps" },
  { "title": "roles", "command": "roles", "namespace": "istio-apps" },
  { "title": "RoleBindings", "command": "rolebindings", "namespace": "istio-apps" },
  { "title": "PodSecurityPolicies", "command": "PodSecurityPolicies", "namespace": "istio-apps" }
]'

tmux kill-session -t ${tmux_session}
wait

kubectl vsphere login \
  --server tkg-supervisor.evolution.corp \
  --insecure-skip-tls-verify \
  --vsphere-username jenkins-adm@evolution.corp \
  --tanzu-kubernetes-cluster-name dev-services-1-23 \
  --tanzu-kubernetes-cluster-namespace shared-services
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