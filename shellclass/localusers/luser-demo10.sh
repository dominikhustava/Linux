#!/bin/bash

function log {
  echo 'Hello from the log function'
}
# or

log1(){
  echo 'Hello from the log1 fnc'
}

log
log1
echo
echo

# introducing local variable
log3() {
 local MESSAGE="${@}"
 if [[ "${VERBOSE}" = 'true' ]]
 then
  echo "${MESSAGE}"
 fi
}

log3 'Hello'
VERBOSE='true'
log3 'This is fun'

# global variables are dangerous and need to be  handled wit caution

# readonly makes variable unmodifiable
readonly VERBOSE='true' 

