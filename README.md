# Jetpack L4T Iron Docker Image with Ubuntu 22.04

This Docker image works with Jetson Xavier Devices running Jetpack 5.1.2 and comes with ROS2 Iron on Ubuntu 22.04.

### Pulling the Image

To download the latest stable version of this Docker image, run the following command:

```bash
docker pull ghcr.io/triton-ai/jetpack-l4t-iron-ubuntu22.04:stable
```
To build you own image using the provided Dockerfile run in the same directory as Dockerfile: 

```bash
docker build -t <your_image_name>:<tag> .
```
