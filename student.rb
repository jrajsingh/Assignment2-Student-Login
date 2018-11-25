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
  property :gpa, Float
end

DataMapper.finalize


get '/students' do
  if params.length != 0
    id_num = params[:student_id]
    first_name = params[:student_first_name]
    last_name = params[:student_last_name]
    birthday = params[:student_birthday]
    address = params[:student_address]
    gpa = params[:student_gpa]
    Student.new(id_num: id_num, first_name: first_name, last_name: last_name, birthday: birthday, address: address, gpa: gpa).save
    url.sub(/\?$/, '')
    puts "Redirect to #{url.to_s}"
    redirect url
  end
  @my_students = Student.all
  erb :student, :layout => :student_layout
end

get '/students_display' do
  student_id = params[:student_id]
  @display_student = Student.all(id_num: student_id.to_i)
  erb :student_display, :layout => :student_display_layout
end

get '/students_edit' do
  if params.length == 1
    student_id = params[:student_id]
    @edit_student = Student.all(id_num: student_id)[0]
    erb :student_edit, :layout => :student_edit_layout
  else
    student_id = params[:student_id].to_s
    first_name = params[:student_first_name].to_s
    last_name = params[:student_last_name].to_s
    birthday = params[:student_birthday].to_s
    address = params[:student_address].to_s
    gpa = params[:student_gpa].to_s
    Student.all(id_num: student_id)[0].destroy
    Student.new(id_num: student_id, first_name: first_name, last_name: last_name, birthday: birthday, address: address, gpa: gpa).save
    redirect '/students'
  end
end

get '/students_delete' do
  student_id = params[:student_id]
  Student.all(id_num: student_id.to_i)[0].destroy
  redirect '/students'
end