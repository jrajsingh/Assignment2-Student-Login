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
