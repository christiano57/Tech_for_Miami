class ProposalsController < ApplicationController
	def index
		@approved_proposals = Proposal.where(approval_status: true)
		@denied_proposals = Proposal.where(approval_status: false)
		@pending_proposals = Proposal.where(approval_status: nil)
	end

	def approve
		proposal = Proposal.find_by(id: params[:id])
		proposal.approval_status = true
		proposal.save
		redirect_to ('/project/new')
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
		redirect_to ('/proposals')
	end

	def new
		
	end

	def create
		
	end
end
