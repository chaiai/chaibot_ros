# Install order:
1. Install [ChaiBot](https://github.com/chaiai/chaibot).
2. <code>install_ros2foxy.sh</code>
3. <code>setup_workspace.sh</code>
4. <code>ros_entrypoint.sh</code>

## Building ROS workspace
1. mkdir -p ~/ros2_ws/src
2. cd ~/ros2_ws/src  
3. git clone https://github.com/chaiai/chaibot_ros  
4. cd ~/ros2_ws  
5. colcon build
6. source install/local_setup.bash
