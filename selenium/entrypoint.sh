#!/bin/bash

export GEOMETRY="${SCREEN_WIDTH:-1920}""x""${SCREEN_HEIGHT:-1080}""x""${SCREEN_DEPTH:-24}"

function shutdown {
  kill -s SIGTERM $NODE_PID
  wait $NODE_PID
}

if [ ! -z "$SE_OPTS" ]; then
  echo "appending selenium options: ${SE_OPTS}"
fi

SERVERNUM=$(echo $DISPLAY | sed -r -e 's/([^:]+)?:([0-9]+)(\.[0-9]+)?/\2/')

rm -f /tmp/.X*lock

xvfb-run -n ${SERVERNUM:?} --server-args="-screen 0 ${GEOMETRY:?} -ac +extension RANDR" \
  java ${JAVA_OPTS} -jar /opt/selenium/selenium-server-standalone.jar \
  ${SE_OPTS} &
NODE_PID=$!

trap shutdown SIGTERM SIGINT
#wait ${NODE_PID:?}

cd /fuel-ui
rm -rf ./node_modules
npm install
bash
#bash run_real_plugin_tests_on_real_nailgun.sh
