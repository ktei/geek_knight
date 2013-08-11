module SessionsHelper
  def sign_in(username)
    session[:user] = username
  end

  def sign_out
    session[:user] = nil
  end

  def signed_in?
    !session[:user].nil?
  end

  def deny_access
    store_location
    flash[:notice] = "You need to sign in to access this page."
    redirect signin_path
  end

  def redirect_back_or(default)
    redirect(session[:return_to] || default)
    clear_return_to
  end

  private
    def store_location
      session[:return_to] = request.fullpath
    end

    def clear_return_to
      session[:return_to] = nil
    end
end