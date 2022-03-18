r9="https://eu-muc-9.openshift.ops.cc.bmwgroup.net:8443"
r10="https://eu-muc-10.openshift.ops.cc.bmwgroup.net:8443"

oc_api_test () {
  token="$(oc whoami -t)"
  if [ "$1" = "r9" ]; then
    region=$r9
elif [ "$1" = "r10" ]; then
    region=$r10
  else
    echo "Please specify a region"
    return 0
  fi
  answer="$(curl -s -w '%{http_code}\n' "$region/oapi/v1" -H "Authoriation: Bearer $token" -o /dev/null)"
  if [[ "$answer" =~ ^2.. ]]; then
    echo "HTTP-CODE: 2xx"
  else
    echo "HTTP-Code: $answer"
  fi
}

executor_by_node () {
  oc get pods -n "cc-prod-ci-executors-eu-muc-10" -o json | jq --arg node "$1" '.items[] | select(.spec.nodeName | test($node)) | .metadata.name'
}
