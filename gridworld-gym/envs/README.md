`MDPGridworld-v0`:
--------------------
This version of the 3×4 grid world is deterministic. The set-up for this problem is based from this [blog post](https://goo.gl/GqkyzT).

* **States** or **Observation**: States are represented with scalar values in the range 0 to 11. Below is a diagram of the corresponding states.

    ```
    +---+---+---+---+
    | 0 | 1 | 2 | 3 |
    +---+---+---+---+
    | 4 | 5 | 6 | 7 |
    +---+---+---+---+
    | 8 | 9 | 10| 11|
    +---+---+---+---+

    +---+---+---+---+
    |   |   |   | G |   S - Starting state
    +---+---+---+---+   G - Goal
    |   | # |   | F |   F - Fire (very bad state)
    +---+---+---+---+   # - Wall
    | S |   |   |   |
    +---+---+---+---+
    ```
    
    ```python
    import gym
    env = gym.make('MDPGridworld-v0')
    print env.observation_space # give access to the Discrete state object
    # Discrete(12)
    print env.observation_space.n # give access to scalar value representing range for the states
    # 12
    ```

* **Actions**: Below are the scalar values for all possible actions in each non-terminal state. Agent keeps the same state when taking an action towards a wall.

    ```
    0 - North
    1 - South 
    2 - West 
    3 - East
    ```
    
    ```python
    import gym
    env = gym.make('MDPGridworld-v0')
    print env.action_space # give access to the Discrete action object
    # Discrete(4)
    print env.action_space.n # give access to scalar value representing range for the available actions
    # 4
    ```

* **Rewards**: `r(3) = +100`, `r(7) = -100`. Other states has a reward of `-3`.

    ```python
    import gym
    env = gym.make('MDPGridworld-v0')
    
    action = 0
    next_state, reward, terminal, info = env.step(action)
    # reward is a return value of the environment's step method
    ```

* **Terminal states**: `{3, 7}` corresponds to goal (G) and fire (F) respectively, which means an episode ends when the agent reaches either states.

    ```python
    import gym
    env = gym.make('MDPGridworld-v0')
    
    action = 0
    next_state, reward, terminal, info = env.step(action)
    # terminal is a return value of the environment's step method
    ```

* **Transition Probabilities**: This provides you access to the transition probability, that taking action `a` at current state `s`, what is the probabilty of reaching next state `s'`

    ```python
    import gym
    env = gym.make('MDPGridworld-v0')
    
    state = 8
    action = 0 # North
    print env.P[state][action]
    # [(1.0, 4, -3, False)]
    # [(transition probability, next_state, reward, terminal)]
    ```
