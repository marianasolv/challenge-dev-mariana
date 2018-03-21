class Project < ApplicationRecord

	# Name can't be blank and also needs to be min 3 and max 30
	# Budget and Start date can't be blank
	# Description can be left in blank
	# User id can't be nil 
  	validates :name, :presence => true, :length => { :in => 3..30 }
  	validates :budget, :presence => true
  	validates :start_date, :presence => true
  	validates :user_id, :presence => true

end
