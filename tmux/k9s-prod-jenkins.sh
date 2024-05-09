# script tmux/k9s-prod-jenkins.sh
# Purpose: tmux script to run k9s development
#!/bin/bash

# JSON array of title and command values
tmux_session="k9s-prod-jenkins"
prefix="prod-jenkins"
kube_config_path="~/.kube/config"
context="production-sfyc"
cluster_namespace="production-sfyc"

json='[
  { "title": "events", "command": "events", "namespace": "" },
  { "title": "nodes", "command": "nodes", "namespace": "" },
  { "title": "ns","command": "namespaces", "namespace": "" },
  { "title": "gw", "command": "gateway", "namespace": "sfyc" },
  { "title": "pods", "command": "pods", "namespace": "jenkins" },  
  { "title": "deploys", "command": "deploy", "namespace": "jenkins" },
  { "title": "vs", "command": "virtualservices", "namespace": "sfyc" },
  { "title": "dr", "command": "destinationrules", "namespace": "sfyc" },
  { "title": "svc", "command": "services", "namespace": "jenkins" },
  { "title": "endpoints", "command": "endpoints", "namespace": "jenkins" },
  { "title": "cm", "command": "configmaps", "namespace": "jenkins" },
  { "title": "secrets", "command": "secrets", "namespace": "jenkins" },
  { "title": "pvc", "command": "pvc", "namespace": "jenkins" },
  { "title": "pv", "command": "pv", "namespace": "jenkins" },
  { "title": "PeerAuthentication", "command": "PeerAuthentications", "namespace": "sfyc" },
  { "title": "PodSecurityPolicies", "command": "PodSecurityPolicies", "namespace": "sfyc" },
  { "title": "roles", "command": "roles", "namespace": "jenkins" },
  { "title": "RoleBindings", "command": "rolebindings", "namespace": "jenkins" },
  { "title": "ClusterRoles", "command": "ClusterRoles", "namespace": "" },
  { "title": "ClusterRolBindings", "command": "clusterrolebinding", "namespace": "" },
  { "title": "VirtualServers", "command": "VirtualServers", "namespace": "" }
]'

tmux kill-session -t ${tmux_session}
wait

# jenkins cluster
kubectl vsphere login \
  --server tkg-supervisor.evolution.corp \
  --insecure-skip-tls-verify \
  --vsphere-username jenkins-adm@evolution.corp \
  --tanzu-kubernetes-cluster-name jenkins-cluster \
  --tanzu-kubernetes-cluster-namespace shared-services

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