# script tmux/k9s-qa.sh
# Purpose: tmux script to run k9s QA
#!/bin/bash

# Asegúrate de definir la variable prefix
prefix="dev"
tmux_session="k9s-dev"
kube_config_path="/Users/jchinchillas/.kube/config"
context="dev-cluster-1-23"
namespace="sfyc"

# Verificar si la sesión de tmux existe
if ! tmux has-session -t ${tmux_session} 2>/dev/null; then
  # Si la sesión no existe, crearla
  tmux new-session -d -s ${tmux_session}
fi

declare -a commands=("events" "nodes" "ns" "gw" "pods" "deploy" "virtualservices" "dr" "cm" "secrets" "pvc" "pv" "roles" "rolebindings" "Podsecuritypolicies")

for command in "${commands[@]}"; do
  window_title="${prefix}-${command}"
  tmux new-window -n ${window_title} -t ${tmux_session} -d
  tmux send -t ${tmux_session}:${window_title} k9s SPACE --kubeconfig SPACE ${kube_config_path} SPACE --context SPACE ${context} SPACE --namespace SPACE ${namespace} SPACE --command SPACE ${command} ENTER
done

tmux attach -t k9s-dev