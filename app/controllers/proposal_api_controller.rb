class ProposalApiController < ApplicationController
	def index
		proposals = Proposal.all
		render json: proposals
	end

	def show
		proposal = Proposal(id: params(:id))
		render json: proposal
	end

end
