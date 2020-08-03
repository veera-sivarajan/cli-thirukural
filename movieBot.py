import discord
import sys
import random
import configparser
#from movieData import *

config = configparser.ConfigParser()
config.read('/home/veera/Projects/DiscordBot/config.ini')
channelId = config['MemeBot']['TestChannelId']
clientId = config['MemeBot']['ClientId']
silviaId = config['MemeBot']['SilviaId']

"""
movies = []
for title in sys.stdin:
  #print(title)
  while(not title.endswith('"')):
    #print("Inside loop")
    title = title[:-1]
    #print("Appending " + title)
  movies.append(title)
print(len(movies))
message = processData(movies)
print(message)
"""
message = sys.stdin.read()

client = discord.Client()
@client.event
async def on_ready():
  print('Logged in as {0.user}'.format(client))
  #await client.get_channel(int(channelId)).send(message)
  await client.get_channel(int(channelId)).send(message)
  #await client.get_channel(int(channelId)).send(movies)
  #await client.get_user(silviaId).send("I'm currently in the womb of my creater. Please wait for my birth")
  #sys.exit()

client.run(clientId)  
client.logout()
