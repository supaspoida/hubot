module.exports = (robot) ->
  robot.respond /name( me)? (.*)/i, (msg) ->
    words = encodeURI msg.match[2]
    msg.http("http://name-me.herokuapp.com/permute/#{words}")
      .get() (err, res, body) ->
        msg.send body

  robot.respond /similar name( me)? (.*)/i, (msg) ->
    words = encodeURI msg.match[2]
    msg.http("http://name-me.herokuapp.com/similar/#{words}")
      .get() (err, res, body) ->
        msg.send body

  robot.respond /animal name( me)?/i, (msg) ->
    msg.http("http://name-me.herokuapp.com/animal")
      .get() (err, res, body) ->
        msg.send body
