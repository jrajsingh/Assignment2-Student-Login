require 'sinatra'
require 'sinatra/reloader'
require 'erb'

require_relative 'implemented_classes'

not_found do
  erb :not_found, :layout => :not_found_layout
end