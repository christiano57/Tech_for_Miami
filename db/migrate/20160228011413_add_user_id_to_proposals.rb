class AddUserIdToProposals < ActiveRecord::Migration
  def change
    add_reference :proposals, :user, index: true, foreign_key: true
  end
end
