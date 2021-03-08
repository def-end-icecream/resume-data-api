class CreateEducations < ActiveRecord::Migration[6.0]
  def change
    create_table :educations do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.string :degree
      t.string :university_name
      t.string :details

      t.timestamps
    end
  end
end
