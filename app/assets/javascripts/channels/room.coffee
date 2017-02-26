App.room = App.cable.subscriptions.create "RoomChannel", # RoomChannel のクラスとここで紐づけられる(購読する)
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $('#messages').append data['message']

  speak: (message)->
    @perform 'speak', message: message

  greeting: (message)->
    @perform 'greeting', message: "greeting! #{message}"

$(document).on 'keypress', '[data-behavior~=room_speaker]',(event)->
  if event.keyCode is 13
    App.room.speak event.target.value
    event.target.value = ''
    event.preventDefault()
