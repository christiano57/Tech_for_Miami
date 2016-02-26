class AddColumnsToProject < ActiveRecord::Migration
  def change
    add_column :projects, :name, :string
    add_column :projects, :description, :text
    add_column :projects, :timeline, :integer
  end
end
