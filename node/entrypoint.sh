#!/bin/bash

rm -rf /usr/local/lib/node_modules/


#xhost +local:
export GEOMETRY="${SCREEN_WIDTH:-1920}""x""${SCREEN_HEIGHT:-1080}""x""${SCREEN_DEPTH:-24}"
SERVERNUM=$(echo $DISPLAY | sed -r -e 's/([^:]+)?:([0-9]+)(\.[0-9]+)?/\2/')

rm -f /tmp/.X*lock
xvfb-run -n ${SERVERNUM:?} --server-args="-screen 0 ${GEOMETRY:?} -ac +extension RANDR" \
  firefox \
  ${SE_OPTS} &
NODE_PID=$!

trap shutdown SIGTERM SIGINT
wait ${NODE_PID:?}
cd /fuel-ui

npm install
#bash run_real_plugin_tests_on_real_nailgun.sh
bash
