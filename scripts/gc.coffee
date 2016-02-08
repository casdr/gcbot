getGroup = (res) ->
  splitted = res.envelope.room.split('-')
  group = splitted[0].toUpperCase()

module.exports = (robot) ->



  robot.respond /debug/i, (res) ->
    console.log res.envelope.room

  robot.respond /group/, (res) ->
    group = getGroup res
    res.reply "You're in the group #{group}"
