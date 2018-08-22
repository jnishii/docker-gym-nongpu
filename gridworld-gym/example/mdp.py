# import gym # Uncomment if using gym.make
import time
import sys
sys.path.append("../")
from envs.mdp_gridworld import MDPGridworldEnv

# Uncomment if you added MDPGridworld as a new gym environment
# env = gym.make('MDPGridworld-v0')
# You have to import MDPGridworldEnv properly in order for environment to work
env = MDPGridworldEnv()

# prints out that both states and actions are discrete and their valid values
print(env.observation_space)
print(env.action_space)

# to access the values
print(env.observation_space.n) # env.nS
print(env.action_space.n) # env.nA

# added delay here so you can view output above
time.sleep(2)

for i_episode in range(20):
    obs = env.reset()
    for t in range(100):
        env.render(mode='ansi')
        # time.sleep(.5) # uncomment to slow down the simulation
        action = env.action_space.sample() # act randomly
        obs2, reward, terminal, _ = env.step(action)
        if terminal:
            env.render()
            print("Episode finished after {} timesteps".format(t+1))
            break
