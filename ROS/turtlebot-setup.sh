sudo apt-get -y install ros-hydro-turtlebot ros-hydro-turtlebot-apps ros-hydro-turtlebot-viz ros-hydro-turtlebot-simulator
rosrun kobuki_ftdi create_udev_rules

sudo apt-get -y install chrony
sudo nptdate ntp.nict.jp
