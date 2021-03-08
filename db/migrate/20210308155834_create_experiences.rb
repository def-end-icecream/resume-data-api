class CreateExperiences < ActiveRecord::Migration[6.0]
  def change
    create_table :experiences do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.string :job_title
      t.string :company_name
      t.string :details

      t.timestamps
    end
  end
end
