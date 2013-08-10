require "sinatra/base"
require 'sinatra/reloader'

class App < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    @title = 'Welcome!'
    erb :index
  end
end