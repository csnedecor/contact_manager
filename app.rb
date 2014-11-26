require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require 'pry'

require_relative 'models/contact'

def contacts
  @contacts = Contact.all
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

def search_contacts
  @limit = 5
  if params[:search]
    @contacts = Contact.where("first_name ILIKE ? OR last_name ILIKE ?",
    params[:search], params[:search]).limit(@limit).offset(@limit*@page -@limit)
  else
    @contacts = Contact.limit(@limit).offset(@limit * @page - @limit)
  end
end

get '/' do
  @search = params[:search]
  if params[:page]
    @page = params[:page].to_i
  else
    @page = 1
  end
  search_contacts
  increment_page
  erb :index
end

get '/contacts/:id' do
  contacts
  @id = params[:id].to_i
  @contact = @contacts.find(@id)
  erb :'/contacts/show'
end
