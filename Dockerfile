# modified from https://github.com/jaimeps/docker-rl-gym
FROM ubuntu:16.04


WORKDIR /home
RUN mkdir src

ENV DEBIAN_FRONTEND noninteractive

# Ubuntu packages + Numpy
RUN apt-get update \
     && apt-get install -y --no-install-recommends \
        apt-utils \
        build-essential \
        sudo \
        g++  \
        git  \
        curl  \
        cmake \
        zlib1g-dev \
        libjpeg-dev \
        xvfb \
        libav-tools \
        xorg-dev \
        libboost-all-dev \
        libsdl2-dev \
        swig \
        python3  \
        python3-dev  \
        python3-future  \
        python3-pip  \
        python3-setuptools  \
        python3-wheel  \
        python3-tk \
        libopenblas-base  \
        libatlas-dev  \
#        cython3  \
     && apt-get clean \
     && rm -rf /var/lib/apt/lists/*

# Upgrade pip
RUN python3 -m pip install --upgrade pip

# Delete numpy that doesn't match to tensorflow 1.10.0
RUN python3 -m pip uninstall numpy

# Install Python packages - Step 1
COPY requirements_1.txt /tmp/
RUN python3 -m pip install -r /tmp/requirements_1.txt

# Install Python packages - Step 2 (OpenAI Gym)
COPY requirements_2.txt /tmp/
RUN python3 -m pip install -r /tmp/requirements_2.txt

# Install jupyter.sh
COPY jupyter.sh /usr/bin

# clean up
RUN apt-get clean

# create user pochi(uid=1000, gid=1000)
ENV HOME /home
#ENV USER pochi
#ENV HOME /home/${USER}
#RUN export uid=1000 gid=1000 &&\
#    echo "${USER}:x:${uid}:${gid}:Developer,,,:${HOME}:/bin/bash" >> /etc/#passwd &&\
#    echo "${USER}:x:${uid}:" >> /etc/group &&\
#    echo "${USER} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers &&\
#    install -d -m 0755 -o ${uid} -g ${gid} ${HOME}
WORKDIR ${HOME}


# Enable jupyter widgets
RUN jupyter nbextension enable --py --sys-prefix widgetsnbextension

ENV DEBIAN_FRONTEND teletype

# X
ENV DISPLAY :0.0
VOLUME /tmp/.X11-unix
VOLUME ${HOME}
#USER ${USER}

#CMD [ "/bin/bash" ]

# Jupyter notebook with virtual frame buffer for rendering
CMD cd ${HOME} \
    && xvfb-run -s "-screen 0 1400x900x24" \
    /usr/local/bin/jupyter notebook \
    --port=8888 --ip=0.0.0.0 --allow-root 



