class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :image
      t.string :title
      t.string :translation
      t.text :content

      t.timestamps null: false
    end
  end
end
