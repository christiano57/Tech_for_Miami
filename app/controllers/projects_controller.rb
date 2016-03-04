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
		if current_user.has_role? :wizard
			@team = Team.find_by(team_lead_id: current_user.id)
		elsif current_user.has_role? :acolyte
			@team = Team.find_by(id: current_user.team_id)
		end
		if @team != nil
			@team_members = User.where(team_id: @team.id)
		end
	end
end

