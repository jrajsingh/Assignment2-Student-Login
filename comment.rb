require 'dm-core'
require 'dm-migrations'
DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3:databases.db")
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
    print "Name = #{name}\n Content = #{content}\n\t\t" +
             "Comment.new(commenter_name: name, content: content, time_created: Time.now).save.to_s = #{Comment.new(commenter_name: name, content: content, time_created: Time.now).save.to_s}\n"
    # Comment.new(commenter_name: name, content: content, time_created: Time.now).save.to_s
    url.sub(/\?$/,'')
    print "Redirecting to URL : #{url.to_s}"
    redirect url
  end

  @my_comment = Comment.all
  if @my_comment.length == 0
    puts "my_comment is empty"
    @my_comment = nil
  end

  erb :comment, :layout => :comment_layout
end

get '/comment_delete' do
  comment_id = params[:comment_id]
  Comment.all(comment_id: comment_id.to_i)[0].destroy
  redirect '/comment'
end
