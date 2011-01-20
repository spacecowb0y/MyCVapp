class User
  include DataMapper::Resource
  property :id,                 Serial
  property :email,              String, :required => true, :unique => true, :format => :email_address
  property :password,           String, :required => true, :length => 32
  property :username,           String, :required => true, :unique => true
  property :fullname,           String
  property :country,            String
  property :birthday,           String
  property :gender,             String
  property :website,            String
  property :twitter_username,   String
  property :facebook_username,  String
  property :created_at,         DateTime
  property :updated_at,         DateTime
end

get '/signup' do
  haml :'frontend/signup', :layout => :'frontend/template'
end

post '/signup' do
  @user = User.new(encript(params[:user]))
  if @user.save
    log_in(@user)
    redirect "/user/#{@user.id}"
  else
    "Error"
  end
end

get '/user/:id' do
  @user = User.get(params[:id])
  redirect "/" unless user_is_logged?
  haml :'users/profile', :layout => :'users/template'
end

get '/user/:id/settings' do
  @user = User.get(params[:id])
  redirect "/" unless user_is_logged?
  haml :'users/settings', :layout => :'users/template'
end

get '/user/:id/auth/callback' do
  oauth_linkedin_callback
  haml :'resumes/index'
end