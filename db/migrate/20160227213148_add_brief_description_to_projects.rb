class AddBriefDescriptionToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :brief_description, :text
  end
end
