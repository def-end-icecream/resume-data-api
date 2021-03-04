class CreateStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone_number
      t.text :short_bio
      t.string :linkedin_url
      t.string :twitter_handle
      t.string :personal_website_url
      t.string :resume
      t.string :github_url
      t.string :image_url

      t.timestamps
    end
  end
end
