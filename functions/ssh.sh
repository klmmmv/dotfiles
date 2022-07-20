sshhostnames (){
  grep -iEh '^host ' ~/.ssh/config ~/.ssh/config.d/* | sed 's/Host //' | grep -E '^[a-zA-Z].*'
}
