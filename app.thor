class App < Thor                                                 
  map "-L" => :list                                              

  desc "server", "Runs the application"           
  def server(port = "4567")
    puts "Running MyCVapp in port #{port}"
    `shotgun -p #{port} application.rb`
  end

end
