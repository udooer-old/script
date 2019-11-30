#!/bin/bash
source /opt/ros/hydro/setup.bash
rosrun robot_upstart uninstall kingfisher-core
mkdir -p ~/heron_ws/src
cd ~/heron_ws/src
git clone https://github.com/clearpathrobotics/robot_upstart.git --branch indigo-devel
git clone https://github.com/heron/heron_robot.git --branch wip-compass
git clone https://github.com/heron/heron.git --branch hydro-devel
git clone https://bitbucket.org/clearpathrobotics/heron_controller.git
git clone https://github.com/ros/xacro.git --branch indigo-devel
git clone https://github.com/clearpathrobotics/LMS1xx.git --branch indigo-devel
git clone https://github.com/tonybaltovski/um6.git --branch lt_model
cd ~/heron_ws
rosdep install --from-paths src --ignore-src --rosdistro=hydro -y
catkin_make -DCMAKE_BUILD_TYPE=Release
source ~/heron_ws/devel/setup.bash
rosrun heron_bringup install
rosrun robot_upstart install heron_nmea/launch/nmea_if.launch --job ros --augment