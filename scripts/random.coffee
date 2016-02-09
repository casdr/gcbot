module.exports = (robot) ->

  robot.hear /dickhead/, (res) ->
    res.send "https://www.youtube.com/watch?v=my7sxZ0KfHU"

  euros = ['Munnies!', '500 geld', 'Pas maar op voordat @berendjan.linde boos wordt :O', 'Euro\'s zijn awesome! :D']
  robot.hear /euro's/i, (res) ->
    res.send res.random euros
  robot.hear /^o\//i, (res) ->
    res.send "\\o"
  lulz = ['lol', 'rofl', 'lmao', 'lulz', 'http://images-cdn.9gag.com/photo/5541011_700b.jpg', 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Roflcopter.gif/220px-Roflcopter.gif', 'https://lh3.googleusercontent.com/-em4ioakaSHA/VVRWg2RPVdI/AAAAAAAAAFE/svWqgOk0cZQ/w736-h736/Lol-face.gif']

  # robot.hear /lol/i, (res) ->
  #   res.send res.random lulz

  robot.hear /^wat$/i, (res) ->
    res.send "http://i.imgur.com/AxtzziK.gif"
  annoyIntervalId = null

  # robot.respond /annoy me/, (res) ->
  #   if annoyIntervalId
  #     res.send "AAAAAAAAAAAEEEEEEEEEEEEEEEEEEEEEEEEIIIIIIIIHHHHHHHHHH"
  #     return
  #
  #   res.send "Hey, want to hear the most annoying sound in the world?"
  #   annoyIntervalId = setInterval () ->
  #     res.send "AAAAAAAAAAAEEEEEEEEEEEEEEEEEEEEEEEEIIIIIIIIHHHHHHHHHH"
  #   , 1000
  #
  # robot.respond /unannoy me/, (res) ->
  #   if annoyIntervalId
  #     res.send "GUYS, GUYS, GUYS!"
  #     clearInterval(annoyIntervalId)
  #     annoyIntervalId = null
  #   else
  #     res.send "Not annoying you right now, am I?"

  robot.respond /have a soda/i, (res) ->
    # Get number of sodas had (coerced to a number).
    sodasHad = robot.brain.get('totalSodas') * 1 or 0

    if sodasHad > 4
      res.reply "I'm too fizzy.."

    else
      res.reply 'Sure!'

      robot.brain.set 'totalSodas', sodasHad+1

  robot.respond /sleep it off/i, (res) ->
    robot.brain.set 'totalSodas', 0
    res.reply 'zzzzz'
