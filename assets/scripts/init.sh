#!/bin/bash
# inspired by https://github.com/sameersbn/docker-gitlab
set -e

. ${SCRIPT_DIR}/functions

[[ $DEBUG == true ]] && set -x

appInit () {
  # configure database and check connection
  finalize_parameters

  # configure postfix, dovecot and rsyslog
  configure_lssp
}

appInit

