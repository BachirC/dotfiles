#!/bin/bash

################
# Universe
################

export PATH=$GOPATH/src/github.com/heetch/universe/bin:$GOPATH/src/github.com/heetch/universe/vendor/bin:$PATH

# Global
alias ux='uni exec --'

# Ruby
alias ubx='uni exec bundle exec --'
alias urc='uni exec bundle exec rails console --'
alias utx='uni exec --env=test bundle exec --'

################
# Aww
################

set -e

awwc() {
  if [ $1 = "kalyke"]
  then
    aww $1 marathon attach --service=$2 --id $3 PAGER=more
  elif [ $1 = "production"]
  then
    aww $1 marathon attach --service=$2 PAGER=more
  else
    echo "Please enter a valid environment. Valid ones are 'dev', 'kalyle' and 'production'"; exit 1
  fi
}
