require 'sinatra'
require 'sinatra/reloader'
require 'active_record'


ActiveRecord::Base.establish_connection(
  "adapter" => "sqlite3",
  "database" => "./bbs.db"
)

helpers do
  include Rack::Utils
  alias_method :h, :escape_html
end

class Comment < ActiveRecord::Base
end

get '/' do
  @comments = Comment.order("id desc").all
  erb :index
end

post '/new' do
  # @comments = Comment.order("id desc").all
  Comment.create({:body => params[:body]})
  # erb :index
  redict '/'
end

post '/delete' do
  Comment.find(params[:id]).destroy
end
