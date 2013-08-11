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

  def memo_folders_path(id = nil)
    return '/protected/memo/folders' if id.nil?
    "/protected/memo/folders/#{id}"
  end

  def new_memo_folder_path
    '/protected/memo/folders/new'
  end

  def signin_path
    '/signin'
  end

  def signout_path
    '/signout'
  end
end