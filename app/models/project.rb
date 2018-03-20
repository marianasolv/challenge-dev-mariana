class Project < ApplicationRecord

	# Validates the attributes of Project
  	validates :name, :presence => true, :length => { :in => 3..30 }
  	validates :budget, :presence => true
  	validates :start_date, :presence => true

end
