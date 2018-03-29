class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :image
      t.text :content
      t.integer :post_id 
      t.string :user_id
      t.integer :category_id
      
      t.timestamps
    end
  end
end
