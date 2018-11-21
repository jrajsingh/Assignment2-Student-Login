require "dm-core"
require "dm-migrations" 

#Dir.pwd is class method of Dir

DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/song.db")

class Song
  include DataMapper::Resource
  property :id, Serial
  property :title, String
  property :lyrics, Text
  property :length, Integer
  property :release, Date
end

DataMapper.finalize
