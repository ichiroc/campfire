App.room = App.cable.subscriptions.create "RoomChannel", # RoomChannel のクラスとここで紐づけられる(購読する)
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    alert data['message']

  speak: (message)->
    @perform 'speak', message: message

  greeting: (message)->
    @perform 'greeting', message: "greeting! #{message}"
