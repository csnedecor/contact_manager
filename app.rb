require 'sinatra'
require "sinatra/activerecord"

require_relative 'models/contact'

get '/' do
  @contacts = Contact.all
  erb :index
end
