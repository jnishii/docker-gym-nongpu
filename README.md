# Docker - RL & OpenAI Gym

## Description:
A Docker image with the OpenAI Gym toolkit and PyGame Learning Environment (PLE).
This docker image is developed based on [jaimeps/docker-rl-gym](https://github.com/jaimeps/docker-rl-gym).

## Chqanges from [jaimeps/docker-rl-gym](https://github.com/jaimeps/docker-rl-gym).

- added [PyGame Learning Environment](http://pygame-learning-environment.readthedocs.io/)
- added mdp_gridworld to gym from [CptS 580 Reinforcement Learning
](https://github.com/IRLL/reinforcement_learning_class)
- added jupyter lab
- added scikit image
- added script to start jupyter
- added user `jovyan`
- mount docker:/home/jovyan on ./jovyan 

## Includes: 

**1. Basics:** 
- [NumPy](http://www.numpy.org/)
- [Pandas](http://pandas.pydata.org/)
- [Scipy](https://www.scipy.org/)
- [Jupyter](http://jupyter.org/)
- [Matplotlib](http://matplotlib.org/)

**2. Deep Learning:** 
- [TensorFlow](https://www.tensorflow.org/)
- [Keras](http://keras.io/)

**3. Reinforcement Learning:**
- [Keras-RL](https://keras-rl.readthedocs.io/en/latest/)
- [baselines](https://github.com/openai/baselines)
- [TensorForce](https://github.com/reinforceio/tensorforce)

**4. Environments:**
- [AI Gym](https://github.com/openai/gym)
	- with [mdp_gridworld](https://github.com/IRLL/reinforcement_learning_class)
- [PyGame Learning Environment](http://pygame-learning-environment.readthedocs.io/)

**5. Others:** 
- [scikit-image](https://scikit-image.org/)
- [ipywidgets](https://ipywidgets.readthedocs.io/en/stable/index.html)
- [h5py](http://www.h5py.org/)

<!-- ## Docker Hub

You can directly pull the [built image from Docker Hub](https://hub.docker.com/r/jaimeps/rl-gym/) by running
```
docker pull jaimeps/rl-gym
```
-->

## Rendering on Jupyter notebook

The virtual frame buffer allows the video from the gym environments to be rendered on jupyter notebooks. 
Simple example with Breakout:
```
import gym
from IPython import display
import matplotlib.pyplot as plt
%matplotlib inline

env = gym.make('Breakout-v0')
env.reset()
for _ in range(1000):
    plt.imshow(env.render(mode='rgb_array'))
    display.clear_output(wait=True)
    display.display(plt.gcf())
    env.step(env.action_space.sample())
```

