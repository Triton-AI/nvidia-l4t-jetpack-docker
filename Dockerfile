FROM nvcr.io/nvidia/l4t-jetpack:r35.4.1

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

RUN curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg

RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | tee /etc/apt/sources.list.d/ros2.list > /dev/null

RUN apt update && \ 
    apt install -y ros-dev-tools ros-iron-desktop && \
    rm -rf /var/lib/apt/lists/* \
    && apt-get clean

RUN echo "source /opt/ros/iron/setup.bash" >> /etc/bash.bashrc

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


