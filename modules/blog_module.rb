class App < Sinatra::Base
  get '/blog/?' do
    @title = 'Blog'
    erb :'blog/index'
  end
end