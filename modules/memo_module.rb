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
    @folder = MemoFolder.new(params[:folder])
    if @folder.valid?
      @folder.save
      redirect memo_path
    else
      erb :'memo/folders/new'
    end
  end

  get '/protected/memo/folders/:id/?' do
    @folder = MemoFolder.find(params[:id])
    @title = @folder.name
    erb :'memo/folders/show'
  end

  get '/protected/memo/:folder_id/notes/new/?' do
    @folder = MemoFolder.find(params[:folder_id])
    @note = MemoNote.new
    @title = 'Create note'
    erb :'memo/notes/new'
  end

  post '/protected/memo/:folder_id/notes/?' do
    @title = 'Create note'
    @note = MemoNote.new(params[:note].merge({ :memo_folder_id => params[:folder_id] }))
    if @note.valid?
      @note.save
      redirect memo_folders_path params[:folder_id]
    else
      @folder = MemoFolder.find(params[:folder_id])
      erb :'memo/notes/new'
    end
  end

end