require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt

  #Create password hash based on password
  def password
    @password ||= Password.new(self.password_hash)
  end

  #Check that a password hash matches the hashed password
  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  #Authenticate user
  def self.authenticate(email, password)
    if user = self.find_by_email(email)
      user = nil if user.password != password
    end
    user
  end

  #Ensure email and password conforms to some requirements
  validates_length_of :email, :within => 3..40
  validates_presence_of :email, :password_hash
  validates_uniqueness_of :email
  validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, :message => "Invalid email"
  has_many :data_fields
end
