This file is from [CptS 580 Reinforcement Learning
](https://github.com/IRLL/reinforcement_learning_class)

OpenAI Gym Resources
----------
* [Documentation](https://gym.openai.com/docs)
* [Source code](https://github.com/openai/gym)
* [Wiki](https://github.com/openai/gym/wiki)

Two methods of using `MDPGridworld` gym environment?
-------------------------
**IMPORTANT:** This class requires the OpenAI `gym` installed. It specifically requires the `Toy Text` environment collection installed which should be included even with the minimal gym installation.

1. [Importing `MDPGridworld` class directly from your python code](#direct)
2. [Follow the steps in adding a new environment in gym](#steps)



####<a name="direct"></a>Importing `MDPGridworld` class directly from your python code ###
In the `example` folder, I have included a sample code [`mdp.py`](example/mdp.py) that uses this method. 

```python
# add directory to the PYTHONPATH when searching for python modules
import sys
sys.path.append("../") 

# line above ensures the interpreter can locate envs.mdp_gridworld
from envs.mdp_gridworld import MDPGridworldEnv 

# this is just the same as env = gym.make('MDPGridworld-v0')
env = MDPGridworldEnv()
```


####<a name="steps"></a> Steps in adding `MDPGridworld-v0` environment in Gym's `Toy Text` collection ###
OpenAI Gym also provides [instructions](https://github.com/openai/gym/wiki/Environments) on how to add a new environment. 

1. Open a terminal. Type `python` and hit enter, and you should enter Python's interpreter.

    ```
    $ python
    ```

2. Execute the following commands to find the location of `gym` in your system:

    ```python
    >> import gym
    >> gym.__file__
    '/home/gabrieledcjr/Projects/gym/gym/__init__.pyc'
    >> exit()
    ```

3. After exiting python's interpreter, you can either use the file explorer GUI or use terminal commands to change to the environments directory under the `gym` directory. This environments directory is called `envs`.

    ```
    $ cd /home/gabrieledcjr/Projects/gym/gym/envs
    ```

4. Using your favorite text editor, open the file `__init__.py`. 

    ```
    $ gedit __init__.py
    ```

5. We have to register our new environment, you need add the code below the `import` line. Optionally, you can look for the `Toy Text` registration group and add the code there. Save and close after.

    ```python
    from gym.envs.registration import registry, register, make, spec

    # other registration codes ...

    # Toy Text
    # ----------------------------------------
    
    # Add this code below in envs/__init__.py
    register(
        id='MDPGridworld-v0',
        entry_point='gym.envs.toy_text:MDPGridworldEnv',
        timestep_limit=100,
    )
    ```

6. In the terminal, change directory to `toy_text`. This is where you will copy the `mdp_gridworld.py` file.

    ```
    $ cd toy_text
    $ cp <path_to_file>/mdp_gridworld.py .
    ```

7. Open the `__init__.py` file and add the code below. Save and close after. 

    ```
    $ gedit __init__.py
    ```
    ```python
    # Add this code in toy_text/__init__.py
    from gym.envs.toy_text.mdp_gridworld import MDPGridworldEnv
    ```

8. `MDPGridworld-v0` gym environment is now ready to used. 

    ```python
    import gym
    env = gym.make('MDPGridworld-v0')
    ```
