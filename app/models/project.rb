class Project < ApplicationRecord

	# Name can't be blank and also needs to be min 3 and max 30
	# Budget and Start date can't be blank
	# Description can be left in blank
	# User id can't be nil 
	# Name and description must be unique. Can't have two projects that are the same

  	validates :name, :presence => true, :uniqueness => true, :length => { :in => 3..30 }
  	validates :description, :uniqueness => true
  	validates :budget, :presence => true
  	validates :start_date, :presence => true
  	validates :user_id, :presence => true

end
