module LinkHelper
  def root_path
    '/'
  end

  def blog_path
    '/blog'
  end

  def memo_path
    '/protected/memo'
  end

  def show_memo_folder_path(id)
    "/protected/memo/folders/show/#{id}"
  end

  def update_memo_folder_path(id = nil)
    return '/protected/memo/folders/update' if id.nil?
    "/protected/memo/folders/update/#{id}"
  end

  def new_memo_folder_path
    '/protected/memo/folders/new'
  end

  def destroy_memo_folder_path
    '/protected/memo/folders/destroy'
  end


  def new_memo_note_path(folder_id)
    "/protected/memo/#{folder_id}/notes/new"
  end

  def update_memo_note_path(id = nil)
    return '/protected/memo/notes/update' if id.nil?
    "/protected/memo/notes/update/#{id}"
  end

  def destroy_memo_note_path
    "/protected/memo/notes/destroy"
  end

  def signin_path
    '/signin'
  end

  def signout_path
    '/signout'
  end
end