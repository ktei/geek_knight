require "sinatra/base"
require 'haml'
require 'sinatra/reloader'
require "sinatra/config_file"
require 'sinatra/partial'
require 'active_record'
require "sinatra/activerecord"
require 'rack-flash'

# require helpers
Dir["./helpers/*.rb"].each { |file| require file }
Dir["./extensions/*.rb"].each { |file| require file }
Dir["./models/*.rb"].each { |file| require file }

class App < Sinatra::Base

  # configurations
  configure :development do
    register Sinatra::Reloader
  end
  register Sinatra::ActiveRecordExtension, Sinatra::ConfigFile, Sinatra::Partial
  config_file 'config/global.yml'

  # sinatra partial template engine settings
  enable :partial_underscores

  # hide exception details for users and show them friendly error page
  configure :production do
    set :raise_errors, false
    set :show_exceptions, false
  end

  # session and flash
  enable :sessions
  use Rack::Flash

  # register helpers
  helpers LinkHelper, HamlHelper, SessionsHelper

  # filter
  before '/protected/*' do
    authenticate!
  end

  get '/' do
    @title = 'Welcome!'
    haml :index
  end

  not_found do
    haml :not_found
  end

  error do
    haml :error
  end

  # include all modules
  Dir["./modules/*.rb"].each { |file| require file }

  private
    def authenticate!
      deny_access unless signed_in?
    end

end