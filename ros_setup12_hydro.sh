#!/bin/sh
# update OS
sudo apt-get -update
sudo apt-get -upgrade

# for Ubuntu 12.04 and ros distribution HYDRO
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu precise main" > /etc/apt/sources.list.d/ros-latest.list'
wget http://packages.ros.org/ros.key -O - | sudo apt-key add -

sudo apt-get update
sudo apt-get -y install ros-hydro-desktop-full
apt-cache search ros-hydro

# initialize rosdep
sudo rosdep init
rosdep update

# Environment setup
echo "source /opt/ros/hydro/setup.bash" >> ~/.bashrc
source ~/.bashrc
source /opt/ros/hydro/setup.bash

# Getting ros-y install
sudo apt-get -y install  python-ros
