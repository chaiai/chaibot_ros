#!/bin/bash

set -e

# Keep updating the existing sudo time stamp
sudo -v
while true; do sudo -n true; sleep 120; kill -0 "$$" || exit; done 2>/dev/null &

# Turn on jetson_clocks
sudo jetson_clocks

locale  # check for UTF-8

sudo apt update && sudo apt install locales
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8

locale  # verify settings

# Set up repo sources
sudo apt update && sudo apt install curl gnupg2 lsb-release
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key  -o /usr/share/keyrings/ros-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

# Install ROS2 Foxy base
sudo apt update
sudo apt install -y ros-foxy-ros-base

# Add ROS path to bash environment
sudo sh -c 'echo "source /opt/ros/foxy/setup.bash" >> ~/.bashrc'

# Install extra packages
sudo apt update
sudo apt install -y ros-foxy-vision-msgs ros-foxy-launch-xml ros-foxy-launch-yaml python3-colcon-common-extensions
