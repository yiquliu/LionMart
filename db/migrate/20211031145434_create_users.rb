class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.datetime :created_at
      t.string :google_id
      t.string :user_name
      t.string :email
    end
  end
end
