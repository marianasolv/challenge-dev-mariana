class User < ApplicationRecord
	# Validates the password, ensures that password and password confirmation are equal and that password is not blank
	has_secure_password

	EMAIL_REGEX = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\Z/i

	# Name can't be blank and length needs to be min 3 and max 20.
	# Email can't be blanck, must be unique and have the correct format
  	validates :name, :presence => true, :length => { :in => 3..20 }
  	validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
end
