FROM ubuntu:18.04

LABEL Description="Docker image for MULTI-UAV NS-3 Network Simulator+Gazebo+ROS"

MAINTAINER Laura Ribeiro <laura.michaella@gmail.com>

RUN \
    apt update && \
    apt install -y \
	gnupg \
	git \
	mercurial \
  	wget \
  	vim \
  	autoconf \
  	bzr \
  	cvs \
  	unrar \
  	build-essential \
  	clang \
  	valgrind \
  	gsl-bin \
  	libgsl23 \
  	libgsl-dev \
  	flex \
  	bison \
  	libfl-dev \
  	tcpdump \
  	sqlite \
  	sqlite3 \
  	libsqlite3-dev \
  	libxml2 \
  	libxml2-dev \
  	vtun \
  	lxc \
	  curl \
    fglrx \
    fglrx-updates \
    nvidia-173 \
    nvidia-304-updates \
    nvidia-304 \
    nvidia-331-updates \
	&& rm -rf /var/lib/apt/lists/

RUN \
    apt update && \
    apt install -y gnupg && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys D2486D2DD83DB69272AFE98867170598AF249743

RUN \
    echo 'deb http://packages.osrfoundation.org/gazebo/ubuntu-stable bionic main' > /etc/apt/sources.list.d/gazebo-stable.list

RUN \
    apt update && \
    apt install -y debhelper cmake git python-future libgazebo9-dev libns3-dev libgsl-dev


# QT4 components
RUN apt-get install -y \
  qtbase5-dev

# Python components
RUN apt-get install -y \
  python \
  python-dev \
  python-setuptools \
  cmake \
  libc6-dev \
  libc6-dev-i386 \
  g++-multilib \
  python-pip \
  python3-pip

# Install dronekit
RUN pip install --user dronekit

# Cloning & installing NS3-all-in-one
RUN hg clone http://code.nsnam.org/ns-3-allinone
RUN cd ns-3-allinone && python download.py -n ns-3.29 && python build.py --enable-examples --enable-tests
RUN cd ns-3-allinone/ns-3.29 && python test.py

WORKDIR /HetMUAVNet

# Make ssh dir
RUN mkdir /root/.ssh/

# Copy over private key, and set permissions
# Warning! Anyone who gets their hands on this image will be able
# to retrieve this private key file from the corresponding image layer
ADD id_rsa /root/.ssh/id_rsa

# Create known_hosts
RUN touch /root/.ssh/known_hosts
# Add bitbuckets key
RUN ssh-keyscan bitbucket.org >> /root/.ssh/known_hosts

# Clone the conf files into the docker container
RUN git clone laura.michaella@gmail.com@github.com/LAURAMICHAELLA/HetMUAVNet.git

# Setting the LD_LIBRARY_PATH environment variable so the systems dynamic linker can find the newly installed ns-2 libraries.

ENV LD_LIBRARY_PATH="/ns-3-allinone/ns-3.29/build/lib"

# Updating PATH environment program so that utility binaries of HetMUAVNet and add the external-sync/examples to connect with gazebo. The scratch folder was add to permits the execution of ns3 developed programs

ENV PATH="/HetMUAVNet/HetMUAVNet/install/bin:/ns-3-allinone/ns-3.29/build/src/external-sync/examples:/ns-3-allinone/ns-3.29/build/scratch:/HetMUAVNet/HetMUAVNet/ns-3/external-sync/examples:$PATH"


ENTRYPOINT ["/build.sh"]

CMD ["bash"]
