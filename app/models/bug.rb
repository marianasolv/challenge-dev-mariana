class Bug < ApplicationRecord

	# Name and description must be unique to make sure that all bugs are different
	validates :name, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
	validates :description, :uniqueness => true
	validates :bug_type, :presence => true, :length => { :in => 3..30 }

	# One bug must belongs to only one project. Can't have the same bug beloging to different projects
	validates :project_id, :presence => true, :uniqueness => true
end
