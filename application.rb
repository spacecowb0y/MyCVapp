require 'rubygems'
require 'sinatra'
require 'haml'
require 'gravatar'
require 'digest/md5'

load 'environment.rb'

enable :sessions

get '/' do
  @counter = Resume.count
  haml :index
end

#
# SIGN UP
#
get '/signup' do
  haml :signup
end

post '/signup' do
  @user = User.new(params[:user])
  if @user.save
    @user.update(:password => Digest::MD5.hexdigest(@user.password))
    redirect "/user/#{@user.id}"
  else
    redirect '/'
  end
end

#
# LOGIN
#
get '/login' do
    haml :login
end

post '/login' do
  @user = User.first(:username => params[:username], :password => Digest::MD5.hexdigest(params[:password]))
  if @user
    session[:logged] = @user.username
    redirect "/user/#{@user.id}"
  else
    haml :login
  end
end

#
# USER
#
get '/user/:id' do
  @user = User.get(params[:id])
  if @user
    auth
    haml :user_profile
  else
    redirect '/'
  end
end

get '/user/:id/settings' do
  @user = User.get(params[:id])
  if @user
    haml :user_settings
  else
    redirect '/'
  end
end

post '/user/:id/settings' do
   @user = User.get(params[:id])
   @user.update(params[:user])
   redirect "/user/#{@user.id}"
end

helpers do
  def is_user?
    session[:logged] == @user.username
  end
  def auth
    redirect "/" unless is_user?
  end
end
