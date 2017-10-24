# simple active record migration
class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.integer :user_id, null: false
      t.string :title
      t.text :content
      t.timestamps null: false
    end
  end
end
