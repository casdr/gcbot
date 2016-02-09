Wolfram = require('wolfram').createClient(process.env.HUBOT_WOLFRAM_APPID)

random_not_sure = [
  "Hmm... not sure"
  "I don't know that"
  "STOP ASKING ME NO SURE :("
  "I'm stupid, sorry"
]

module.exports = (robot) ->
  robot.hear /^!q (.*)$/i, (msg) ->
    #console.log msg.match
    Wolfram.query msg.match[1], (e, result) ->
      # console.log result
      if !result or result.length == 0
        msg.reply 'Hmm...not sure'
      else if result[1]['subpods'][0]['value'].length > 0
        msg.reply result[1]['subpods'][0]['value']
      else if result[1]['subpods'][0]['image'].length > 0
        msg.reply result[1]['subpods'][0]['image']
      else
        msg.reply msg.random random_not_sure
