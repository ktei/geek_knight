class App < Sinatra::Base  
  get '/protected/memo/?' do
    @title = 'Memo'
    @folders = MemoFolder.order("name").all
    haml :'memo/index'
  end

  get '/protected/memo/folders/new/?' do
    @title = 'New folder'
    @folder = MemoFolder.new
    haml :'memo/folders/new'
  end

  post '/protected/memo/folders/?' do
    @title = 'New folder'
    @folder = MemoFolder.new(params[:folder])
    if @folder.valid?
      @folder.save
      redirect memo_path
    else
      haml :'memo/folders/new'
    end
  end

  get '/protected/memo/folders/:id/?' do
    @folder = MemoFolder.find(params[:id])
    @title = @folder.name
    haml :'memo/folders/show'
  end

  get '/protected/memo/:folder_id/notes/new/?' do
    @folder = MemoFolder.find(params[:folder_id])
    @note = MemoNote.new
    @title = 'Create note'
    haml :'memo/notes/new'
  end

  post '/protected/memo/:folder_id/notes/?' do
    @title = 'Create note'
    @folder = MemoFolder.find(params[:folder_id])
    @note = @folder.memo_notes.build(params[:note])
    if @note.valid?
      @note.save
      redirect memo_folders_path params[:folder_id]
    else
      @folder = MemoFolder.find(params[:folder_id])
      haml :'memo/notes/new'
    end
  end

  post '/protected/memo/note/destroy/:id/?' do
    @note = MemoNote.find(params[:id])
    @note.destroy
    redirect memo_folders_path(@note.memo_folder.id)
  end

end