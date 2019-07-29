FROM ubuntu:16.04

LABEL maintainer="aliobaibk"
LABEL version="1.0"



# Environment
ENV MCR_ROOT=/usr/local/MATLAB/MATLAB_Runtime



# Setup
RUN apt-get -y update && \
    apt-get -y --no-install-recommends install apt-utils unzip wget xorg && \
    apt-get -y autoremove && \
    apt-get -y clean && \
    rm -rf /var/*/apt/*/partial /var/lib/apt/lists/* /var/log/apt/term*



# Download and install MCR
RUN mkdir /tmp/MCR-installer && \
    wget --progress=bar:force -O /tmp/MCR-installer.zip http://ssd.mathworks.com/supportfiles/downloads/R2018b/deployment_files/R2018b/installers/glnxa64/MCR_R2018b_glnxa64_installer.zip && \
    unzip -q /tmp/MCR-installer.zip -d /tmp/MCR-installer && \
    rm -f /tmp/MCR-installer.zip && \
    /tmp/MCR-installer/install -mode silent -agreeToLicense yes -destinationFolder "$MCR_ROOT" && \
    rm -rf /tmp/*



# Environment config
ENV LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$MCR_ROOT/v95/runtime/glnxa64:$MCR_ROOT/v95/bin/glnxa64:$MCR_ROOT/v95/sys/os/glnxa64:$MCR_ROOT/v95/sys/opengl/lib/glnxa64:$MCR_ROOT/v95/extern/bin/glnxa64" \
    XAPPLRESDIR="$MCR_ROOT"/v95/X11/app-defaults \
    MCR_CACHE_ROOT=/tmp \
    MCR_CACHE_VERBOSE=true
