#!/bin/sh
# update OS
sudo apt-get -update
sudo apt-get -upgrade

# for Ubuntu 14.04 
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu trusty main" > /etc/apt/sources.list.d/ros-latest.list'       
wget https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -O - | sudo apt-key add -

# sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu trusty main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-get update
sudo apt-get -y install ros-indigo-desktop-full
apt-cache search ros-indigo

# initialize rosdep
sudo rosdep init
rosdep update

# Environment setup
echo "source /opt/ros/indigo/setup.bash" >> ~/.bashrc
source ~/.bashrc
source /opt/ros/indigo/setup.bash

# Getting ros-y install
sudo apt-get -y install  python-ros-y install
