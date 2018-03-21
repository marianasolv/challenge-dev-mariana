class Bug < ApplicationRecord

	# Name and description must be unique to make sure that all bugs are different
	validates :name, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
	validates :description, :uniqueness => true

	# Can exists different bugs with the same type. Also can exists different bugs in the same project
	validates :bug_type, :presence => true, :length => { :in => 3..30 }
	validates :project_id, :presence => true
end
