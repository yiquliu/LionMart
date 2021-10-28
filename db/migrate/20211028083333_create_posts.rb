class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.datetime :created_at
      t.datetime :updated_at
      t.string :title, null: false
      t.text :description
      t.decimal :price
      t.string :post_by
    end
  end
end
