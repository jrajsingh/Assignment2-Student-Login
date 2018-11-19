require "sinatra"
require "sinatra/reloader" if development?
require 'erb'
require_relative 'comment'
require_relative 'student'

require_relative 'implemented_classes'

configure do
  enable :sessions
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
      redirect '/home'
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

# get '/comment' do
#   @my_comment = Comment.all
#   erb :comment, :layout => :comment_layout
# end

get '/students' do

end

not_found do
  erb :not_found, :layout => :not_found_layout
end
