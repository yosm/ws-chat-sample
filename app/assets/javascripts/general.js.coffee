ws = null

$(document).ready ->
  $('#chat').click(send)
  connect()

connect = ->
  return if ws
  ws = new WebSocket("ws://localhost:8080")
  ws.onmessage = (msg) ->
    trace(msg)
  ws.onclose = ->
    ws = null
    log("ws closed")
  ws.onopen = ->
    log('ws connected')


log = (message) ->
  trace("[log] " + message)

trace = (message) ->
  mes_div = $('<div />').html(message)
  $('div#chat').prepend(mes_div)

send = (message) ->
  ws.send(message)