class App < Thor                                                 
  map "-L" => :list  
  desc "server", "Runs the application"           
  def server(port = "4567")
    puts "Running MyCVapp in port #{port}"
    exec "shotgun -I. -p #{port} app.rb"
  end
end