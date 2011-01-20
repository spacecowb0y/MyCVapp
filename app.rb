require 'rubygems'
require 'sinatra'
require 'haml'
require 'dm-core'
require 'dm-migrations'
require 'dm-validations'
require 'dm-timestamps'
require 'digest/md5'
require 'linkedin'

$consumer_key     = ""
$consumer_secret  = ""

enable  :sessions, :logging

DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, 'mysql://localhost/mycvapp')

load 'lib/helpers.rb'
load 'lib/frontend.rb'
load 'lib/users.rb'
load 'lib/auth.rb'

DataMapper.finalize
DataMapper.auto_upgrade!