require './parse.rb'
require 'sinatra'

helpers do
  def show(room)
    @room=$rooms.select{|r|r.name==room.to_s}[0]
    erb :room
  end
end

get '/' do
  show(:welcome)
end
get '/:room' do
  show(params[:room])
end

run Sinatra::Application
