helpers do
  def encript(hash)
    hash["password"] = Digest::MD5.hexdigest(hash["password"])
    return hash
  end
  
  def log_in(user)
    session["user_id"] = user.id
  end
  
  def log_out
    session["user_id"] = nil
  end
  
  def user_is_logged?
    !session["user_id"].nil?
  end
  
  def is_user(user)
    session["user_id"] == user.id
  end
  
  def auth!
    redirect "/" unless current_user
  end
  
  def current_user
    @current_user ||= User.get(session["user_id"]) if user_is_logged?
  end
  
  def oauth_linkedin
    client = LinkedIn::Client.new($consumer_key, $consumer_secret)
    request_token = client.request_token(:oauth_callback => "http://#{request.host_with_port}/user/#{params[:id]}/auth/callback")
    session[:rtoken] = request_token.token
    session[:rsecret] = request_token.secret

    redirect client.request_token.authorize_url
  end
  
  def oauth_linkedin_callback
    client = LinkedIn::Client.new($consumer_key, $consumer_secret)
    if session[:atoken].nil?
      pin = params[:oauth_verifier]
      atoken, asecret = client.authorize_from_request(session[:rtoken], session[:rsecret], pin)
      session[:atoken] = atoken
      session[:asecret] = asecret
      else
        client.authorize_from_access(session[:atoken], session[:asecret])
    end
    @profile = client.profile
  end
end