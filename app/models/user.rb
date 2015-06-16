class User < ActiveRecord::Base

	def to_param
		"#{id} #{name}".parameterize
	end

	has_secure_password
	
	validates_presence_of :name,:email,:gamertag
	validates_format_of :email, with: /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
	validates_uniqueness_of :email

end