class AddColumnsToProposal < ActiveRecord::Migration
  def change
    add_column :proposals, :name, :string
    add_column :proposals, :description, :text
    add_column :proposals, :timeline_days, :integer
    add_column :proposals, :accepted_by, :string
    add_column :proposals, :approval_status, :boolean
  end
end
