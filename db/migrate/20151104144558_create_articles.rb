class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :article_title
      t.integer :article_type
      t.text :article_content
      t.integer :aritle_read_times
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
