class RenameSkillNamesToNames < ActiveRecord::Migration[6.0]
  def change
    rename_column :skills, :skill_name, :name
  end
end
