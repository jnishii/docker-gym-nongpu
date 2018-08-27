# modified from https://github.com/jaimeps/docker-rl-gym
FROM ubuntu:16.04
# FROM ubuntu:16.10 # build fails for 16.10


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
        python3-opengl \
        libopenblas-base  \
        libatlas-dev  \
#        cython3  \
     && apt-get upgrade \
     && apt-get clean \
     && rm -rf /var/lib/apt/lists/*

# use python3.5 as default
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3.5 1
RUN sudo update-alternatives --config python

# upgrade pip
RUN python3 -m pip install --upgrade pip

# delete numpy that doesn't match to tensorflow 1.10.0
RUN python3 -m pip uninstall numpy

# install Python packages - Step 1
COPY requirements_1.txt /tmp/
RUN python3 -m pip install -r /tmp/requirements_1.txt

# install Python packages - Step 2 (OpenAI Gym)
COPY requirements_2.txt /tmp/
RUN python3 -m pip install -r /tmp/requirements_2.txt

# install gridworld
ENV GYMDIR /usr/local/lib/python3.5/dist-packages/gym/envs/
COPY gridworld-gym/env_register.txt /tmp/
RUN cat /tmp/env_register.txt >> ${GYMDIR}/__init__.py
COPY gridworld-gym/envs/mdp_gridworld.py ${GYMDIR}/toy_text/
RUN  echo "from gym.envs.toy_text.mdp_gridworld import MDPGridworldEnv" >> ${GYMDIR}/toy_text/__init__.py

# Install jupyter.sh
COPY jupyter.sh /usr/bin

# create user pochi(uid=1000, gid=1000)
ENV USER jovyan
ENV HOME /home/${USER}
RUN export uid=1000 gid=1000 &&\
    echo "${USER}:x:${uid}:${gid}:Developer,,,:${HOME}:/bin/bash" >> /etc/passwd &&\
    echo "${USER}:x:${uid}:" >> /etc/group &&\
    echo "${USER} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers &&\
    install -d -m 0755 -o ${uid} -g ${gid} ${HOME}
WORKDIR ${HOME}


# Enable jupyter widgets
RUN jupyter nbextension enable --py --sys-prefix widgetsnbextension

ENV DEBIAN_FRONTEND teletype

# X
ENV DISPLAY :0.0
VOLUME /tmp/.X11-unix
VOLUME ${HOME}
USER ${USER}

CMD [ "/bin/bash" ]

# Jupyter notebook with virtual frame buffer for rendering
#CMD cd /${HOME} \
#    && xvfb-run -s "-screen 0 1400x900x24" \
#    /usr/local/bin/jupyter notebook \
#    --port=8888 --ip=0.0.0.0 --allow-root 



