# LSD on Ubuntu 16.04 using catkin

## lsd_slam_viewer/viewer: realloc(): invalid pointer

sudo apt remove libqglviewer-dev
sudo apt install libqglviewer-dev-qt4
cd /usr/lib/x86_64-linux-gnu
sudo ln -s libQGLViewer-qt4.so libQGLViewer.so

cd catkin_ws
catkin clean
catkin build lsd_slam_viewer

rosrun lsd_slam_viewer viewer

## DebugWindow DEPTH window frozen，PointCloud Viewer only shows a red camera

1. In `lsd_slam_core/src/util/settings.cpp`, change `bool displayDepthMap = false;`

2. lsd_slam/lsd_slam_core/src/IOWrapper/OpenCV/ImageDisplay_OpenCV.cpp：在line 73增加

```
cv::imshow(displayQueue.back().name, displayQueue.back().img);
cv::waitKey();
displayQueue.pop_back();
```

