require 'sinatra'
require 'sinatra/reloader'
require 'erb'

USER = {:jus => 'test123', :test1 => 'test1', :test2 => 'test2', :test3 => 'test3'}

get '/login' do
	erb :login
end

post '/login' do
	@username = params[:username]
	@password = params[:password]
	if USER.has_key?(@username.to_sym)
		if USER[@username.to_sym] == @password
			erb "sucessfully logged in"
		else
			redirect '/login'
		end
	else
		redirect '/login'
	end

end




