class App < Sinatra::Base

  get '/signin/?' do
    @title = 'Sign in'
    erb :signin
  end

  post '/signin/?' do
    if params[:password] == 'blizzard'
      sign_in('ktei')
      redirect_back_or root_path
    else
      flash.now[:error] = "The password is wrong. You need to do better."
      erb :signin
    end
  end

  get '/signout/?' do
    sign_out
    redirect root_path
  end
end