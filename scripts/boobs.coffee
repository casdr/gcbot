module.exports = (robot) ->
  robot.respond /boobs/i, (msg) ->
    number = Math.floor(Math.random() * 3000)
    msg.http("http://api.oboobs.ru/boobs/" + number + "/1/rank/")
      .get() (err, res, body) ->
        response = JSON.parse(body)
        msg.send "http://media.oboobs.ru/" + el.preview for el in response


  robot.respond /boobes( (\d+))?/i, (msg) ->
    number = Math.floor(Math.random() * 3000)
    ct = msg.match[2] || 3
    ct = 3 if ct > 10
    msg.http("http://api.oboobs.ru/boobs/" + number + "/" + ct + "/rank/")
      .get() (err, res, body) ->
        response = JSON.parse(body)
        msg.send "http://media.oboobs.ru/" + el.preview for el in response
