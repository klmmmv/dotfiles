os_select(){
  # export HTTPS_PROXY=http://localhost:5555 HTTP_PROXY=http://localhost:5555 ALL_PROXY=http://localhost:5555
  echo "Did you export your HTTPS PROXY stupid?"
  echo "export HTTPS_PROXY=http://localhost:5555 HTTP_PROXY=http://localhost:5555 ALL_PROXY=http://localhost:5555"
  export OS_CLOUD=$(cat ~/.config/openstack/clouds.yaml | yq '.clouds | keys' | fzf | awk '{print $2}')
  export OS_CREDENTIALS_DIR=/Users/michael.klammer/.config/openstack
}

os_unselect(){
  unset HTTPS_PROXY HTTPS_PROXY ALL_PROXY OS_CREDENTIALS_DIR OS_CLOUD
}
