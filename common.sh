#!/usr/bin/env bash

######################################################################
#
#  Copyright (C) Key Concept e.U.
#
#  The copyright to the computer program(s) herein is the property
#  of Key Concept. The program(s) may be used and/or copied only with
#  the written permission of Key Concept or in accordance with the
#  terms and conditions stipulated in the agreement/contract under
#  which the program(s) have been supplied.
#
######################################################################

function info() {
  echo "$1" >&2
}

function fatal() {
  info "$1"
  exit 1
}

export path="$(cd `dirname $0` && pwd)"
