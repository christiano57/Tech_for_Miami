class ProjectsController < ApplicationController
	before_action :authenticate_user!

	def index
		if current_user.has_role? :non_profit
			@projects = current_user.user_projects
		elsif current_user.has_role? :wizard
			@projects = Project.where(team_id: nil)
		elsif current_user.has_role? :admin
			@projects = Project.all
		end
	end

	def show
		@project = Project.find(params[:id])
		@team = Team.find_by(team_lead_id: current_user.id)
		
	end
end

