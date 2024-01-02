# script tmux/k9s-qa.sh
# Purpose: tmux script to run k9s QA
#!/bin/bash

# Asegúrate de definir la variable prefix
prefix="prod"
tmux_session="k9s-prod"
kube_config_path="/Users/jchinchillas/.kube/config"
context="prod-sfyc"
namespace="sfyc"

# Verificar si la sesión de tmux existe
if ! tmux has-session -t ${tmux_session} 2>/dev/null; then
  # Si la sesión no existe, crearla
  tmux new-session -d -s ${tmux_session}
fi

declare -a commands=("events" "nodes" "ns" "gw" "pods" "deploy" "virtualservices" "hpa" "dr" "cm" "secrets" "pvc" "pv" "roles" "rolebindings" "Podsecuritypolicies")

for command in "${commands[@]}"; do
  title="${prefix}-${command}"
  tmux new-window -n ${title} -t ${tmux_session} -d
  tmux send -t ${tmux_session}:${title} k9s SPACE --kubeconfig SPACE ${kube_config_path} SPACE --context SPACE ${context} SPACE --namespace SPACE ${namespace} SPACE --command SPACE ${command} ENTER
done

tmux attach -t k9s-prod