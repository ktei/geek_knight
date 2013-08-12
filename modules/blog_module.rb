class App < Sinatra::Base
  get '/blog/?' do
    @title = 'Blog'
    haml :'blog/index'
  end
end