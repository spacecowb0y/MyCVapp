require 'rubygems'
require 'sinatra'
require 'haml'
require 'gravatar'

load 'db/config.rb'

get '/' do
  haml :index
end

#
# SIGN UP
#
get '/signup' do
  haml :signup
end

post '/signup' do
  @user = User.new(:email=> params[:email], :password => params[:password], :username => params[:username], :created_at => Time.now)
  if @user.save
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
   haml :user_profile
end

#
# USER
#
get '/user/:id' do
  @user = User.get(params[:id])
  if @user
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
   @user.update(:fullname => params[:fullname], :email => params[:email], :country => params[:country], :gender => params[:gender], :website => params[:website], :twitter_username => params[:twitter_username], :facebook_username => params[:facebook_username])
   redirect "/user/#{@user.id}"
end