function k8s_freeroll_staging_bash() {
  kubectl exec -n freeroll -it $(get_pod) -- /bin/bash
}

function k8s_freeroll_staging_iex() {
  kubectl exec -n freeroll -it $(get_pod)  -- bin/freeroll remote
}

function k8s_freeroll_staging_logs() {
  kubectl logs -n freeroll $(get_pod) --follow
}

function get_pod() {
  kubectl get pods -n freeroll -o json | jq '.items[0].metadata.name' | sed 's/"//g'
}
