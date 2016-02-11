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
      final = ""
      # console.log result
      if not result or result.length == 0
        msg.reply msg.random random_not_sure
      else
        for res in result
          for sub in res['subpods']
            found = false
            if sub['value'].length > 0
              found = true
              final = "#{final}\n\n#{sub['value']}"
            if sub['image'].length > 0 and found is false
              found = true
              final = "#{final}\n\n#{sub['image']}"
        msg.reply "#{final}"
      if not found
        msg.reply msg.random random_not_sure
