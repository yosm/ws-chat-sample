ws = null

$(document).ready ->
  connect()
  $('#chat_button').click(send)

connect = ->
  return if ws
  ws = new WebSocket("ws://localhost:8080")
  ws.onmessage = (msg) ->
    json = $.parseJSON(msg.data)
    trace(json)
  ws.onclose = ->
    ws = null
    log("ws closed")
  ws.onopen = ->
    log('ws connected')

log = (message) ->
  trace("[log] " + message)

trace = (message) ->
  mes_div = $('<div />').html(message)
  $('div#msg').prepend(mes_div)

send = ->
  ws.send($('#chat')[0].value)
  $('#chat')[0].value = ""