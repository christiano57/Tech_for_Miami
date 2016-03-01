class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  rolify strict: true

  def user_projects
		@projects = []
		@proposals = Proposal.where(user_id: self.id)
		@proposals.each do |proposal|
		next_project = Project.find_by(proposal_id: proposal.id)
		@projects.push(next_project)
		end	
		return @projects
	end
end
