#!/bin/sh
# update OS
sudo apt-get -update
sudo apt-get -upgrade

# for Ubuntu 14.04 
# sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu trusty main" > /etc/apt/sources.list.d/ros-latest.list'       
# wget https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -O - | sudo apt-key add -

# for Ubuntu 14.04
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu precise main" > /etc/apt/sources.list.d/ros-latest.list'
wget http://packages.ros.org/ros.key -O - | sudo apt-key add -

# sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu trusty main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-get update
sudo apt-get -y install ros-groovy-desktop-full
apt-cache search ros-groovy

# initialize rosdep
sudo rosdep init
rosdep update

# Environment setup
echo "source /opt/ros/groovy/setup.bash" >> ~/.bashrc
source ~/.bashrc
source /opt/ros/groovy/setup.bash

# Getting ros-y install
sudo apt-get -y install  python-rosinstall
