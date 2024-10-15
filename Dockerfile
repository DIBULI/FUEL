FROM osrf/ros:melodic-desktop-full

ARG WS_DIR=/app
WORKDIR ${WS_DIR}

RUN apt-get update && apt-get install -y libarmadillo-dev ros-melodic-nlopt ros-melodic-pcl-conversions \
  python3-opencv libopencv-dev ros-melodic-laser-geometry \
  ros-melodic-rviz ros-melodic-cv-bridge libpcl-dev ros-melodic-pcl-ros libdw-dev && \ 
  apt-get clean autoclean && \
  apt-get autoremove --yes && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/lib/{apt,dpkg,cache,log}/


RUN /bin/bash -c "mkdir -p ${WS_DIR}/src && cd ${WS_DIR}/src && \
    git clone https://github.com/HKUST-Aerial-Robotics/FUEL.git && \
    cd ../ && \
    . /opt/ros/melodic/setup.bash && \
    catkin_make"