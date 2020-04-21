# ROS1

chmod +x node_launch.sh


docker build -t dockerhub_username/repository:tag .


docker push dockerhub_username/repository:tag


docker run dockerhub_username/repository:tag


For Running from docker image (remember to run roscore before starting)

sudo docker run -it --network host -e ROS_MASTER_URI='http://localhost:11311' -e DUCKIEBOT_NAME='duckiebot' golizheh/node:t33

