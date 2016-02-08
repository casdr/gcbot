username = process.env.HUBOT_NS_USERNAME
password = process.env.HUBOT_NS_PASSWORD
url = "http://#{username}:#{password}@webservices.ns.nl/ns-api-storingen?station=DTC&actual=true"

stations = [
	"Arnhem"
	"Westervoort"
	"Duiven"
	"Zevenaar"
	"Didam"
	"Wehl"
	"Doetinchem"
	"Gaanderen"
	"Terborg"
	"Varsseveld"
	"Aalten"
	"Winterswijk"
]

parseXml = require('xml2js').parseString
_ = require 'lodash'

module.exports = (robot) ->

	robot.hear /^!trein/, (res) ->
		res.reply "Eens zien of er storingen zijn...."
		robot.http(url)
		.get() (err, apires, body) ->
			parseXml body, (err, result) ->
				all = _.union result.Storingen.Ongepland[0].Storing, result.Storingen.Gepland[0].Storing
				final = ""
				all.forEach (e) ->
					if not e.Traject? or new RegExp(stations.join '|').test e.Traject[0]
						final = "#{final}\n *#{e.id[0]}*"
						if e.Traject?
							final = "#{final}\n Traject: #{e.Traject[0]}"
						if e.Periode?
							final = "#{final}\n Periode: #{e.Periode[0]}"
						if e.Vertraging?
							final = "#{final}\n Vertraging: #{e.Vertraging[0]}"
						if e.Oorzaak?
							final = "#{final}\n Oorzaak: #{e.Oorzaak[0]}"
						if e.Reden?
							final = "#{final}\n Reden: #{e.Reden[0]}"
				if final.length > 0
					res.send "Het lijkt erop van wel :(#{final}"
				else
					res.send "Wow, er zijn gewoon GEEN storingen tussen Arnhem en Winterswijk! :O"
