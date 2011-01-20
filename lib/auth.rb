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

get '/login' do
  haml :'frontend/login', :layout => :'frontend/template'
end

post '/login' do
  @user = User.first(encript(params[:user]))
  if @user
    log_in(@user)
    redirect "/user/#{@user.id}"
  else
    haml :'frontend/login', :layout => :'frontend/template'
  end
end

get '/user/:id/logout' do
  log_out
  redirect "/"
end

get '/user/:id/auth' do
  oauth_linkedin
end