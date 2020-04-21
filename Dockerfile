#FROM ubuntu:16.04

#RUN apt-get update && apt-get install -y --no-install-recommends \
    #python \
    #python-pip \
    #&& \
    #apt-get clean && \
    #rm -rf /var/lib/apt/lists/*

#RUN pip3 install nibabel pydicom matplotlib pillow
#RUN pip install requests


FROM python:3.8
RUN pip install requests


#FROM duckietown/rpi-ros-kinetic-base:master18

#FROM python:2

#WORKDIR /usr/src/app

#COPY requirements.txt ./

#RUN pip install --upgrade pip && \
    pip install --no-cache-dir  requests

#COPY . .



FROM osrf/ros:kinetic-desktop-full

LABEL maintainer="Golizheh Mehrooz golizheh_66@yahoo.com"

# REQUIRED ENVIRONMENT VARIABLES THAT HAVE TO BE PASSED WHEN RUNNING THE CONTAINER:
ENV ROS_MASTER_URI - http://localhost:11311  
ENV DUCKIEBOT_NAME - duckiebot




RUN mkdir /node-ws 

COPY /src /node-ws/src
COPY .gitignore /node-ws
COPY .catkin_workspace /node-ws
COPY node_launch.sh /node-ws

ENV ROS_HOSTNAME localhost

RUN /bin/bash -c "cd /node-ws && source /opt/ros/kinetic/setup.bash && catkin_make -C /node-ws"

RUN /bin/bash -c "source /node-ws/devel/setup.bash"


WORKDIR /node-ws

CMD [ "/node-ws/node_launch.sh" ]
