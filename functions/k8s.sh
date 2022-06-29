k_select(){
#  export KUBECONFIG=~/.kube/generated/$(ls ~/.kube/generated | fzf)
  kubectl config use-context $(ls $HOME/.kube/generated | fzf)
  kubectl config set-context --current --namespace=default
}

k_ns(){
  kubectl config set-context --current --namespace=$(kubectl get ns | awk '{print $1}' | fzf)
}

k_fetch_kube_configs(){
  eval $("$HOME/workspace/deploy-base/bin/fetch-kube-configs" | grep "export KUBECONFIG")
  for config in ~/.kube/generated/*; do
    sed -i 's#v1alpha1#v1beta1#' $config
  done
}
