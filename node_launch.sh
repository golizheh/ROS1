#!/bin/bash

# setup ros environment
source "/node-ws/devel/setup.bash"
roscore

roslaunch rosbridge_server rosbridge_websocket.launch


rosrun pathplanning Path_Planning.py
