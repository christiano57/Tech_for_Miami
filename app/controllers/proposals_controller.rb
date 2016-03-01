class ProposalsController < ApplicationController
	before_action :authenticate_user!

	def index

		@approved_proposals = Proposal.where(approval_status: true)
		@denied_proposals = Proposal.where(approval_status: false)
		@pending_proposals = Proposal.where(approval_status: nil)
		@user_proposals = Proposal.where(user_id: current_user.id)

		if current_user.has_role? :admin
			render 'index'
		else
			render 'user_index'
		end	
	end

	def new
		@proposal = Proposal.new
	end

	def create
		@proposal = Proposal.new(proposal_params)
		@proposal.user_id = current_user.id
	    if @proposal.save
	        redirect_to @proposal, alert: "proposal created successfully."
	    else
	        redirect_to new_user_path, alert: "Error creating proposal."
	    end
	end

	def show
		@proposal = Proposal.find_by(id: params[:id])
	end

	def approve
		proposal = Proposal.find_by(id: params[:id])
		proposal.approval_status = true
		proposal.save
		new_project = Project.new(
			name: proposal.name, 
			brief_description: proposal.brief_description,
			description: proposal.description, 
			timeline: proposal.timeline_days,
			proposal_id: proposal.id )
		new_project.save
		redirect_to ('/proposals')
	end

	def deny
		proposal = Proposal.find_by(id: params[:id])
		proposal.approval_status = false
		proposal.save
		redirect_to ('/proposals')
		
	end

	def reset
		proposal = Proposal.find_by(id: params[:id])
		proposal.approval_status = nil
		proposal.save
		Project.destroy_all(proposal_id: proposal.id)
		redirect_to ('/proposals')
	end

	private

	def proposal_params
      params.require(:proposal).permit(:name, :user_id, :description, :brief_description, :timeline_days)
    end
end
