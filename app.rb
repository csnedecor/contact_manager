require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require 'pry'

require_relative 'models/contact'

def contacts
  @contacts = Contact.all
end

def limited_contacts
    @limit = 5
    @contacts = Contact.limit(@limit).offset(@limit * @page - @limit)
end

def increment_page
  if @page > 1
    @back = @page-1
  else
    @back = 1
  end
  if @page < 1
    @next = 2
  else
    @next = @page + 1
  end
end

get '/' do
  if params[:page]
    @page = params[:page].to_i
  else
    @page = 1
  end
  increment_page
  limited_contacts
  erb :index
end

get '/contacts/:id' do
  contacts
  @id = params[:id].to_i
  @contact = @contacts.find(@id)
  erb :'/contacts/show'
end
