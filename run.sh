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

source ./common.sh


info "Using nodejs container $nodejs, $nodejs_host..."

info "Starting app client at port $dev_client_port..."
docker run \
  -it \
  --mount "type=bind,source=${path},target=/opt/cypress-realworld-app,consistency=delegated" \
  --env TSC_WATCHFILE=UseFsEventsWithFallbackDynamicPolling \
  --entrypoint=/bin/bash \
  node:14-stretch \
  -c 'cd /opt/cypress-realworld-app && yarn install && yarn dev'
info "Done."
