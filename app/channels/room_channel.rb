# coding: utf-8
class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel" # room_channel を broadcasting と呼ぶ。 broadcast するときにどこへ送信するかをこの文字列で指定する
    stream_from "greeting_channel" # 試しに独自に設定
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def greeting data
    # JS側で perform 'greeting' で呼べるようになる
    ActionCable.server.broadcast 'greeting_channel', message: data['message']
  end

  def speak data
    Message.create! content: data['message']
  end
end
