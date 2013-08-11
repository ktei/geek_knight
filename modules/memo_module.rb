class App < Sinatra::Base  
  get '/protected/memo/?' do
    @title = 'Memo'
    @folders = MemoFolder.order("name").all
    erb :'memo/index'
  end

  get '/protected/memo/folders/new/?' do
    @title = 'New folder'
    @folder = MemoFolder.new
    erb :'memo/folders/new'
  end

  post '/protected/memo/folders/?' do
    @title = 'New folder'
    @folder = MemoFolder.new(params)
    if @folder.valid?
      @folder.save
      redirect memo_path
    else
      erb :'memo/folders/new'
    end
  end

  get '/protected/memo/folders/:id' do
    @folder = MemoFolder.find(params[:id])
    erb :'memo/folders/show'
  end
end