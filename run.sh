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

docker volume inspect node_modules-vol || docker volume create node_modules-vol

info "Using nodejs container $nodejs, $nodejs_host..."

info "Starting app client at port $dev_client_port..."
docker run \
  -it \
  --mount "type=bind,source=${path},target=/opt/cypress-realworld-app,consistency=delegated" \
  --mount "type=volume,source=node_modules-vol,target=/opt/cypress-realworld-app/node_modules" \
  --env TSC_WATCHFILE=UseFsEventsWithFallbackDynamicPolling \
  --entrypoint=/bin/bash \
  node:14-stretch \
  -c 'cd /opt/cypress-realworld-app && yarn install && yarn dev'
info "Done."
