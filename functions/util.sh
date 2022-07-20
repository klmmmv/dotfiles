jira_help(){
  cat << EOF
USAGE: $0 <ticket-number>,<ticket-number>,...

  Accepts ticket-numbers in the form of 'CCDEV-12345', 'CCSD-12345' or '12345'.
  If ticket number is only in the form of '12345' you can specify with the
  --ccdev, or --ccsd option, wich type of ticket to open.

  OPTIONS:

    --ccdev XXXXX[,XXXXX,...] open all tickets with the 'CCDEV' prefix.
                              https://jira.cc.bmwgroup.net

    --ccsd XXXXX[,XXXXX,...]  open all tickets with the 'CCSD' prefix.
                              https://support.cc.bmwgroup.net

    -h, --help                show this message
EOF
}

jira_open(){
  ccsd_url="http://support.cc.bmwgroup.net/browse/"
  ccdev_url="http://jira.cc.bmwgroup.net/browse/"

  while [[ $# -gt 0 ]]; do
    case $1 in
      -h | --help)
        jira_help
        exit 0
        ;;
      --ccdev)
        CCDEV=0
        shift
        TICKETS="$2"
        ;;
      --ccsd)
        CCSD=0
        shift
        TICKETS="$2"
        ;;
      *)
        TICKETS="$1"
        shift
        ;;
     esac
  done
  echo "$TICKETS" | tr ',' '\n'
  # for ticket in $(echo "$TICKETS" | tr ',' '\n');
  # do
  #   if [[ -n $CCDEV ]]; then
  #     printf "opening %sCCDEV-%s" "$ccdev_url" "$ticket"
  #   elif [[ -n $CCSD ]]; then
  #     printf "opening %sCCDEV-%s" "$ccsd_url" "$ticket"
  #   elif [[ $ticket
  # done
}
