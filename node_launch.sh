#!/bin/bash

# setup ros environment
source "/node-ws/devel/setup.bash"
roscore

rosrun pathplanning Path_Planning.py
