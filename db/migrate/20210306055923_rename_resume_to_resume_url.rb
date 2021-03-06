class RenameResumeToResumeUrl < ActiveRecord::Migration[6.0]
  def change
    rename_column :students, :resume, :resume_url
  end
end
