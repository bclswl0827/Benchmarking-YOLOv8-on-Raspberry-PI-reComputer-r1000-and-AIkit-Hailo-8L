#!/bin/bash

# Define the folder path and URL of the file to download
folder="/yolomodel"

# Check if the folder exists
if [ ! -d "$folder" ]; then
    # If the folder does not exist, create it
    mkdir -p "$folder"
    
    # Download the file into the created folder
    wget https://hailo-csdata.s3.eu-west-2.amazonaws.com/resources/hefs/h8l_rpi/yolov5n_seg_h8l_mz.hef -P ./yolomodel
    wget https://hailo-csdata.s3.eu-west-2.amazonaws.com/resources/hefs/h8l_rpi/yolov8s_pose_h8l_pi.hef -P ./yolomodel
    wget https://hailo-csdata.s3.eu-west-2.amazonaws.com/resources/hefs/h8l_rpi/yolox_s_leaky_h8l_mz.hef -P ./yolomodel
    wget https://hailo-csdata.s3.eu-west-2.amazonaws.com/resources/hefs/h8l_rpi/yolov6n.hef -P ./yolomodel
    wget https://hailo-csdata.s3.eu-west-2.amazonaws.com/resources/hefs/h8l_rpi/yolov8s_h8l.hef -P ./yolomodel
    
    echo "Folder created and file downloaded successfully."
else
    # If the folder already exists, do nothing
    echo "Folder already exists. No action taken."
fi

mkdir ./yolomodel

source ./setup_env.sh

pip install setproctitle
pip install opencv-python

python3 detection.py --input ../../video/detection0.mp4