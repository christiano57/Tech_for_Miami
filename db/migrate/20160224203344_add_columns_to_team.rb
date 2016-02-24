class AddColumnsToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :team_lead_id, :integer
  end
end
