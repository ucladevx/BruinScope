class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.integer :exp_rating
      t.text :experience
      t.text :question
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
