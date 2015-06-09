# Description:
#   Praise
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot high five @hubot for being awesome
#   hubot high five @hubot
#   hubot praise @hubot for just being there when i need her
#   hubot praise @hubot
#   hubot who praised
#
# Author:
#   Marthyn (@Marthyn)

images = require './data/highfivegifs.json'

module.exports = (robot) ->
  robot.respond /high five ([^ ]*)( (.*))?/i, (msg) ->
    if praiseUser(msg)
      updatePraises(msg, robot)
  robot.respond /praise ([^ ]*)( (.*))?/i, (msg) ->
    if praiseUser(msg)
      updatePraises(msg, robot)
  robot.respond /who praised/i, (msg) ->
    getPraises(msg, robot)


praiseUser = (msg) ->
  user = msg.match[1].replace(/@?(.*)/, '$1')
  message = msg.match[3]
  current_user = msg.message.user.name
  if user == current_user
    msg.send "you can’t high five yourself. that’s just clapping"
    return false
  else
    highfive = msg.random images
    praise = msg.random praises(user)
    msg.send highfive
    msg.send "@#{current_user} high fives @#{user}.#{if message then " #{message}" else ""}"
    msg.send praise
    return true

praises = (user) ->
  return [
    "Keep on rocking, @#{user}!",
    "Keep up the great work, @#{user}!",
    "You're awesome, @#{user}!",
    "You're doing good work, @#{user}!",
    "You're the best, @#{user}",
    "Never stop doing what you do @#{user}, it's paying off!",
    "Thanks so much, you've been amazing @#{user}!",
    "How many people does it take to change a lightbulb? Nvm @#{user} changed 100 before you even responded!",
    "Your work is phenomenal, @#{user}!",
    "You are changing lives with your work, @#{user}!",
    "The world is a better place with you around, @#{user}",
    "Is there anything you can't do @#{user}? Wow!"
  ]

updatePraises = (msg, robot) ->
  currentPraises = robot.brain.get('praises')
  today = new Date().toLocaleString()

  if !currentPraises || currentPraises.length == 0
    currentPraises = []

  currentPraises.push(
    {
      receiver: msg.match[1],
      sender: msg.message.user.name,
      message: msg.match[3],
      date: today
    }
  )

  robot.brain.set('praises', currentPraises)
  robot.brain.save

getPraises = (msg, robot) ->
  msg.send "ALL PRAISES EVER"
  message = ""
  allPraises = robot.brain.get('praises')
  if allPraises
    for praise in allPraises
      message += "@#{praise.sender} sent a praise for #{if praise.message then " #{praise.message}" else "awesomeness"} to @#{praise.receiver} on #{praise.date} \n\r";
    msg.send message
  else
    msg.send "none"
