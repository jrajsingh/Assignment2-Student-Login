require "dm-core"
require "dm-migrations"

DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/databases.db")

class Student
  include DataMapper::Resource
  property :id_num, Serial
  property :first_name, String
  property :last_name, String
  property :birthday, Date
  property :address, Text
end

DataMapper.finalize


get '/students' do
  if params.length != 0
    id_num = params[:student_id]
    first_name = params[:student_first_name]
    last_name = params[:student_last_name]
    birthday = params[:student_birthday]
    address = params[:student_address]
    url.sub(/\?$/,'')
    p url.to_s
    redirect url
  end
  @my_students = Student.all
  erb :student, :layout => :student_layout

end