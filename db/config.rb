require 'dm-core'
require 'dm-migrations'
require 'dm-validations'
require 'dm-timestamps'

DataMapper::setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/db/test.db")

class User
  include DataMapper::Resource
  property :id,                 Serial
  property :email,              String, :required => true, :unique => true, :format => :email_address
  property :password,           String, :required => true
  property :username,           String, :required => true, :unique => true, :length => 1..30
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

class Resume
  include DataMapper::Resource
  property :id,                 Serial
  property :created_at,         DateTime
  property :updated_at,         DateTime
end

DataMapper.finalize
DataMapper.auto_upgrade!