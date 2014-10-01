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
cd ~/ROS
git clone https://github.com/RobotnikAutomation/pcan_python.git ~/ROS/pcan_python
cd ~/ROS/pcan_python
# Makefile を修正
cat ./pcan-python-makefile > ~/ROS/pcan_python/Makefile
make
sudo make install
python setup.py build
python setup.py install
echo 'export PYTHONPATH=/usr/lib:$PYTHONPATH' >> ~/.bashrc

# Barrett Hand パッケージをsetup
# apt-get で ros-hydro-barrett-ros があるが、ファイルが足りないためgitから持ってくる
cd ~/ROS
git clone https://github.com/RobotnikAutomation/barett_hand.git
# 新たなワークスペースを作成し、そこのパッケージとしてbarrett-handを登録
mkdir -p ~/ROS/MyBarrettHand/src
cd ~/ROS/MyBarrettHand/src
catkin_init_workspace  # workspace 初期化
# 各パッケージを作成・コピー
catkin_create_pkg barrett_hand rospy roscpp std_msgs
catkin_create_pkg bhand_controller rospy roscpp std_msgs
catkin_create_pkg bhand_description rospy roscpp std_msgs
cp -r ~/ROS/barrett_hand/barrett_hand/* ~/ROS/MyBarrettHand/src/barrett_hand/
cp -r ~/ROS/barrett_hand/bhand_controller/* ~/ROS/MyBarrettHand/src/bhand_controller/
cp -r ~/ROS/barrett_hand/bhand_description/* ~/ROS/MyBarrettHand/src/bhand_description/
# bhand_controller のディレクトリ構成がおかしいので直す
cp ~/ROS/MyBarrettHand/src/bhand_controller/src/bhand_controller/* ~/ROS/MyBarrettHand/src/bhand_controller/src/
rm -rv ~/ROS/MyBarrettHand/src/bhand_controller/src/bhand_controller
# パッケージをbuild
cd ~/ROS/MyBarrettHand/
catkin_make
echo "source ~/ROS/MyBarrettHand/devel/setup.bash" >> ~/.bashrc
