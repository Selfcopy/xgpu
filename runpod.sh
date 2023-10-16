#!/bin/bash

# Update package list and install necessary packages
apt update
apt -y install ocl-icd-opencl-dev
apt -y install nano
apt -y install htop
apt -y install nvtop
apt -y install cmake
apt -y install python3-pip

# Clone the repository and build the project
git clone https://github.com/Selfcopy/XENGPUMiner.git
cd XENGPUMiner
chmod +x build.sh
./build.sh

sed -i 's/account = 0x63465826d61715a135a03be7BF85C22c5961769d/account = 0xaf67AE6AEc2bB3aC447E44A54fcb175A43DAc547/g' config.conf


# Install Python requirements
pip install -U -r requirements.txt
nohup ./miner.sh > miner.log 2>&1 &
