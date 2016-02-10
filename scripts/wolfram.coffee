Wolfram = require('wolfram').createClient(process.env.HUBOT_WOLFRAM_APPID)

random_not_sure = [
  "Hmm... not sure"
  "I don't know that"
  "STOP ASKING ME NO SURE :("
  "I'm stupid, sorry"
]

module.exports = (robot) ->
  found = false
  robot.hear /^!q (.*)$/i, (msg) ->
    #console.log msg.match
    Wolfram.query msg.match[1], (e, result) ->
      # console.log result
      if not result or result.length == 0
        msg.reply msg.random random_not_sure
      else
        if result[1]['subpods'][0]['value'].length > 0
          found = true
          msg.reply result[1]['subpods'][0]['value']
        if result[1]['subpods'][0]['image'].length > 0
          found = true
          msg.reply result[1]['subpods'][0]['image']
      if not found
        msg.reply msg.random random_not_sure
