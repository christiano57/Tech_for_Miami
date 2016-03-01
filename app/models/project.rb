class Project < ActiveRecord::Base
	belongs_to :team
	belongs_to :proposal

	
end
