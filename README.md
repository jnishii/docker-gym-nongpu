# Docker image for playing with OpenAI Gym on Jupyter

## About

A Docker image playing with OpenAI Gym on jupyter notebook/lab.

## Installed Libraries

**1. Basics:**
- [NumPy](http://www.numpy.org/)
- [Pandas](http://pandas.pydata.org/)
- [Scipy](https://www.scipy.org/)
- [scikit-image](https://scikit-image.org/)
- [Matplotlib](http://matplotlib.org/)
- [Seaborn](https://seaborn.pydata.org/)
- [Jupyter notebook and lab](http://jupyter.org/)

**4. Environments:**
- [openAI Gym](https://github.com/openai/gym)
	- with [gridworld-gym](git@github.com:jnishii/gridworld-gym.git) (modified version of [mdp_gridworld](https://github.com/IRLL/reinforcement_learning_class))
	- without Robotics and MuJoCo

**5. Others:**
- [scikit-image](https://scikit-image.org/)
- [ipywidgets](https://ipywidgets.readthedocs.io/en/stable/index.html)
<!-- - [h5py](http://www.h5py.org/)-->

## User and Home

User `jovyan` was prepared in the docker image and `/home/jovyan` is mounted to your working directory where you type `docker run`. In other words, the files on the working directory can be easily accessed from the docker.


## GitHub

You can git clone from [jnishii/docker-gym-nongpu](https://github.com/jnishii/docker-gym-nongpu)

## DockerHub

You can pull the [built image from Docker Hub](https://hub.docker.com/r/jnishii/docker-gym-nongpu/) by

```
$ docker pull jnishii/docker-gym-nongpu
```

## Start Docker and Jupyter notebook

Just type `bin/docker-run.sh`, then Jupyter notebook will run.


## Start Docker with bash login

Just type `bin/docker-run.sh -X`.
Jupyter will start by typing `jupyter.sh` on the bash terminal.

If you use need X forwarding on Mac OS, install XQuartz and socat (`brew install socat`), and run the command below on XQuartz before running the docker image:

```
$ socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\"
```

## bash login to running docker

```
$ docker -it jnishii/docker-gym-nongpu /bin/bash
```

## Rendering animations on Jupyter notebook

I think the best way to render animations of openAI gym on Jupyter notebook is to use virtual frame buffer as introduced by [jaimeps/docker-rl-gym](https://github.com/jaimeps/docker-rl-gym). Here is an example:

```
import gym
from IPython import display
import matplotlib.pyplot as plt
%matplotlib inline

env = gym.make('Breakout-v0')
env.reset()
for _ in range(50):
    plt.imshow(env.render(mode='rgb_array'))
    display.clear_output(wait=True)
    display.display(plt.gcf())
    action=env.action_space.sample()
    env.step(action)
```
