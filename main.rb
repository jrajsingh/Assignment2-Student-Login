require "sinatra"
require "sinatra/reloader"
require 'erb'
require_relative 'comment'
require_relative 'student'

configure do
  enable :sessions
end
configure :development do
  DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/databases.db")
end
configure :production do
  DataMapper.setup(:default, "postgres://#{Dir.pwd}/production.db")
end

user_login = {student: 'student', admin: 'admin'}

get '/' do
  redirect '/login'
end

get '/login' do
  erb :login, :layout => :loginlayout
end

post '/login' do
  @username = params[:username]
  @password = params[:password]
  if user_login.key?(@username.to_sym)
    if user_login[@username.to_sym] == @password
      redirect '/students'
    else
      redirect '/login'
    end
  else
    redirect '/login'
  end
end

get '/video' do
  erb :video, :layout => :video_layout
end

get '/logout' do
  redirect '/login'
end


not_found do
  erb :not_found, :layout => :not_found_layout
end
