# Purpose: tmux script to run k9s prod-services cluster
#!/bin/bash

# JSON array of title and command values
tmux_session="k9s-prod-svc-jenkins"
prefix="prod-svc-jenkins"
kube_config_path="~/.kube/config"
context="prod-services"

json='[
  { "title": "events", "command": "events", "namespace": "" },
  { "title": "nodes", "command": "nodes", "namespace": "" },
  { "title": "ns","command": "namespaces", "namespace": "" },
  { "title": "gw", "command": "gateway", "namespace": "istio-apps" },
  { "title": "pods", "command": "pods", "namespace": "jenkins" },  
  { "title": "deploys", "command": "deploy", "namespace": "jenkins" },
  { "title": "vs", "command": "virtualservices", "namespace": "istio-apps" },
  { "title": "dr", "command": "destinationrules", "namespace": "istio-apps" },
  { "title": "svc", "command": "services", "namespace": "jenkins" },
  { "title": "cm", "command": "configmaps", "namespace": "jenkins" },
  { "title": "secrets", "command": "secrets", "namespace": "jenkins" },
  { "title": "pvc", "command": "pvc", "namespace": "jenkins" },
  { "title": "pv", "command": "pv", "namespace": "jenkins" },
  { "title": "roles", "command": "roles", "namespace": "jenkins" },
  { "title": "RoleBindings", "command": "rolebindings", "namespace": "jenkins" },
  { "title": "PodSecurityPolicies", "command": "PodSecurityPolicies", "namespace": "jenkins" }
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