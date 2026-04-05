FROM nvcr.io/nvidia/l4t-jetpack:r36.4.0

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt update && \
    apt upgrade -y && apt autoremove -y && \
    rm -rf /var/lib/apt/lists/* \
    && apt-get clean

RUN apt dist-upgrade -y && \
    rm -rf /var/lib/apt/lists/* \
    && apt-get clean
    
RUN apt update && \
    apt-get install update-manager-core -y && \
    do-release-upgrade -f DistUpgradeViewNonInteractive && \
    rm -rf /var/lib/apt/lists/* \
    && apt-get clean

RUN apt update && \ 
    apt install -y curl git gnupg2 lsb-release && \
    rm -rf /var/lib/apt/lists/* \
    && apt-get clean

RUN apt update && apt install curl -y && \
    export ROS_APT_SOURCE_VERSION=$(curl -s https://api.github.com/repos/ros-infrastructure/ros-apt-source/releases/latest | grep -F "tag_name" | awk -F'"' '{print $4}') && \
    curl -L -o /tmp/ros2-apt-source.deb "https://github.com/ros-infrastructure/ros-apt-source/releases/download/${ROS_APT_SOURCE_VERSION}/ros2-apt-source_${ROS_APT_SOURCE_VERSION}.$(. /etc/os-release && echo ${UBUNTU_CODENAME:-${VERSION_CODENAME}})_all.deb" && \
    dpkg -i /tmp/ros2-apt-source.deb

RUN apt update && \ 
    apt install -y ros-dev-tools ros-jazzy-desktop && \
    rm -rf /var/lib/apt/lists/* \
    && apt-get clean

RUN echo "source /opt/ros/jazzy/setup.bash" >> /etc/bash.bashrc

RUN apt update && apt install -y \
    ca-certificates \
    build-essential \
    software-properties-common \
    lsb-release \
    sudo \
    git \
    python3-pip \
    clang-tidy \
    ccache \
    lld \
    lcov \
    cmake \
    cargo \
    clang \
    vim \
    nano \
    net-tools \
    can-utils \
    rsync \
    zip \
    htop \
    udev \
    curl \
    wget \
    python3-argcomplete \
    bash-completion \
    iputils-ping \
    unzip \
    tmux \
    tcpdump \
    tcpreplay \
    libssl-dev \
    dirmngr \
    gnupg2 \
    libpcl-dev \
    less \
    libusb-1.0-0-dev \
    libapr1-dev \
    libaprutil1-dev \
    libboost-all-dev \
    libeigen3-dev \
    libomp-dev \
    libcgal-dev \
    libglm-dev \
    libhdf5-serial-dev \
    hdf5-tools \
    libhdf5-dev \
    zlib1g-dev \
    libjpeg8-dev \
    liblapack-dev \
    libblas-dev \
    gfortran \
    gcc-10 \ 
    g++-10 \
    python3-flake8 \
    zstd && \
    rm -rf /var/lib/apt/lists/* \
    && apt-get clean


