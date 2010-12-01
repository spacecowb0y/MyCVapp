Installation instructions.
==========================

Just do: 

  `bundle install`
  
(You have bundler, right?)

Running instructions
====================

You can just do `ruby application.rb` if you need to impress the girls quickly. But the problem is that you have to restart the server every time you make a change to the application's code, which isn't fun. To make it easy for you (so you can impress them as quickly as before), we pimped you a thor script. Just type:

  `thor app:server`
  
The application will run on port 4567.

Need to change port number? Easy:

  `thor app:server 8080`

Now it will run on port 8080.