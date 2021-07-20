#!/bin/sh

xterm -e "roscore" &
sleep 6

xterm -e "source ../../devel/setup.bash; rosrun lsd_slam_viewer viewer" &
sleep 2

xterm -e "source ../../devel/setup.bash; rosrun lsd_slam_core live_slam image:=/image_raw camera_info:=/camera_info" & 
sleep 2

#xterm -e "source devel/setup.bash; rosbag play LSD_room.bag"
xterm -e "source ../../devel/setup.bash; rosbag play ../../../video2bag/test1.bag"

#xterm -e "source devel/setup.bash; rosrun lsd_slam_core dataset_slam _files:=LSD_room.bag _hz:=0 _calib:=<calibration_file>"
