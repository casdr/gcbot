module.exports = (robot) ->
  robot.hear /^make me a sandwich/i, (res) ->
    res.reply 'Make it yourself'
  robot.hear /^sudo make me a sandwich/i, (res) ->
    res.reply 'Sure!'
