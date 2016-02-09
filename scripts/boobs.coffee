module.exports = (robot) ->
  robot.respond /boobs/i, (msg) ->
    if msg.envelope.room.indexOf '-' > -1
      msg.reply "Sorry, I'm not allowed to do that here."
    else
      number = Math.floor(Math.random() * 3000)
      msg.http("http://api.oboobs.ru/boobs/" + number + "/1/rank/")
        .get() (err, res, body) ->
          response = JSON.parse(body)
          msg.send "http://media.oboobs.ru/" + el.preview for el in response
