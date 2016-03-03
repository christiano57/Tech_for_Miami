class AddTeamBuiltToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :built, :boolean
  end
end
