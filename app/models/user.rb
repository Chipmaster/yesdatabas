class User < ActiveRecord::Base
	def self.authenticate(email, password)
		user = self.find_by_email_and_password(email, password)
	end
	validates_length_of :email, :within => 3..40
	validates_length_of :password, :within => 5..40
	validates_presence_of :email, :password, :firstname, :lastname
	validates_uniqueness_of :email
	validates_confirmation_of :password
	validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, :message => "Invalid email"
end
