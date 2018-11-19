# This file includes the structure of the different objects I plan on using for my implementation
class Student
	include ERB::Util
	attr_accessor :first_name, :last_name, :birthday, :address, :student_id, :graduation_date

	def initialize(first_name, last_name, birthday, address, student_id, graduation_date)
		@first_name = first_name
		@last_name = last_name
		@birthday = birthday
		@address = address
		@student_id = student_id
		@graduation_date = graduation_date
	end

	def render
		binding
	end
end

class Comments
	include ERB::Util
	attr_accessor :commenter, :time_created, :comment_content

	def initialize(commenter, time_created, comment_content)
		@commenter = commenter
		@time_created = time_created
		@comment_content = comment_content
	end

	def render
		binding
	end
end