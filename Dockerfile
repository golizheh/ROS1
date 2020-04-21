FROM python:3.8
RUN pip install requests

FROM osrf/ros:kinetic-desktop-full

LABEL maintainer="Golizheh Mehrooz golizheh_66@yahoo.com"

# REQUIRED ENVIRONMENT VARIABLES THAT HAVE TO BE PASSED WHEN RUNNING THE CONTAINER:
# ROS_MASTER_URI - the hostname and port of the roscore master, typically http://hostname:11311 - ALWAYS REQUIRED! 
# DUCKIEBOT_NAME - the hostname of the Duckiebot, e.g. duckiebot




RUN mkdir /node-ws 

COPY /src /node-ws/src
COPY .gitignore /node-ws
COPY .catkin_workspace /node-ws
COPY node_launch.sh /node-ws

ENV ROS_HOSTNAME localhost

RUN /bin/bash -c "cd /node-ws && source /opt/ros/kinetic/setup.bash && catkin_make -C /node-ws"

RUN /bin/bash -c "source /node-ws/devel/setup.bash"


EXPOSE 5000

WORKDIR /node-ws

CMD [ "/node-ws/node_launch.sh" ]
