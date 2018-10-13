class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :body, null: false

      t.string :author_ip, null: false
      t.belongs_to :author, foreign_key: true

      t.float :average_rating, null: false, default: 1

      t.timestamps
    end

    add_index :posts, :average_rating, order: { average_rating: :desc }
  end
end
