class AddBriefDescriptionToProposals < ActiveRecord::Migration
  def change
    add_column :proposals, :brief_description, :text
  end
end
