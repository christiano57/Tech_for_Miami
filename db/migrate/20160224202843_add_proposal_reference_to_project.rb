class AddProposalReferenceToProject < ActiveRecord::Migration
  def change
    add_reference :projects, :proposal, index: true, foreign_key: true
  end
end
