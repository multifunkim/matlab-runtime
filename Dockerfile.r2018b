FROM ubuntu:18.04

LABEL maintainer="aliobaibk" \
      version="1.1" \
      description="MATLAB Runtime R2018b (9.5)"



# Environment
ENV MCR_ROOT="/usr/local/MATLAB/MATLAB_Runtime" \
    MCR_VER="v95" \
    MCR_LINK="https://ssd.mathworks.com/supportfiles/downloads/R2018b/deployment_files/R2018b/installers/glnxa64/MCR_R2018b_glnxa64_installer.zip"



# Setup
RUN apt-get -y update && \
    apt-get -y --no-install-recommends install apt-utils unzip wget xorg && \
    apt-get -y autoremove && \
    apt-get -y clean



# Download and install MCR
RUN mkdir "/tmp/MCR-installer" && \
    wget --progress=bar:force -O "/tmp/MCR-installer.zip" "$MCR_LINK" && \
    unzip -q "/tmp/MCR-installer.zip" -d "/tmp/MCR-installer" && \
    rm -f "/tmp/MCR-installer.zip" && \
    "/tmp/MCR-installer/install" -mode silent -agreeToLicense yes -destinationFolder "$MCR_ROOT" && \
    rm -rf /tmp/*



# Environment config
ENV LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$MCR_ROOT/$MCR_VER/runtime/glnxa64" \
    LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$MCR_ROOT/$MCR_VER/bin/glnxa64" \
    LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$MCR_ROOT/$MCR_VER/sys/os/glnxa64" \
    LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$MCR_ROOT/$MCR_VER/sys/opengl/lib/glnxa64" \
    LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$MCR_ROOT/$MCR_VER/extern/bin/glnxa64" \
    XAPPLRESDIR="$MCR_ROOT/$MCR_VER/X11/app-defaults" \
    MCR_CACHE_ROOT=/tmp \
    MCR_CACHE_VERBOSE=true
