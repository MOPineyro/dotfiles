export STAGING_KUBECONFIG=/Users/mopineyro/Code/k8s/staging-config
export PROD_KUBECONFIG=/Users/mopineyro/Code/k8s/prod-config
export KUBECONFIG=$STAGING_KUBECONFIG:$PROD_KUBECONFIG

function k8s_freeroll_staging_bash() {
  kubectl exec -n freeroll -it $(get_pod) --context=simplebet-staging -- /bin/bash
}

function k8s_freeroll_staging_iex() {
  kubectl exec -n freeroll -it $(get_pod) --context=simplebet-staging  -- bin/freeroll remote
}

function k8s_freeroll_prod_bash() {
  kubectl exec -n freeroll -it $(get_pod) --context=simplebet-prod -- /bin/bash
}

function k8s_freeroll_prod_iex() {
  kubectl exec -n freeroll -it $(get_pod) --context=simplebet-prod  -- bin/freeroll remote
}

function k8s_freeroll_staging_logs() {
  stern -n freeroll "^.*" --context simplebet-staging --template '{{color .PodColor .Namespace}} | {{.Message}}'
}

function k8s_freeroll_prod_logs() {
  stern -n freeroll "^.*" --context simplebet-prod --template '{{color .PodColor .Namespace}} | {{.Message}}'
}

function get_pod() {
  kubectl get pods -n freeroll -o json | jq '.items[0].metadata.name' | sed 's/"//g'
}
# FD
function k8s_fd_freeroll_staging_bash() {
  kubectl exec -n freeroll-fanduel -it $(get_fd_pod) --context=simplebet-staging -- /bin/bash
}

function k8s_fd_freeroll_staging_iex() {
  kubectl exec -n freeroll-fanduel -it $(get_fd_pod) --context=simplebet-staging  -- bin/freeroll remote
}

function k8s_fd_freeroll_prod_bash() {
  kubectl exec -n freeroll-fanduel -it $(get_fd_pod_prod) --context=simplebet-prod -- /bin/bash
}

function k8s_fd_freeroll_prod_iex() {
  kubectl exec -n freeroll-fanduel -it $(get_fd_pod_prod) --context=simplebet-prod  -- bin/freeroll remote
}

function k8s_fd_freeroll_staging_logs() {
  stern -n freeroll-fanduel "^.*" --context simplebet-staging --template '{{color .PodColor .Namespace}} | {{.Message}}'
}

function k8s_fd_freeroll_prod_logs() {
  stern -n freeroll-fanduel "^.*" --context simplebet-prod --template '{{color .PodColor .Namespace}} | {{.Message}}'
}

function get_fd_pod() {
  kubectl get pods -n freeroll-fanduel -o json | jq '.items[0].metadata.name' | sed 's/"//g'
}

function get_fd_pod_prod() {
  kubectl get pods -n freeroll-fanduel -o json --context simplebet-prod | jq '.items[0].metadata.name' | sed 's/"//g'
}

source <(stern --completion=zsh)
