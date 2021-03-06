noflo = require 'noflo'

buildContext = ->
  ctx =
    state: ''

exports.getComponent = ->
  c = new noflo.Component
  c.inPorts.add 'start',
    datatype: 'bang'
  c.outPorts.add 'out',
    datatype: 'object'

  noflo.helpers.WirePattern c,
    in: 'start'
    out: 'out'
    async: true
  , (data, groups, out, callback) ->
    ctx = buildContext()
    ctx.state = 'ok'
    out.send ctx
    do callback
