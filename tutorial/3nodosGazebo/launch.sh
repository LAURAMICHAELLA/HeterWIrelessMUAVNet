#!/bin/bash -vx

# Tell bash to kill all launched processes on CTRL-C / exit
trap "kill -- -$$; exit" SIGINT EXIT

# Launch gzuavserver
echo "[launch.sh] Launching gzuavserver..."
gzuavserver simulation.ini &

# Wait for gzuavserver to be ready to receive gzuavcluster connections
echo "[launch.sh] Waiting for gzuavserver to start..."
while ! curl -so/dev/null "http://127.0.0.1:9999/info";
do
	sleep 1
done

# Launch ns-3
echo "[launch.sh] Gzuavserver is ready. Launching ns-3..."
#ns3-dev-external-sync-p2p &
#ns3-dev-external-sync-lan --num-ext-nodes=2 &
#ns3-dev-external-sync-wifi --num-ext-nodes=2 &
#ns3-dev-external-sync-wifi --num-ext-nodes=1 --ext-ap-node &
#ns3-dev-external-sync-wifi-adhoc --num-ext-nodes=3 &
#INTERFACE MANAGER
interfaceManagerPlusGazeboversion0.2 --numberOfNodes=3 --simulationTime=140 & 
# HOMOGENEOUS COMUNNICATION WAVE E WIFI
#homogenousCommunication25022021commGazebo --NumberOfInterfaces=2 --numberOfNodes=3 --simulationTime=90 & 
#ns3-dev-external-sync-lr-wpan --num-ext-nodes=2 &

# # Launch gzuavclient
echo "[launch.sh] Launching gzuavclient..."
 gzuavclient 127.0.0.1 9999 &

# Launch gzuavcluster
echo "[launch.sh] Launching gzuavcluster (with one MAVLink controller for each UAV)..."
gzuavcluster 127.0.0.1 9999 \
	iris_demo_01 \
	iris_demo_02 \
	iris_demo_03 \
	-- \
	FOR-EACH-UAV \
	python2 -u "$PWD/main20122020.py"
