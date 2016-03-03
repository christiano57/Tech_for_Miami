class TeamsController < ApplicationController
	before_action :authenticate_user!
	def new
		@team = Team.find_by(team_lead_id: current_user.id)
		@acolytes = @team.generate_team_member_list(current_user)
	end

	def create
		# comes from ajax request where sr dev chooses project
		puts team_params
		if team_params
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

	def update		
		@team = Team.find_by(team_lead_id: current_user.id)
		@jrdev = User.find_by(id: assign_team_member_params[:jrdev_id])
		puts "*************"
		puts "*************"
		puts "*************"
		puts "*************"
		puts "*************"
		puts assign_team_member_params
		puts @jrdev
		if @jrdev.team_id == nil
			@jrdev.team_id = @team.id
			@jrdev.save
		else
			@jrdev.team_id = nil
			@jrdev.save
		end
		@project = Project.find_by(team_id: @team.id)
		@proposal = Proposal.find_by(id: @project.proposal_id)
		@non_profit = User.find_by(id: @proposal.user_id)
		@non_profit.team_id = current_user.team_id
		@non_profit.save
		@built_team = User.where(team_id: current_user.team_id)
		if @built_team.length > 2
			@team.built = true
			@team.save
		elsif @built_team.length <= 2
			@team.built = false
			@team.save
		end
		render json: @jrdev
	end


private
	def team_params
      params.require(:team).permit(:team_lead_id, :project_id)
    end

    def assign_team_member_params
    	params.require(:member_id).permit(:jrdev_id)
    end
end
