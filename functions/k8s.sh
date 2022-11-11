k_select(){
  export MY_KUBE_CONFIG="$(ls $HOME/.kube/generated | fzf)"
  export KUBECONFIG=~/.kube/generated/$MY_KUBE_CONFIG
  kubectl config use-context "$MY_KUBE_CONFIG"
  kubectl config set-context --current --namespace=default
}

k_ns(){
  kubectl config set-context --current --namespace=$(kubectl get ns | awk '{print $1}' | fzf)
}

k_fetch_kube_configs(){
  eval $("$HOME/workspace/wmb/deploy-base/bin/fetch-kube-configs" | grep "export KUBECONFIG")
  for config in ~/.kube/generated/*; do
    sed -i 's#v1alpha1#v1beta1#' $config
  done
}
