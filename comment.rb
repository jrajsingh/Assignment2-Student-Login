require 'dm-core'
require 'dm-migrations'

DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/databases/comment.db")

class Comment
  include DataMapper::Resource
  property :comment_id, Serial
  property :commenter_name, String
  property :time_created, String
  property :content, Text
end

DataMapper.finalize

get '/comment' do
  if params.length != 0
    name = params[:commenter_name].to_s
    content = params[:comment_content].to_s
    puts "Name = #{name}\n Content = #{content}\n\t\t" +
             "Comment.new(commenter_name: name, content: content, time_created: Time.now).save.to_s = #{Comment.new(commenter_name: name, content: content, time_created: Time.now).save.to_s}\n"
    # Comment.new(commenter_name: name, content: content, time_created: Time.now).save.to_s
    # url.sub(/\?$/,'')
    # print "Redirecting to URL : #{url.to_s}"
    # redirect url
  end

  @my_comment = Comment.all
  if @my_comment.empty?
    @my_comment = nil
  end

  erb :comment, :layout => :comment_layout
end
