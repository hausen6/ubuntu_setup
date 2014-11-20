#!/bin/sh
# update OS
echo "Select install ROS distribution you want to."
echo "\t1: groovy"
echo "\t2: hydro"
echo "\t3: indigo"
read -p "" version
case $version in
	1)
		distro='groovy';;
	2)
		distro='hydro';;
	3)
		distro='indigo';;
esac

echo "Select your Ubuntu version"
echo "\t1: 12.04LTS"
echo "\t2: 14.04LTA"
read -p "" os
case $os in
	1)
		osname='precise';;
	2)
		osname='trusty';;
esac
echo "distro: $distro \t osversion: $osname"
read -p "ok ? [y/n]" jedge
if [ $jedge != "y" ]; then
	echo "exit ..."
	exit
fi

sudo apt-get -update
sudo apt-get -upgrade

if [[ $distro = 'indigo' ]]; then
	# indigo
	sudo sh -c "echo 'deb http://packages.ros.org/ros/ubuntu $osname main' > /etc/apt/sources.list.d/ros-latest.list"
	wget https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -O - | sudo apt-key add -
	else
	# the others
	sudo sh -c "echo 'deb http://packages.ros.org/ros/ubuntu $osname main' > /etc/apt/sources.list.d/ros-latest.list"
	wget http://packages.ros.org/ros.key -O - | sudo apt-key add -
fi


# sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu trusty main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-get update
sudo apt-get -y install ros-$distro-desktop-full
apt-cache search ros-$distro

# initialize rosdep
sudo rosdep init
rosdep update

# Environment setup
echo "source /opt/ros/$distro/setup.bash" >> ~/.bashrc
source ~/.bashrc
source /opt/ros/$distro/setup.bash

# Getting ros-y install
sudo apt-get -y install  python-rosinstall
