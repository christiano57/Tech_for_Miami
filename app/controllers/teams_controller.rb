class TeamsController < ApplicationController
	before_action :authenticate_user!
	def new
		@acolytes = []
		users = User.all
		users.each do |user|
			if user.has_role?(:acolyte)
				@acolytes.push(user)
			end
		end
		puts @acolytes
	end

	def create
		# comes from ajax request where sr dev chooses project
		if team_params != nil
			puts "********************"
			puts "********************"
			puts "********************"
			puts "********************"
			puts "********************"
			puts "********************"
			puts "********************"
			puts "********************"
			puts "********************"
			puts "********************"
			puts "********************"
			puts "********************"
			puts "********************"
			puts "********************"
			puts "********************"
			puts "********************"
			puts "********************"
			@team = Team.new(team_params)
			if @team.save
				@project = Project.find(team_params[:project_id])
				@project.team_id = @team.id
				@project.save
				current_user.team_id = @team.id
				current_user.save
				render json: @project
			end
		end
	end
private
	def team_params
      params.require(:team).permit(:team_lead_id, :project_id)
    end
end
