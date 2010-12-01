class App < Thor                                                 
  map "-L" => :list
                                                
  @@environment_file = "#{Dir.pwd}/environment.rb"
  
  desc "server", "Runs the application"           
  def server(port = "4567")
    puts "Running MyCVapp in port #{port}"
    exec "shotgun -I. -p #{port} application.rb"
  end
  
  desc "console", "Runs a console with the environment info"
  def console
    exec "irb -r #{@@environment_file}"
  end

end
