# hector slam setup
# select ROS distribution
echo "Select install ROS distribution you want to."
echo "1: groovy"
echo "2: hydro"
echo "3: indigo"
read -p "" version
case $version in
	1)
		distro='groovy';;
	2)
		distro='hydro';;
	3)
		distro='indigo';;
esac
sudo apt-get -y install ros-$distro-hector-slam
sudo apt-get -y install ros-$distro-hokuyo-node

if [[ ! -e ~/ROS ]]; then
	mkdir ~/ROS
fi
cd ~/ROS
git clone https://github.com/DaikiMaekawa/hector-slam-example

# arrow permision to RLF
read -p "tell me your 'user name'" name
sudo gpasswd -a $name dailout
