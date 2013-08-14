class App < Sinatra::Base
  # display memo folders  
  get '/protected/memo/?' do
    @title = 'Memo'
    @folders = MemoFolder.order("name").all
    haml :'memo/index'
  end

  # show memo folder
  get '/protected/memo/folders/show/:id/?' do
    @folder = MemoFolder.find(params[:id])
    @title = @folder.name
    haml :'memo/folders/show'
  end

  # new memo folder
  get '/protected/memo/folders/new/?' do
    @title = 'New folder'
    @folder = MemoFolder.new
    haml :'memo/folders/new'
  end

  # create memo folder
  post '/protected/memo/folders/new/?' do
    @folder = MemoFolder.new(params[:folder])
    if @folder.valid? and @folder.save
      flash[:success] = "The folder has been created successfully."
      redirect memo_path
    else
      @title = 'New folder'
      haml :'memo/folders/new'
    end
  end

  # edit memo folder
  get '/protected/memo/folders/update/:id/?' do
    @title = 'Edit folder'
    @folder = MemoFolder.find(params[:id])
    haml :'memo/folders/edit'
  end

  # update memo folder
  post '/protected/memo/folders/update/?' do
    @folder = MemoFolder.find(params[:id])
    if @folder.valid? and @folder.update_attributes(params[:folder])
      flash[:success] = "The folder has been saved successfully."
      redirect memo_path
    else
      @title = 'Edit folder'
      haml :'memo/folders/edit'
    end
  end

  # delete memo folder
  post "/protected/memo/folders/destroy/?" do
    @folder = MemoFolder.find(params[:id])
    @folder.destroy
    flash[:success] = "Folder '#{@folder.name}' has been deleted."
    redirect memo_path
  end

  # new memo note
  get '/protected/memo/:folder_id/notes/new/?' do
    @folder = MemoFolder.find(params[:folder_id])
    @note = MemoNote.new
    @title = 'Create note'
    haml :'memo/notes/new'
  end

  # create memo note
  post '/protected/memo/:folder_id/notes/new/?' do
    @title = 'Create note'
    @folder = MemoFolder.find(params[:folder_id])
    @note = @folder.memo_notes.build(params[:note])
    if @note.valid? and @note.save
      flash[:success] = "The note has been created successfully."
      redirect show_memo_folder_path params[:folder_id]
    else
      @folder = MemoFolder.find(params[:folder_id])
      haml :'memo/notes/new'
    end
  end

  # edit memo note
  get '/protected/memo/notes/update/:id/?' do
    @title = 'Edit note'
    @note = MemoNote.find(params[:id])
    @folder = @note.memo_folder
    haml :'memo/notes/edit'
  end

  # update note
  post '/protected/memo/notes/update/?' do
    @note = MemoNote.find(params[:id])
    @folder = @note.memo_folder
    if @note.valid? and @note.update_attributes(params[:note])
      flash[:success] = "The note has been saved successfully."
      redirect show_memo_folder_path @folder.id
    else
      @title = 'Edit note'
      haml :'memo/notes/edit'
    end
  end

  # delete memo note
  post '/protected/memo/notes/destroy/?' do
    @note = MemoNote.find(params[:id])
    @note.destroy
    flash[:success] = "Note '#{@note.name}' has been deleted."
    redirect show_memo_folder_path(@note.memo_folder.id)
  end

end