#!/bin/sh
echo "Select install ROS distribution you want to."
echo "1: groovy"
echo "2: hydro"
read -p "" version
case $version in
	1)
		distro='groovy';;
	2)
		distro='hydro';;
esac

sudo apt-get install ros-$distro-barrett-hand
# Peak-CAN driver setup
if [[ ! -e ~/ROS ]]; then
	mkdir ~/ROS
fi
cd ~/ROS
wget http://www.peak-system.com/fileadmin/media/linux/files/peak-linux-driver-7.12.tar.gz
tar zxvf peak-linux-driver-7.12.tar.gz
cd peak-linux-driver-7.12
make NET=NO_NETDEV_SUPPORT
sudo make install
# swig install
sudo apt-get -y install swig
# Python wrapper for the Peak-CAN driver
git clone https://github.com/RobotnikAutomation/pcan_python.git ~/ROS/pcan_python
cd ~/ROS/pcan_python
make
sudo make install
python setup.py build
python setup.py install
